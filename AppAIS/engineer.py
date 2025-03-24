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
                'count': 'SELECT Device_Component_Count FROM ENG_DEVICE WHERE Device_ID =\'' + str(device) + '\'',
                'TP': 'SELECT Device_TechProcess_ID FROM ENG_DEVICE WHERE Device_ID =\'' + str(device) + '\''
            }
            device_data={'name': '','about': '','count': '','TP': '', 'id': ''}
            device_data['id'] = device
            for i in device_select:
                cursor.execute(device_select[i])
                device_data[i] = cursor.fetchall()[0][0]
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
                cursor.execute('INSERT INTO ENG_DEVICE (Device_ID, Device_Name, Device_About, Device_Component_Count, Device_TechProcess_ID) \
                            VALUES (S_ENG_DEVICE.NEXTVAL, \''+request.form['device_name']+'\', \''+ request.form['device_about']+'\',0,\'\')')
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
        'count': 'SELECT Device_Component_Count FROM ENG_DEVICE WHERE Device_ID =\'' + id + '\'',
        'TP': 'SELECT Device_TechProcess_ID FROM ENG_DEVICE WHERE Device_ID =\'' + id + '\''
    }
    device_data={'name': '','about': '','count': '','TP': '', 'id': ''}
    for req in device_select:
        cursor.execute(device_select[req])
        device_data[req] = cursor.fetchall()[0][0]
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
    cursor.close()
    con_db.close()
    return render_template("engineer/device.html", role=role, device_data=device_data, components_data=components_data)