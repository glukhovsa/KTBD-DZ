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
import oracledb

###########################################
##### Подключение файлов с функциями ######
###########################################

#подключение файла с удобными функциями
import function as func

###########################################
############# Страницы сайта ##############
###########################################

#Страница создания задач
def create_task():
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    if role != 'director':
        return redirect("/")

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        cursor.execute('INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About, Task_Check) \
                       VALUES (S_DIR_TASKS.NEXTVAL, \''+request.form['user']+'\', \''+request.form['task']+'\', 0)')
        con_db.commit()

    cursor.execute('SELECT Task_ID FROM DIR_TASKS')
    tasks = cursor.fetchall()
    tasks_data=[]
    for task in tasks:
        task = task[0]
        task_select={
            'user_login': 'SELECT User_Login FROM AUTH_USERS WHERE User_ID = (SELECT Task_User_ID FROM DIR_TASKS WHERE Task_ID = '+ str(task)+')',
            'user_name': 'SELECT User_Name FROM AUTH_USERS WHERE User_ID = (SELECT Task_User_ID FROM DIR_TASKS WHERE Task_ID = '+ str(task)+')',
            'user_last': 'SELECT User_Last_Name FROM AUTH_USERS WHERE User_ID = (SELECT Task_User_ID FROM DIR_TASKS WHERE Task_ID = '+ str(task)+')',
            'about' : 'SELECT Task_About FROM DIR_TASKS WHERE Task_ID = '+ str(task),
            'status' : 'SELECT Task_Check FROM DIR_TASKS WHERE Task_ID = '+ str(task)
            }
        task_data = {'id': '','user_login': '', 'user_name': '', 'user_last': '','about': '', 'status': ''}
        task_data['id'] = task
        for i in task_select:
            cursor.execute(task_select[i])
            task_data[i] = cursor.fetchall()[0][0]
        tasks_data.append(task_data)

    cursor.execute('SELECT User_ID, User_Name, User_Last_Name FROM AUTH_USERS WHERE User_Role != \'director\' AND User_Role != \'admin\' AND User_Role != \'guest\'')
    users_data=cursor.fetchall()
    print(users_data)

    cursor.close()
    con_db.close()

    return render_template('director/add_task.html', tasks_data=tasks_data, role=role, users_data=users_data)

#удаление задачи
def delete_task(id):
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    if role != 'director':
        return redirect("/")

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    cursor.execute('UPDATE DIR_TASKS SET Task_Check = 1 WHERE Task_ID = '+str(id))
    con_db.commit()

    cursor.close()
    con_db.close()

    return redirect('/add-tasks')

#список сотрудников
def staff():
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    if role == 'guest':
        return redirect('/')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    cursor.execute('SELECT User_Name, User_Last_Name, User_Phone, User_Email, User_Role FROM AUTH_USERS WHERE User_Role != \'director\'')
    staff_data = cursor.fetchall()

    cursor.close()
    con_db.close()

    return render_template("director/staff.html", staff_data=staff_data, role=role)
