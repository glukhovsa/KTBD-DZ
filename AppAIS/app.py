###########################################
######### Подключение библиотек ###########
###########################################

#Библиотека cx_Oracle для подключения к БД
import cx_Oracle
from pprint import pprint as pp
con_db_data={
  'db_user' : "guest",
  'db_password' : "iu4",
  'db_host' : "localhost",
  'db_port' : 1521,
  'db_service_name' : "FREE"
}
con_db_data_sys={
  'db_user' : "SYS",
  'db_password' : "root",
  'db_host' : "localhost",
  'db_port' : 1521,
  'db_service_name' : "FREE"
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
def connect_to_db():
  # connection to database
  dsn_con = cx_Oracle.makedsn(
      con_db_data['db_host'], 
      con_db_data['db_port'], 
      service_name = con_db_data['db_service_name']
  )
  connection = cx_Oracle.connect(
      user = con_db_data['db_user'],
      password = con_db_data['db_password'],
      dsn = dsn_con,
      encoding = "UTF-8"
  )
  return connection

#подключение к БЛ как SYSDBA
def connect_to_db_sys():
  # connection to database
  dsn_con = cx_Oracle.makedsn(
      con_db_data_sys['db_host'], 
      con_db_data_sys['db_port'], 
      service_name = con_db_data_sys['db_service_name']
  )
  connection = cx_Oracle.connect(
      user = con_db_data_sys['db_user'],
      password = con_db_data_sys['db_password'],
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



###########################################
############# Страницы сайта ##############
###########################################
@app.route('/')
def main():
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    return "0"

########### модуль авторизации ############

#вход на сайт
@app.route('/login', methods=['POST', 'GET'])
def login():
  if request.method == 'POST':
    login_data = {'try' : True, 'login': request.form['user_login'], 'password' : request.form['user_password']}
    login_data['password'] = hashlib.md5(login_data['password'].encode())
    login_data['password'] = login_data['password'].hexdigest()
    con_db = connect_to_db()
    cursor = con_db.cursor()

    check_login = 'SELECT * FROM SYS.AUTH_USERS WHERE User_Login = \''+ login_data['login']+'\' AND User_Password = \''+ login_data['password']+'\''
    cursor.execute(check_login)
    login_result = cursor.fetchall()

    cursor.close()
    con_db.close()
    print(len(login_result))
    if len(login_result) == 1:
      return redirect('/')
  else:
    login_data = {'try' : True, 'login': False, 'password' : False, 'error' : None}
    return render_template("login.html", login_data=login_data)

#заруск Web приложения
if __name__ == '__main__':
  app.run(debug=True)