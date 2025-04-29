###########################################
######### Подключение библиотек ###########
###########################################

#Библиотека oracledb для подключения к БД
import oracledb
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

###########################################
##### Подключение файлов с функциями ######
###########################################

#модуль авторизации
import authorization as auth

#модуль инженера-конструктора
import engineer as eng

#модуль технолога
import technologist as tech

#модуль директора
import director as dir

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

   tasks=[]

   if role == 'engineer' or role == 'technologist':
      con_db = func.connect_to_db(role)
      cursor  = con_db.cursor()

      cursor.execute('SELECT Task_ID, Task_About, Task_Check FROM DIR_TASKS WHERE Task_User_ID = (SELECT User_ID FROM AUTH_USERS WHERE User_Login = \''+request.cookies.get('auth_login')+'\')')
      tasks = cursor.fetchall()

   return render_template("main.html", role=role, tasks_data=tasks)


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

#генерация ПЭ3 excel
@app.route('/generate-pe3-xlsx/<id_device>')
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


############ модуль технолога #############

#список ТП
@app.route('/tech-processes')
def processes():
   return tech.processes()

#удаление ТП
@app.route('/process/delete/<id>')
def delete_process(id):
   return tech.delete_process(id)

#добавления ТП
@app.route('/add-process', methods=['POST'])
def add_process():
   return tech.add_process()

#страница каждого процесса
@app.route('/process/<id>', methods=['POST', 'GET'])
def process(id):
   return tech.process(id)

#удаление операции
@app.route('/operation-delete/<id>')
def delete_operation(id):
   return tech.delete_operation(id)

#добавление операции
@app.route('/operation-add/<id_device>', methods=['POST'])
def add_operation(id_device):
   return tech.add_operation(id_device)

#добавление ТП к устройству
@app.route('/tp-to-device/<id>', methods=['POST'])
def tp_to_dev(id):
   return tech.tp_to_device(id)

#перемещение операции вверх
@app.route('/operation-high/<id>')
def op_high(id):
   return tech.operation_high(id)

#перемещение операции вниз
@app.route('/operation-low/<id>')
def op_low(id):
   return tech.operation_low(id)

#генерация маршрутной карты
@app.route('/generate-mcard/<TP_id>')
def generate_mcard(TP_id):
   return tech.mcard(TP_id)

#страница списка оборудования
@app.route('/tools')
def tools():
   return tech.tools()

#страница помощи технологу
@app.route('/technologist-help')
def tech_help():
   return tech.help()

############# модуль директора ##############

@app.route('/add-tasks', methods=['POST', 'GET'])
def create_task():
   return dir.create_task()

@app.route('/delete-task/<id>')
def delete_task(id):
   return dir.delete_task(id)

@app.route('/staff')
def staff():
   return dir.staff()

#заруск Web приложения
if __name__ == '__main__':
  app.run(debug=False, port=80, host='ais.g')
