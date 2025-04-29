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
import tempfile

#библиотека для работы с Oracle
import oracledb

#библиотека работы в QR
from flask_qrcode import QRcode

#библиотека для работы с pdf
from fpdf import FPDF

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
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_ID = ' + str(id))
        cursor.execute('DELETE FROM COM_TP_DEV WHERE TP_ID = ' + str(id))
        cursor.execute('DELETE FROM TCHG_PROCESS WHERE Process_ID = ' + str(id))
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

    cursor.execute('SELECT Process_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_ID =' + id + ' ORDER BY Process_Operation_ID')
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

    cursor.execute('SELECT Operation_ID, Operation_Number, Operation_Name FROM TCHG_OPERATION_LIST WHERE Operation_Group_ID = \
                   (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ' + str(group_t) + ')')
    operation_lib = cursor.fetchall()
    if len(group_t) == 1:
        group_t = "0"+group_t

    cursor.execute('SELECT Tool_ID, Tool_Name FROM TCHG_TOOLS')
    tools_lib = cursor.fetchall()

    cursor.execute('SELECT Device_ID, Device_Name FROM ENG_DEVICE')
    device_lib = cursor.fetchall()

    cursor.close()
    con_db.close()
    return render_template("technologist/process.html", role=role, process_data=process_data, operations_data=operations_data, group_lib=group_lib,
                           group_t=group_t, operation_lib=operation_lib, tools_lib=tools_lib, device_lib=device_lib, length=len(operations_data))

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
def add_operation(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'technologist' or role == 'director':
            cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, '+ str(id) +', '+request.form['operation_gost']+', \''+request.form['operation_about']+'\', '+request.form['operation_time']+', '+request.form['operation_tool']+')')
            con_db.commit()


    cursor.close()
    con_db.close()

    return redirect('/process/'+id)

#добавление ТП к устройству
def tp_to_device(id_tp):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    con_db = func.connect_to_db(func.get_role(role))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        if role == 'technologist' or role == 'director':
            cursor.execute('DELETE FROM COM_TP_DEV WHERE Dev_ID = '+ request.form['device_id']+'')
            cursor.execute('INSERT INTO COM_TP_DEV (TPDEV_Link_ID, TP_ID, Dev_ID) VALUES (S_COM_TP_DEV.NEXTVAL, '+ str(id_tp) +', '+request.form['device_id']+')')
            con_db.commit()


    cursor.close()
    con_db.close()

    return redirect('/device/'+request.form['device_id'])

#перемещение операции выше
def operation_high(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    if role == 'technologist' or role == 'director':
        con_db = func.connect_to_db(func.get_role(role))
        cursor  = con_db.cursor()

        cursor.execute('SELECT MAX(Process_Operation_ID) FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID < '+ str(id)+' AND Process_ID = \
                       (SELECT Process_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id)+')')
        id_2 = cursor.fetchall()[0][0]

        cursor.execute('SELECT Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id))
        operation_1 = cursor.fetchall()[0]
        cursor.execute('SELECT Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id_2))
        operation_2 = cursor.fetchall()[0]

        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id))
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id_2))

        cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES ('+str(id_2)+', '+ str(operation_1[0]) +', '+str(operation_1[1])+', \''+operation_1[2]+'\', '+str(operation_1[3])+', '+str(operation_1[4])+')')
        cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES ('+str(id)+', '+ str(operation_2[0]) +', '+str(operation_2[1])+', \''+operation_2[2]+'\', '+str(operation_2[3])+', '+str(operation_2[4])+')')

        con_db.commit()
        cursor.close()
        con_db.close()

    return redirect('/process/'+str(operation_1[0]))

#перемещение операции ниже
def operation_low(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    if role == 'technologist' or role == 'director':
        con_db = func.connect_to_db(func.get_role(role))
        cursor  = con_db.cursor()

        cursor.execute('SELECT MIN(Process_Operation_ID) FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID > '+ str(id)+' AND Process_ID = \
                       (SELECT Process_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id)+')')
        id_2 = cursor.fetchall()[0][0]

        cursor.execute('SELECT Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id))
        operation_1 = cursor.fetchall()[0]
        cursor.execute('SELECT Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id_2))
        operation_2 = cursor.fetchall()[0]

        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id))
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id_2))

        cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES ('+str(id_2)+', '+ str(operation_1[0]) +', '+str(operation_1[1])+', \''+operation_1[2]+'\', '+str(operation_1[3])+', '+str(operation_1[4])+')')
        cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES ('+str(id)+', '+ str(operation_2[0]) +', '+str(operation_2[1])+', \''+operation_2[2]+'\', '+str(operation_2[3])+', '+str(operation_2[4])+')')

        con_db.commit()
        cursor.close()
        con_db.close()

    return redirect('/process/'+str(operation_1[0]))

