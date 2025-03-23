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

###########################################
##### Подключение файлов с функциями ######
###########################################

#подключение файла с удобными функциями
import function as func

###########################################
############# Страницы сайта ##############
###########################################

def all_devices():
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    con_db = func.connect_to_db('engineer')
    cursor  = con_db.cursor()

    cursor.execute('SELECT Device_ID FROM ENG_DEVICE')
    devices = cursor.fetchall()[0]
    devices_select={
        'name': 'SELECT Device_Name FROM ENG_DEVICE WHERE'
    }
    devices_data = []

    for device in devices:
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
    print(devices_data)
    return render_template("engineer/devices.html", devices_data=devices_data)