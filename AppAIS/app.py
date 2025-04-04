###########################################
######### Подключение библиотек ###########
###########################################

#Библиотека cx_Oracle для подключения к БД
import cx_Oracle
from pprint import pprint as pp


#Библиотека flask для создания Web приложения
from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
from flask import make_response
from flask import send_file

#библиотека работы в QR
from flask_qrcode import QRcode
app = Flask(__name__)
QRcode(app)

#библиотека для работы с файлами
#from fpdf import FPDF
#import xlsxwriter

#для штрихкодов
#import barcode
#from barcode import EAN13
#from barcode.writer import ImageWriter

###########################################
##### Подключение файлов с функциями ######
###########################################

#модуль авторизации
import authorization as auth

#модуль инженера-конструктора
import engineer as eng

#подключение файла с удобными функциями
import function as func


###########################################
############# Страницы сайта ##############
###########################################
@app.route('/')
def main():
  #проверка авторизации
  if request.cookies.get('auth_status') != 'True':
      return redirect('/login')
  role = func.get_role(request.cookies.get('auth_login'))
  return render_template("main.html", role=role)

@app.route('/all')
def all():
  #проверка авторизации
  if request.cookies.get('auth_status') != 'True':
      return redirect('/login')
  return render_template("all.html", role = func.get_role(request.cookies.get('auth_login')))

########### модуль авторизации ############

#вход на сайт
@app.route('/login', methods=['POST', 'GET'])
def login():
  return auth.login()

#информация о пользователе
@app.route('/user')
def user():
  return auth.user()

#выход из аккаунта
@app.route('/logout')
def logout():
  return auth.logout()

#регистрация
@app.route('/registration', methods=['POST', 'GET'])
def registration():
  return auth.registration()

############# модуль инженера ##############

#страница со всеми устройствами
@app.route('/all-devices')
def devices():
   return eng.all_devices()

#удаление устройства
@app.route('/device/delete/<id>')
def delete_device(id):
   return eng.delete_device(id)

#добавления устройства
@app.route('/add-device', methods=['POST'])
def add_device():
   return eng.add_device()

#страница каждого устройства
@app.route('/device/<id>')
def device(id):
   return eng.device(id)

#удаление компонента
@app.route('/component-delete/<id>')
def delete_component(id):
   return eng.delete_component(id)

#добавление компонента
@app.route('/component-add/<id_device>', methods=['POST'])
def add_component(id_device):
   return eng.add_component(id_device)

#генерация ПЭ3
@app.route('/generate-pe3/<id_device>')
def generate_xls(id_device):
   return eng.generate_xls(id_device)

#страница библиотеки компонентов
@app.route('/component-lib')
def component_lib():
   return eng.component_lib()

#удаление компонента из библиотеки
@app.route('/component-lib-delete/<id>')
def delete_component_lib(id):
   return eng.delete_component_lib(id)

#добавление компонента
@app.route('/component-lib-add', methods=['POST'])
def add_component_lib():
   return eng.add_device_lib()

#помошь инженеру
@app.route('/engineer-help', methods=['POST', 'GET'])
def engineer_help():
   return eng.engineer_help()


#заруск Web приложения
if __name__ == '__main__':
  app.run(debug=True)