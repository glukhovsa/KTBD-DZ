###########################################
######### Подключение библиотек ###########
###########################################

#библиотека работы  c Flask
from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
from flask import make_response
from flask import send_file

#библиотека для работы с Oracle
import cx_Oracle

#библиотека работы в QR
from flask_qrcode import QRcode

#библиотека для работы с xls
import xlsxwriter

###########################################
##### Подключение файлов с функциями ######
###########################################

#подключение файла с удобными функциями
import function as func

###########################################
############# Страницы сайта ##############
###########################################

#страница со списком всех устройств
def all_devices():
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    devices_data = []
    cursor.execute('SELECT Device_ID FROM ENG_DEVICE')
    devices = cursor.fetchall()
    if len(devices) > 0:
        for device in devices:
            device = device[0]
            device_select={
                'name': 'SELECT Device_Name FROM ENG_DEVICE WHERE Device_ID =\'' + str(device) + '\'',
                'about': 'SELECT Device_About FROM ENG_DEVICE WHERE Device_ID =\'' + str(device) + '\'',
                'count': 'SELECT COUNT(Component_ID) FROM ENG_COMPONENT WHERE Component_Device_ID =\'' + str(device) + '\'',
                'TP': 'SELECT TP_ID FROM COM_TP_DEV WHERE Dev_ID =\'' + str(device) + '\''
            }
            device_data={'name': '','about': '','count': '','TP': '', 'id': ''}
            device_data['id'] = device
            for i in device_select:
                cursor.execute(device_select[i])
                device_data[i] = cursor.fetchall()
                if len(device_data[i]) != 0:
                    device_data[i]=device_data[i][0][0]
            devices_data.append(device_data)
    
    cursor.close()
    con_db.close()

    return render_template("engineer/devices.html", devices_data=devices_data, role=func.get_role(request.cookies.get('auth_login')))

#Страница удаления устройства
def delete_device(id):
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))
    if not(role == 'engineer' or role== 'director'):
        return redirect('/all_devices')
    else:
        con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
        cursor = con_db.cursor()
        cursor.execute('DELETE FROM ENG_COMPONENT WHERE Component_Device_ID = ' + str(id))
        cursor.execute('DELETE FROM ENG_DEVICE WHERE Device_ID = ' + str(id))
        con_db.commit()
        cursor.close()
        con_db.close()
        return redirect('/all-devices')

#страница добавления устройства
def add_device():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'engineer' or role == 'director':
            cursor.execute('SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = \''+request.form['device_name']+'\'')
            result=cursor.fetchall()
            if len(result) == 0:
                cursor.execute('INSERT INTO ENG_DEVICE (Device_ID, Device_Name, Device_About) \
                            VALUES (S_ENG_DEVICE.NEXTVAL, \''+request.form['device_name']+'\', \''+ request.form['device_about']+'\')')
                con_db.commit()
    
    
    cursor.close()
    con_db.close()

    return redirect('/all-devices')

#Страница каждого устройства
def device(id):
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    role = func.get_role(request.cookies.get('auth_login'))
    
    con_db = func.connect_to_db(role)
    cursor = con_db.cursor()

    cursor.execute('SELECT Device_Name FROM ENG_DEVICE WHERE Device_ID =\'' + id + '\'')
    if len(cursor.fetchall()[0]) != 1:
        return redirect('/all-devices')

    device_select={
        'name': 'SELECT Device_Name FROM ENG_DEVICE WHERE Device_ID =\'' + id + '\'',
        'about': 'SELECT Device_About FROM ENG_DEVICE WHERE Device_ID =\'' + id + '\'',
        'count': 'SELECT COUNT(Component_ID) FROM ENG_COMPONENT WHERE Component_Device_ID =\'' + id + '\'',
        'TP': 'SELECT TP_ID FROM COM_TP_DEV WHERE Dev_ID =\'' + id + '\''
    }
    device_data={'name': '','about': '','count': '','TP': '', 'id': ''}
    for req in device_select:
        cursor.execute(device_select[req])
        device_data[req] = cursor.fetchall()
        if len(device_data[req]) != 0:
            device_data[req]=device_data[req][0][0]
    device_data['id'] = id

    cursor.execute('SELECT Component_ID FROM ENG_Component WHERE Component_Device_ID =\'' + id + '\'')
    components = cursor.fetchall()
    components_data=[]
    if device_data['count'] > 0:
        for component in components:
            component = component[0]
            component_select={
                'designator': 'SELECT Component_Designator FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\'',
                'partnumber': 'SELECT Component_PartNumber FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID =\
                    (SELECT Component_ID_in_Lib FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\')',
                'nominal': 'SELECT Component_Nominal FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\'',
                'installation': 'SELECT Component_Instalation FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID =\
                    (SELECT Component_ID_in_Lib FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\')',
                'manufacturer': 'SELECT Component_Manufacturer FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID =\
                    (SELECT Component_ID_in_Lib FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\')'
            }
            component_data = {'id': '','designator': '', 'partnumber': '', 'nominal' : '', 'installation': '', 'manufacturer':''}
            component_data['id'] = component

            for i in component_select:
                cursor.execute(component_select[i])
                component_data[i] = cursor.fetchall()[0][0]
            components_data.append(component_data)
    

    
    cursor.execute('SELECT Lib_Component_ID, Component_PartNumber FROM ENG_COMPONENT_LIB')
    components_lib = cursor.fetchall()

    cursor.close()
    con_db.close()
    return render_template("engineer/device.html", role=role, device_data=device_data, components_data=components_data, 
                           qr='http://localhost:5000/techical-process/'+str(device_data['TP']), components_lib=components_lib)

