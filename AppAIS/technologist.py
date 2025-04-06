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

#страница со списком всех тех процессов
def processes():
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    processes_data = []
    cursor.execute('SELECT Process_ID FROM TCHG_PROCESS')
    tp_processes = cursor.fetchall()
    if len(tp_processes) > 0:
        for process in tp_processes:
            process = process[0]
            process_data={'id': '', 'note':''}
            process_data['id'] = process
            cursor.execute('SELECT Process_Note FROM TCHG_PROCESS WHERE Process_ID = '+ str(process))
            process_data['note'] = cursor.fetchall()[0][0]
            processes_data.append(process_data)
    
    cursor.close()
    con_db.close()

    return render_template("technologist/processes.html", processes_data=processes_data, role=func.get_role(request.cookies.get('auth_login')))

#удаление процесса
def delete_process(id):
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))
    if not(role == 'technologist' or role== 'director'):
        return redirect('/tech-processes')
    else:
        con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
        cursor = con_db.cursor()
        cursor.execute('DELETE FROM TCHG_PROCESS WHERE Process_ID = ' + str(id))
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_ID = ' + str(id))
        con_db.commit()
        cursor.close()
        con_db.close()
        return redirect('/tech-processes')

#добавление устройства
def add_process():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'technologist' or role == 'director':
            cursor.execute('INSERT INTO TCHG_PROCESS (Process_ID, Process_Note) \
                        VALUES (S_TCHG_PROCESS.NEXTVAL, \''+request.form['process_note']+'\')')
            con_db.commit()  
    cursor.close()
    con_db.close()

    return redirect('/tech-processes')

#страница каждого процесса
def process(id):
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    role = func.get_role(request.cookies.get('auth_login'))
    
    if request.method=='POST':
        group_t = request.form['group']
    else:
        group_t = "1"
    con_db = func.connect_to_db(role)
    cursor = con_db.cursor()

    process_data={'id': '', 'note':''}
    process_data['id'] = id
    cursor.execute('SELECT Process_Note FROM TCHG_PROCESS WHERE Process_ID =\'' + id + '\'')
    process_data['note'] = cursor.fetchall()[0][0]
    if len(process_data['note']) == 0:
        return redirect('/tech-processes')

    cursor.execute('SELECT Process_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_ID =\'' + id + '\'')
    operations = cursor.fetchall()
    operations_data=[]
    j = 5
    for operation in operations:
        operation = operation[0]
        operation_select={
            'about': 'SELECT Operation_About FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation), 
            'gost_number' : 'SELECT Operation_Number FROM TCHG_OPERATION_LIST WHERE Operation_ID = \
                (SELECT GOST_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation)+')',
            'gost_name' : 'SELECT Operation_Name FROM TCHG_OPERATION_LIST WHERE Operation_ID = \
                (SELECT GOST_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation)+')',
            'gost_group' : 'SELECT Group_Number FROM TCHG_OPERATION_GROUP WHERE Group_ID = \
                (SELECT Operation_Group_ID FROM TCHG_OPERATION_LIST WHERE Operation_ID = \
                (SELECT GOST_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation)+'))', 
            'time': 'SELECT Operation_Time FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation), 
            'tools': 'SELECT Tool_Name FROM TCHG_TOOLS WHERE Tool_ID = (SELECT Operation_Tools_ID FROM \
                TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation)+')'
            }
        operation_data = {'id': '','number': '', 'about': '', 'gost_number' : '', 'gost_name' : '', 'gost_group' : '', 'tools': '', 'time':''}
        operation_data['id'] = operation
        for i in operation_select:
            cursor.execute(operation_select[i])
            operation_data[i] = cursor.fetchall()[0][0]
        operation_data['number']=j
        j+=5
        operations_data.append(operation_data)
    
    for i in operations_data:
        if i['gost_number']<10:
            i['gost_number'] = '0' + str(i['gost_number'])
        else:
            i['gost_number'] = str(i['gost_number'])
        if i['gost_group']<10:
            i['gost_group'] = '0' + str(i['gost_group'])
        else:
            i['gost_group'] = str(i['gost_group'])

    
    cursor.execute('SELECT Group_ID, Group_Name, Group_Number FROM TCHG_OPERATION_GROUP')
    group_lib = cursor.fetchall()

    cursor.execute('SELECT Operation_Number, Operation_Name FROM TCHG_OPERATION_LIST WHERE Operation_Group_ID = \
                   (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ' + str(group_t) + ')')
    operation_lib = cursor.fetchall()
    if len(group_t) == 1:
        group_t = "0"+group_t
    cursor.close()
    con_db.close()
    return render_template("technologist/process.html", role=role, process_data=process_data, operations_data=operations_data, group_lib=group_lib,
                           group_t=group_t, operation_lib=operation_lib)

#удаление операции из процесса
def delete_operation(id):
        #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor = con_db.cursor()
    cursor.execute('SELECT Process_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ id)
    redir = cursor.fetchall()
    if redir != []:
        redir=redir[0][0]

        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'technologist' or role== 'director':
            cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ id)
            con_db.commit()


        cursor.close()
        con_db.close()
    
        return redirect('/process/'+str(redir))
    cursor.close()
    con_db.close()
    return redirect('/processes')

#добавление операции в процесс
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