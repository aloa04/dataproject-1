
from kafka import KafkaConsumer
from json import loads
from time import sleep
import json
import mysql.connector
from math import sin, cos, sqrt, atan2, radians


def calculate_distance(lat_origin, long_origin, lat_dest, long_dest):
    # approximate radius of earth in km
    R = 6373.0

    lat1 = radians(lat_origin)
    lon1 = radians(long_origin)
    lat2 = radians(lat_dest)
    lon2 = radians(long_dest)

    dlon = lon2 - lon1
    dlat = lat2 - lat1

    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))

    distance = R * c
    return distance


users_dict = {}
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
sql_insert_coordinates = """INSERT INTO Coordinates (clientsId,transportId,latitude, longitude, createDate) Values (%s,%s,%s,%s,%s)"""
sql_call_insert_sp = """SELECT InsertUpdateKM(%s,%s,%s,%s);"""
transport = {'Bike': '1', 'Train': '2', 'Car': '3', 'Walking': '4'}
for event in consumer:
    event_data = event.value
    get_data_tuple = (event_data[0],)
    cursor = connection.cursor(buffered=True)
    cursor.execute(sql_get_user, get_data_tuple)
    records = cursor.fetchall()

    user = event_data[1]
    if cursor.rowcount == 0:
        cursor.close()
        insert_data_tuple = (user["id"], user["name"], user["last_name"], user["age"], user["gender"], user["weight"], user["height"], user["bloodpressure_sist"], user["bloodpressure_diast"],
                             user["cholesterol"], True if user["smoker"] == '1' else False, user["drinking"], True if user["disability"] == '1' else False, True if user["previouspatology"] == '1' else False, user["cp"])
        cursor = connection.cursor(buffered=True)
        cursor.execute(sql_insert_user, insert_data_tuple)
        connection.commit()

    cursor.close()
    insert_data_tuple_coordinates = (
        user["id"], transport[user["transport"]], user["position"]["lat"], user["position"]["lon"], user["time"])
    cursor = connection.cursor(buffered=True)
    cursor.execute(sql_insert_coordinates, insert_data_tuple_coordinates)
    connection.commit()

    walking_distance = 0
    biking_distance = 0

    if user["id"] in users_dict:
        if users_dict[user["id"]]['Transport'] == "Walking":
            walking_distance = calculate_distance(
                users_dict[user["id"]]["Lat"], users_dict[user["id"]]["Lat"], user["position"]["lat"], user["position"]["lon"])
        # here we save distance_temp into the db adding the value if the date exist reseting to 0 if not
        if users_dict[user["id"]]['Transport'] == "Bike":
            biking_distance = calculate_distance(
                users_dict[user["id"]]["Lat"], users_dict[user["id"]]["Lat"], user["position"]["lat"], user["position"]["lon"])
        
    args = (user["id"], walking_distance,
            biking_distance, user["time"])
    cursor.close()
    cursor = connection.cursor(buffered=True)
    cursor.execute(sql_call_insert_sp, args)
    connection.commit()

    users_dict[user["id"]] = {
        'Transport': user["transport"], 'Time': user["time"], 'Lat': user["position"]["lat"], 'Lon': user["position"]["lon"]}