#удаление компонента из устройства
def delete_component(id):
        #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor = con_db.cursor()
    cursor.execute('SELECT Component_Device_ID FROM ENG_COMPONENT WHERE Component_ID = '+ id)
    redir = cursor.fetchall()
    if redir != []:
        print(redir)
        redir=redir[0][0]

        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'engineer' or role== 'director':
            cursor.execute('DELETE FROM ENG_COMPONENT WHERE Component_ID = ' + id)
            con_db.commit()
            cursor.close()
            con_db.close()
    
    return redirect('/device/'+str(redir))

#добавление компонента в устройство
def add_component(id_device):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'engineer' or role == 'director':
            cursor.execute('SELECT Component_ID FROM ENG_COMPONENT WHERE Component_Device_ID = \''+id_device+'\' AND Component_Designator = \'' 
                           + request.form['component_designator'] + '\'')
            result=cursor.fetchall()
            if len(result) == 0:
                cursor.execute('INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, \
                               Component_Device_ID, Component_Designator, Component_Nominal) \
                               VALUES (S_ENG_COMPONENT.NEXTVAL, \''+request.form['component_partnumber']+'\', \''+ id_device +'\',\''+
                               request.form['component_designator']+'\',\''+request.form['component_nominal']+'\')')
                con_db.commit()
    
    
    cursor.close()
    con_db.close()

    return redirect('/device/'+id_device)

