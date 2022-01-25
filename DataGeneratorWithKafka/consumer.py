
from kafka import KafkaConsumer
from json import loads
from time import sleep
import json
import mysql.connector
consumer = KafkaConsumer(
    'topic_test',
    bootstrap_servers=['localhost:9092'],
    auto_offset_reset='earliest',
    enable_auto_commit=True,
    group_id='my-group-id',
    value_deserializer=lambda x: loads(x.decode('utf-8'))
)
num = 0

connection = mysql.connector.connect(host='192.168.1.141',
                                         database='zurich',
                                         user='root',
                                         password='ZurichDb')

sql_get_user = """SELECT clientId FROM Clients WHERE clientId =%s"""
sql_insert_user = """INSERT INTO Clients (clientId,clientsName,clientsLastName,age,gender,weight,height,bloodPressureSist,bloodPressureDiast,cholesterol,smoker,drinking,disability,previousPathology,postalCode) Values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"""
for event in consumer:
    event_data = event.value
    # Do whatever you want
    num = num + 1
    get_data_tuple = (event_data[0],)
    cursor = connection.cursor()
    cursor.execute(sql_get_user, get_data_tuple)
    records = cursor.fetchall()

    if cursor.rowcount == 0:
        cursor.close()
        user = event_data[1]
        insert_data_tuple = (user["id"],user["name"],user["last_name"],user["age"],user["gender"],user["weight"],user["height"],user["bloodpressure_sist"],user["bloodpressure_diast"],user["cholesterol"],bool(user["smoker"]),user["drinking"],bool(user["disability"]),bool(user["previouspatology"]),user["cp"])
        cursor = connection.cursor(prepared=True)
        cursor.execute(sql_insert_user, insert_data_tuple)
        connection.commit()

    
