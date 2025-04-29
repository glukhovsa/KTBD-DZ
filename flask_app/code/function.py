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
############# Удобные функции #############
###########################################


#данные для подключения
con_db_data = {
  'guest' : {
    'db_user' : "guest",
    'db_password' : "iu4",
    'db_host' : "ais_sql_server.g",
    'db_port' : 1521,
    'db_service_name' : "FREE"},
  'director' : {
    'db_user' : "director",
    'db_password' : "qpalzm",
    'db_host' : "ais_sql_server.g",
    'db_port' : 1521,
    'db_service_name' : "FREE"},
  'technologist' : {
    'db_user' : "technologist",
    'db_password' : "qwerty",
    'db_host' : "ais_sql_server.g",
    'db_port' : 1521,
    'db_service_name' : "FREE"},
  'engineer' : {
    'db_user' : "engineer",
    'db_password' : "ijhgfdsaw",
    'db_host' : "ais_sql_server.g",
    'db_port' : 1521,
    'db_service_name' : "FREE"},
  'admin' : {
    'db_user' : "admin_user",
    'db_password' : "root1",
    'db_host' : "ais_sql_server.g",
    'db_port' : 1521,
    'db_service_name' : "FREE"}
}

#подключение к БД
def connect_to_db(role):
  # connection to database
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

#вывод роли пользователя
def get_role(login):
  con_db = connect_to_db('guest')
  cursor = con_db.cursor()
  cursor.execute('SELECT User_Role FROM AUTH_USERS WHERE User_Login = \'' + login +'\'')
  return cursor.fetchall()[0][0]
