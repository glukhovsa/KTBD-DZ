###########################################
######### Подключение библиотек ###########
###########################################

#Библиотека cx_Oracle для подключения к БД
import cx_Oracle
from pprint import pprint as pp
con_db_data = {
  'guest' : {
    'db_user' : "guest",
    'db_password' : "iu4",
    'db_host' : "localhost",
    'db_port' : 1521,
    'db_service_name' : "FREE"},
  'director' : {
    'db_user' : "director",
    'db_password' : "qpalzm",
    'db_host' : "localhost",
    'db_port' : 1521,
    'db_service_name' : "FREE"},
  'technologist' : {
    'db_user' : "technologist",
    'db_password' : "qwerty",
    'db_host' : "localhost",
    'db_port' : 1521,
    'db_service_name' : "FREE"},
  'engineer' : {
    'db_user' : "engineer",
    'db_password' : "ijhgfdsaw",
    'db_host' : "localhost",
    'db_port' : 1521,
    'db_service_name' : "FREE"},
  'admin' : {
    'db_user' : "SYS",
    'db_password' : "root",
    'db_host' : "localhost",
    'db_port' : 1521,
    'db_service_name' : "FREE"}
}

#Библиотека flask для создания Web приложения
from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
from flask import make_response
from flask import send_file
#from flask_qrcode import QRcode
app = Flask(__name__)
#QRcode(app)

#библиотека для шифрования данных
import hashlib

#библиотека для работы с файлами
#from fpdf import FPDF
#import xlsxwriter

#для штрихкодов
#import barcode
#from barcode import EAN13
#from barcode.writer import ImageWriter

###########################################
############ Функции для кода #############
###########################################

#подключение к БД
def connect_to_db(role):
  # connection to database
  if role != 'admin':
    dsn_con = cx_Oracle.makedsn(
        con_db_data[role]['db_host'], 
        con_db_data[role]['db_port'], 
        service_name = con_db_data[role]['db_service_name']
    )
    connection = cx_Oracle.connect(
        user = con_db_data[role]['db_user'],
        password = con_db_data[role]['db_password'],
        dsn = dsn_con,
        encoding = "UTF-8"
    )
  else:
    connection = connect_to_db_sys()
  return connection

#подключение к БЛ как SYSDBA
def connect_to_db_sys():
  # connection to database
  dsn_con = cx_Oracle.makedsn(
      con_db_data['admin']['db_host'], 
      con_db_data['admin']['db_port'], 
      service_name = con_db_data['admin']['db_service_name']
  )
  connection = cx_Oracle.connect(
      user = con_db_data['admin']['db_user'],
      password = con_db_data['admin']['db_password'],
      dsn = dsn_con,
      mode=cx_Oracle.SYSDBA,
      encoding = "UTF-8"
  )
  return connection

#расчёт границ таблицы
def table_boundaries(array):
  mas =[]
  for j in array:
    for i in range(len(j)):
      if j == array[0]:
        mas.append(len(str(j[i])))
      elif len(str(j[i])) > mas[i]:
        mas[i] = len(str(j[i]))
  
  return mas


def get_role(login):
  con_db = connect_to_db('guest')
  cursor = con_db.cursor()
  cursor.execute('SELECT User_Role FROM SYS.AUTH_USERS WHERE User_Login = \'' + login +'\'')
  return cursor.fetchall()[0][0]


###########################################
############# Страницы сайта ##############
###########################################
@app.route('/')
def main():
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    role = get_role(request.cookies.get('auth_login'))
    return render_template("main.html", role=role)

########### модуль авторизации ############

#вход на сайт
@app.route('/login', methods=['POST', 'GET'])
def login():
  if request.method == 'POST':
    login_data = {'login': request.form['user_login'], 'password' : request.form['user_password'], 'error_data': False}
    login_data['password'] = hashlib.md5(login_data['password'].encode())
    login_data['password'] = login_data['password'].hexdigest()
    con_db = connect_to_db('guest')
    cursor = con_db.cursor()

    check_login = 'SELECT User_Login FROM SYS.AUTH_USERS WHERE User_Login = \''+ login_data['login']+'\' AND User_Password = \''+ login_data['password']+'\''
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
  return render_template("login.html", login_data=login_data)

#штформация о пользователе
@app.route('/user')
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
    'name': 'SELECT User_Name FROM SYS.AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\'',
    'last name': 'SELECT User_Last_Name FROM SYS.AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\'',
    'phone': 'SELECT User_Number FROM SYS.AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\'',
    'email': 'SELECT User_Email FROM SYS.AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\'',
    'role' : 'SELECT User_Role FROM SYS.AUTH_USERS WHERE User_Login = \''+ user_data['login'] + '\''
  }

  con_db = connect_to_db('guest')
  cursor = con_db.cursor()

  for parametr in user_get_data:
    cursor.execute(user_get_data[parametr])
    user_data[parametr] = cursor.fetchall()[0][0]
  cursor.close()
  con_db.close()

  return render_template("user.html", user_data=user_data)


#выход из аккаунта
@app.route('/logout')
def logout():
  cook = make_response(redirect('/login'))
  cook.set_cookie('auth_login', 'None', max_age=0)
  cook.set_cookie('auth_status', 'False', max_age=0)
  return cook

#регистрация
@app.route('/registration')
def registration():
  return "0"

#заруск Web приложения
if __name__ == '__main__':
  app.run(debug=True)