#генерация списка компонентов excel
def generate_xls(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    cursor.execute('SELECT Device_Name FROM ENG_DEVICE WHERE Device_ID =\'' + id + '\'')
    device_data = cursor.fetchall()[0]
    if len(device_data) != 1:
        return redirect('/all-devices')

    cursor.execute('SELECT Component_ID FROM ENG_Component WHERE Component_Device_ID =\'' + id + '\'')
    components = cursor.fetchall()
    components_data=[]
    for component in components:
        component = component[0]
        component_select={
            'designator': 'SELECT Component_Designator FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\'',
            'partnumber': 'SELECT Component_PartNumber FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID =\
                (SELECT Component_ID_in_Lib FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\')',
            'nominal': 'SELECT Component_Nominal FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\'',
            'installation': 'SELECT Component_Instalation FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID =\
                (SELECT Component_ID_in_Lib FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\')',
            'manufacturer': 'SELECT Component_Manufacturer FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID =\
                (SELECT Component_ID_in_Lib FROM ENG_COMPONENT WHERE Component_ID =\'' + str(component) + '\')'
        }
        component_data = {'id': '','designator': '', 'partnumber': '', 'nominal' : '', 'installation': '', 'manufacturer':''}
        component_data['id'] = component

        for i in component_select:
            cursor.execute(component_select[i])
            component_data[i] = cursor.fetchall()[0][0]
        components_data.append(component_data)
    
    cursor.close()
    con_db.close()
    
    pe3 =[]
    for i in components_data:
        flag = True
        for j in pe3:
            if j['partnamber'] == i['partnumber'] and j['nominal']==i['nominal']:
                j['designators'] += (', ' + i['designator'])
                j['count'] += 1
                flag = False
        if flag:
            pe3.append({
                'partnamber': i['partnumber'],
                'nominal': i['nominal'],
                'count': 1,
                'designators': i['designator'],
                'manufacturer': i['manufacturer']
                })
    workbook = xlsxwriter.Workbook('temp/PE3.xlsx')
    worksheet = workbook.add_worksheet()

    cell_format1 = workbook .add_format({'text_wrap': True,
                              'valign': 'top',
                              'align': 'center',
                              'font_size': 12,
                              'font_name': 'Times New Roman',
                              'border' : True})
    cell_format1.set_text_wrap()
    cell_format2 = workbook .add_format({'text_wrap': True,
                              'valign': 'top',
                              'align': 'left',
                              'font_size': 12,
                              'font_name': 'Times New Roman',
                              'border' : True})
    cell_format1.set_text_wrap()
    worksheet.set_column('A:A', 10)
    worksheet.set_column('B:B', 40)
    worksheet.set_column('C:C', 5)
    worksheet.set_column('D:D', 10)


    worksheet.write('A1', 'Поз. обозначение', cell_format1)
    worksheet.write('B1', 'Наименование', cell_format1)
    worksheet.write('C1', 'Кол.', cell_format1)
    worksheet.write('D1', 'Примечание', cell_format1)

    for i in range(len(pe3)):
        worksheet.write('A'+str(i+2), pe3[i]['designators'], cell_format1)
        if pe3[i]['nominal'] == None:
            worksheet.write('B'+str(i+2), pe3[i]['partnamber'] + ' (' + pe3[i]['manufacturer'] + ')', cell_format2)
        else:
            worksheet.write('B'+str(i+2), pe3[i]['partnamber'] + ' ' + pe3[i]['nominal'] + ' (' + pe3[i]['manufacturer'] + ')', cell_format2)
        worksheet.write('C'+str(i+2), pe3[i]['count'], cell_format1)
        worksheet.write('D'+str(i+2), '', cell_format1)
    workbook.close()
    return send_file('temp/PE3.xlsx', as_attachment=True)

#страница библиотеки компонентов
def component_lib():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    role = func.get_role(request.cookies.get('auth_login'))

    con_db = func.connect_to_db(role)
    cursor = con_db.cursor()

    cursor.execute('SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB')
    components = cursor.fetchall()
    components_data=[]

    if len(components) > 0:
        for id in components:
            id = id[0]
            component_select={
                'partnumber': 'SELECT Component_PartNumber FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID = '+ str(id),
                'class': 'SELECT Class_Name FROM ENG_COMPONENT_CLASS WHERE Class_ID = (SELECT Component_Class_ID FROM ENG_COMPONENT_LIB \
                    WHERE Lib_Component_ID = '+ str(id)+')',
                'installation': 'SELECT Component_Instalation FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID ='+ str(id),
                'manufacturer': 'SELECT Component_Manufacturer FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID ='+ str(id),
                'pad_count' : 'SELECT Component_Count_Pad FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID ='+ str(id)
            }
            component_data = {'id': id, 'partnumber': '', 'class' : '', 'installation': '', 'manufacturer':'', 'pad_count':''}
            for i in component_select:
                cursor.execute(component_select[i])
                component_data[i] = cursor.fetchall()[0][0]
            components_data.append(component_data)

    classes = []

    if role == 'engineer' or role== 'director':
        cursor.execute('SELECT Class_ID, Class_Name FROM ENG_COMPONENT_CLASS')
        classes = cursor.fetchall()
    
    cursor.close()
    con_db.close()
    
    return render_template("engineer/component_lib.html", role=role, components_data=components_data, classes=classes)

#удаление компонента из библиотеки
def delete_component_lib(id):
        #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor = con_db.cursor()

    role = func.get_role(request.cookies.get('auth_login'))
    if role == 'engineer' or role== 'director':
        cursor.execute('DELETE FROM ENG_COMPONENT_LIB WHERE Lib_Component_ID = ' + id)
        con_db.commit()
        cursor.close()
        con_db.close()
    
    return redirect('/component-lib')

#добавление компонента в библиотеку
def add_device_lib():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'engineer' or role == 'director':
            cursor.execute('SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = \'' 
                           + request.form['component_partnumber'] + '\'')
            result=cursor.fetchall()
            if len(result) == 0:
                cursor.execute('INSERT INTO ENG_COMPONENT_LIB \
                               (Lib_Component_ID, \
                               Component_Class_ID, \
                               Component_PartNumber, \
                               Component_Instalation,\
                               Component_Manufacturer, \
                               Component_Count_Pad) '
                               'VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, \
                               \''+ request.form['component_class'] +'\',\
                                \''+request.form['component_partnumber'] + '\', \
                                \''+request.form['component_installation'] + '\', \
                                \''+request.form['component_manufacturer'] + '\', \
                                '+request.form['component_count'] + ')')
                con_db.commit()
    
    
    cursor.close()
    con_db.close()

    return redirect('/component-lib')

#страница помощи для инженеров
def engineer_help():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    gosts_data = []

    cursor.execute('SELECT GOST_ID FROM ENG_HELP_GOSTS')
    gosts = cursor.fetchall()
    if len(gosts) > 0:
        for gost in gosts:
            gost = gost[0]
            gost_select={
                'designator': 'SELECT GOST_Number FROM ENG_HELP_GOSTS WHERE GOST_ID =\'' + str(gost) + '\'',
                'name': 'SELECT GOST_Name FROM ENG_HELP_GOSTS WHERE GOST_ID =\'' + str(gost) + '\''
            }
            gost_data={'name': '','designator': '', 'id': str(gost)}
            for i in gost_select:
                cursor.execute(gost_select[i])
                gost_data[i] = cursor.fetchall()[0][0]
            gosts_data.append(gost_data)

    cursor.close()
    con_db.close()

    return render_template("engineer/eng_help.html", gosts_data=gosts_data, role=func.get_role(request.cookies.get('auth_login')))