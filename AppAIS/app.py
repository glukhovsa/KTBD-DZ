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
#from flask_qrcode import QRcode
app = Flask(__name__)
#QRcode(app)

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
@app.route('/all_devices')
def devices():
   return eng.all_devices()

#заруск Web приложения
if __name__ == '__main__':
  app.run(debug=True)