#генерация маршрутной карты PDF
def mcard(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    cursor.execute('SELECT Process_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_ID = ' + str(id) + ' ORDER BY Process_Operation_ID')
    operations = cursor.fetchall()
    if len(operations) == 0:
        return redirect('/process/'+ str(id))
    pdf = FPDF()
    pdf.add_font('DejaVu', fname='/usr/share/fonts/truetype/dejavu/DejaVuSerif.ttf', uni=True)
    pdf.set_font(family='DejaVu',size=12)
    pdf.add_page()

    col_width1 = int(pdf.w / 2.7)
    col_width2 = int(pdf.w / 10)
    row_height = pdf.font_size*2

    i=5
    operations_data = [["Номер", "Операция", "Оборудование", "Время, с"]]
    count_h = []
    count_h.append(len(operations_data[0][0]) // 6 + 1)
    count_h.append(round(len(operations_data[0][1])*(row_height/2)) // col_width1 + 1)
    count_h.append(round(len(operations_data[0][2])*(row_height/2)) // col_width1 + 1)
    count_h.append(len(operations_data[0][3]) // 6 + 1)

    operations_data[0].append(count_h)
    for operation in operations:
        operation_data = []
        count_h = []
        operation_data.append(str(i))
        count_h.append(len(operation_data[0]) // 6 + 1)

        operation=operation[0]

        cursor.execute('SELECT Operation_About FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = ' + str(operation))
        operation_data.append(str(cursor.fetchall()[0][0]))
        count_h.append(len(str(operation_data[1])) // 28 + 1)

        cursor.execute('SELECT Tool_Name FROM TCHG_TOOLS WHERE Tool_ID = (SELECT Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = ' + str(operation)+')')
        operation_data.append(str(cursor.fetchall()[0][0]))
        count_h.append(len(operation_data[2]) // 28 + 1)

        cursor.execute('SELECT Operation_Time FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = ' + str(operation))
        operation_data.append(str(cursor.fetchall()[0][0]))
        count_h.append(len(str(operation_data[3])) // 6 + 1)

        operation_data.append(count_h)

        i+=5
        operations_data.append(operation_data)


    cursor.close()
    con_db.close()
    xbegin = pdf.get_x()
    j=0
    x_mass = [col_width2+xbegin, col_width2 + col_width1 + xbegin, col_width2 + 2 * col_width1 + xbegin]
    for j in range(len(operations_data)):
        row = operations_data[j]
        y = pdf.get_y()
        pdf.set_xy(int(xbegin), int(y))
        for i in range(len(row) - 1):
            if j == len(operations_data) - 1:
                if i == 0:
                    y = pdf.get_y()
                    pdf.multi_cell(col_width2, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border=1)
                    pdf.set_xy(x_mass[i], int(y))
                elif i == 3:
                    pdf.multi_cell(col_width2, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border=1)
                else:
                    y = pdf.get_y()
                    pdf.multi_cell(col_width1, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border=1)
                    pdf.set_xy(x_mass[i], int(y))
            else:
                if i == 0:
                    y = pdf.get_y()
                    pdf.multi_cell(col_width2, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border="LTR")
                    pdf.set_xy(x_mass[i], int(y))
                elif i == 3:
                    pdf.multi_cell(col_width2, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border="LTR")
                else:
                    y = pdf.get_y()
                    pdf.multi_cell(col_width1, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border="LTR")
                    pdf.set_xy(x_mass[i], int(y))
    _, path = tempfile.mkstemp(suffix='.pdf')
    pdf.output(path)

    return send_file(path, as_attachment=True)

#страница оборудования
def tools():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    con_db = func.connect_to_db(role)
    cursor = con_db.cursor()

    cursor.execute('SELECT Tool_ID, Tool_Name FROM TCHG_TOOLS')
    tools = cursor.fetchall()


    cursor.close()
    con_db.close()

    return render_template("technologist/tools.html", role=role, tools=tools)

#страница помощи технологу
def help():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    con_db = func.connect_to_db(role)
    cursor  = con_db.cursor()

    gosts_data = []

    cursor.execute('SELECT Group_ID FROM TCHG_OPERATION_GROUP ORDER BY Group_ID')
    gosts = cursor.fetchall()
    for gost in gosts:
        gost = gost[0]
        gost_data={'group_number': '', 'group_name': '', 'operations': '', 'id': str(gost)}
        cursor.execute('SELECT Group_Name FROM TCHG_OPERATION_GROUP WHERE Group_ID = \'' + str(gost) + '\'')
        gost_data['group_name'] = cursor.fetchall()[0][0]

        cursor.execute('SELECT Group_Number FROM TCHG_OPERATION_GROUP WHERE Group_ID =' + str(gost) + '')
        gost_data['group_number'] = cursor.fetchall()[0][0]
        if gost_data['group_number'] < 10:
            gost_data['group_number'] = "0"+str(gost_data['group_number'])
        else:
            gost_data['group_number'] = str(gost_data['group_number'])

        cursor.execute('SELECT Operation_Number, Operation_Name FROM TCHG_OPERATION_LIST WHERE Operation_Group_ID =' + str(gost) + ' ORDER BY Operation_Number')
        gost_data['operations'] = cursor.fetchall()
        gosts_data.append(gost_data)
    cursor.close()
    con_db.close()

    return render_template("technologist/tech_help.html", gosts_data=gosts_data, role=role)
