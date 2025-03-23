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

#библиотека для шифрования данных
import hashlib

###########################################
##### Подключение файлов с функциями ######
###########################################

#подключение файла с удобными функциями
import function as func

###########################################
############# Страницы сайта ##############
###########################################

#страница авторизации
def login():
  if request.method == 'POST':
    login_data = {'login': request.form['user_login'], 'password' : request.form['user_password'], 'error_data': False}
    login_data['password'] = hashlib.md5(login_data['password'].encode())
    login_data['password'] = login_data['password'].hexdigest()
    con_db = func.connect_to_db('guest')
    cursor = con_db.cursor()

    check_login = 'SELECT User_Login FROM admin_user.AUTH_USERS WHERE User_Login = \''+ login_data['login']+'\' AND User_Password = \''+ login_data['password']+'\''
    cursor.execute(check_login)
    login_result = cursor.fetchall()

    cursor.close()
    con_db.close()
    if len(login_result) == 1:
      cook = make_response(redirect('/'))
      cook.set_cookie('auth_login', str(login_result[0][0]))
      cook.set_cookie('auth_status', str(True))
      return cook
    else:
      login_data['error_data'] = True
  else:
    login_data = {'login': False, 'password' : False, 'error_data': False}
  return render_template("authorization/login.html", login_data=login_data)

#страница вывода информации о пользователе
def user():
  #проверка авторизации
  if request.cookies.get('auth_status') != 'True':
      return redirect('/login')
  
  user_data = {
    'login': request.cookies.get('auth_login'),
    'name': '',
    'last name': '',
    'phone': '',
    'email': '',
    'role' : ''
  }
  user_get_data = {
    'name': 'SELECT User_Name FROM AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\'',
    'last name': 'SELECT User_Last_Name FROM AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\'',
    'phone': 'SELECT User_Phone FROM AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\'',
    'email': 'SELECT User_Email FROM AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\'',
    'role' : 'SELECT User_Role FROM AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\''
  }

  con_db = func.connect_to_db('guest')
  cursor = con_db.cursor()

  for parametr in user_get_data:
    cursor.execute(user_get_data[parametr])
    user_data[parametr] = cursor.fetchall()[0][0]
  cursor.close()
  con_db.close()

  return render_template("authorization/user.html", user_data=user_data)

#выход из аккаунта
def logout():
  cook = make_response(redirect('/login'))
  cook.set_cookie('auth_login', 'None', max_age=0)
  cook.set_cookie('auth_status', 'False', max_age=0)
  return cook

#страница регистрации
def registration():
  error = {'?': False, 'text': ''}
  if request.method == 'POST':
    input_data = {
      'login': request.form['user_login'],
      'name': request.form['user_name'],
      'last name': request.form['user_last_name'],
      'password': request.form['user_password'],
      'phone' : request.form['user_phone'],
      'email' : request.form['user_email'],
      'role' : request.form['user_role']
    }

    if input_data['login'] == '' or input_data['name'] == '' or input_data['last name'] == '' or input_data['password'] == '' or input_data['role'] == '':
      error['?'] = True
      error['text'] = 'Все поля должны быть обязательно заполнены'
      return render_template("authorization/registration.html", error = error)
    
    con_db = func.connect_to_db('guest')
    cursor = con_db.cursor()
    cursor.execute('SELECT User_ID FROM AUTH_USERS WHERE User_Login = \''+input_data['login']+'\'')
    if len(cursor.fetchall()) > 0:
      error['?'] = True
      error['text'] = 'Пользователь с таким именем уже существует'

      cursor.close()
      con_db.close()
      return render_template("authorization/registration.html", error = error)
    
    input_data['password'] = hashlib.md5(input_data['password'].encode())
    input_data['password'] = input_data['password'].hexdigest()

    cursor.execute('INSERT INTO AUTH_USERS \
                   (User_ID, User_Login, User_Name, User_Last_Name, User_Password, User_Phone, User_Email, User_Role) \
                   VALUES (S_AUTH_USERS.NEXTVAL, \''+input_data['login']+'\', \''+input_data['name']+'\', \''+input_data['last name']+'\', \
                    \''+input_data['password']+'\',  \''+input_data['phone']+'\',  \''+input_data['email']+'\',  \''+input_data['role']+'\')')
    
    cursor.execute('SELECT User_ID FROM admin_user.AUTH_USERS WHERE User_Login = \''+input_data['login']+'\'')
    if len(cursor.fetchall()) != 1:
      error['?'] = True
      error['text'] = 'Не удалось зарегистрировать пользователя.\nОбратитесь к администратору'

      cursor.close()
      con_db.close()
      return render_template("authorization/registration.html", error = error)
    con_db.commit()
    cursor.close()
    con_db.close()
    return redirect("/login")

  return render_template("authorization/registration.html", error = error)