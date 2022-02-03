import mysql.connector #import MySQL connector module
import math 



db =mysql.connector.connect(host='170.253.56.211',
                                         database='zurich',
                                         user='root',
                                         password='ZurichDb')
mycursor= db.cursor()
#WOMAN 16-30 AÑOS
mycursor.execute("SELECT Clients.age, Clients.clientId, Clients.weight, Clients.height, Clients.bloodPressureSist, Clients.bloodPressureDiast, Clients.cholesterol, Clients.smoker, Clients.drinking, Clients.previousPathology, Clients.postalCode, Clients.bodyfat ,KmxDay.km,KmxDay.kmBike, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '16' and '30' AND gender = 'woman' ")
womanAge1630 = mycursor.fetchall()
for x in womanAge1630:
  print(x)
  
#MAN 16-30 AÑOS 
mycursor.execute("SELECT Clients. age, Clients.clientId, Clients.weight, Clients.height, Clients.bloodPressureSist, Clients.bloodPressureDiast, Clients.cholesterol, Clients.smoker, Clients.drinking, Clients.previousPathology, Clients.postalCode, Clients.bodyfat ,KmxDay.km,KmxDay.kmBike, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '16' and '30' AND gender = 'man' ")
manAge1630 = mycursor.fetchall()
for x in manAge1630:
    print(x)    
#WOMAN 31-45 años
mycursor.execute("SELECT Clients.age, Clients.clientId, Clients.weight, Clients.height, Clients.bloodPressureSist, Clients.bloodPressureDiast, Clients.cholesterol, Clients.smoker, Clients.drinking, Clients.previousPathology, Clients.postalCode, Clients.bodyfat ,KmxDay.km,KmxDay.kmBike, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '31' and '45' AND gender = 'woman' ")
womanAge3145 = mycursor.fetchall()
for x in womanAge3145:
    print(x)
 #MAN 31-45 AÑOS
mycursor.execute("SELECT Clients.age, Clients.clientId, Clients.weight, Clients.height, Clients.bloodPressureSist, Clients.bloodPressureDiast, Clients.cholesterol, Clients.smoker, Clients.drinking, Clients.previousPathology, Clients.postalCode, Clients.bodyfat ,KmxDay.km,KmxDay.kmBike, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '31' and '45' AND gender = 'man' ")
manAge3145 = mycursor.fetchall()
for x in manAge3145:
    print(x)   
#WOMAN 46-65
mycursor.execute("SELECT Clients.age, Clients.clientId, Clients.weight, Clients.height, Clients.bloodPressureSist, Clients.bloodPressureDiast, Clients.cholesterol, Clients.smoker, Clients.drinking, Clients.previousPathology, Clients.postalCode, Clients.bodyfat ,KmxDay.km,KmxDay.kmBike, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '46' and '65' AND gender = 'woman' ")
womanAge4665 = mycursor.fetchall()
for x in womanAge4665:
    print(x)
#MAN 46-65
mycursor.execute("SELECT Clients.age, Clients.clientId, Clients.weight, Clients.height, Clients.bloodPressureSist, Clients.bloodPressureDiast, Clients.cholesterol, Clients.smoker, Clients.drinking, Clients.previousPathology, Clients.postalCode, Clients.bodyfat ,KmxDay.km,KmxDay.kmBike, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '46' and '65' AND gender = 'man' ")
manAge4665 = mycursor.fetchall()
for x in manAge4665:
    print(x)
#WOMAN 66-85
mycursor.execute("SELECT Clients.age, Clients.clientId, Clients.weight, Clients.height, Clients.bloodPressureSist, Clients.bloodPressureDiast, Clients.cholesterol, Clients.smoker, Clients.drinking, Clients.previousPathology, Clients.postalCode, Clients.bodyfat ,KmxDay.km,KmxDay.kmBike, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '66' and '85' AND gender = 'woman' ")
womanAge6685 = mycursor.fetchall()
for x in womanAge6685:
    print(x)    
 #MAN 66-85  
mycursor.execute("SELECT Clients.age, Clients.clientId, Clients.weight, Clients.height, Clients.bloodPressureSist, Clients.bloodPressureDiast, Clients.cholesterol, Clients.smoker, Clients.drinking, Clients.previousPathology, Clients.postalCode, Clients.bodyfat ,KmxDay.km,KmxDay.kmBike, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '66' and '85' AND gender = 'man' ")
manAge6685 = mycursor.fetchall()
for x in manAge6685:
    print(x)
    
    
#socre for KM
def score16_30 (km):
    global x
    if km == 0:
        x= 0
    if 0 < km <= 4.9:
        x= 25*km/4.9
    if 5 <= km <= 7.9:
        x = (km-5)*24/2.9+25
    if 8 <= km <= 9.9:
        x = (km-8)*49/1.9+50
    if km >= 10:
        x = 100
    return round(x)

def score31_45 (km):
    global x
    if km == 0:
        x= 0
    if 0 < km <= 4.9:
        x= 25*km/4.9
    if 5 <= km <= 6.9:
        x = (km-5)*24/1.9+25
    if 7 <= km <= 9.9:
        x = (km-7)*49/2.9+50
    if km >= 10:
        x = 100
    return round(x)

def score46_65 (km):
    global x
    if km == 0:
        x= 0
    if 0 < km <= 3.9:
        x= 25*km/3.9
    if 4 <= km <= 5.9:
        x = (km-4)*24/1.9+25
    if 6 <= km <= 8:
        x = (km-6)*49/2+50
    if km > 8:
        x = 100
    return round(x)

def score66_85 (km):
    global x
    if km == 0:
        x= 0
    if 0 < km <= 2.9:
        x= 25*km/2.9
    if 3 <= km <= 4.9:
        x = (km-3)*24/1.9+25
    if 5 <= km <= 7:
        x = (km-5)*49/2+50
    if km > 7:
        x = 100
    return round(x)

def calculatedScore(pato, bloodsist, blooddiast, colest, imc, smoke, alcohol, bike):
    score = 0
    #Previous pathology
    if pato == 0:
        score += 5
    else:
        score -= 7
    #blood sistole
    if 90<= bloodsist >= 139:
        score += 5
    else:
        score -= 5
    #blood asist
    if 70<= blooddiast >= 89:
        score +=5
    else:
        score -= 5
    #cholesterol
    if 150 <= colest >= 200:
        score += 6
    else:
        score -= 7
    #IMC
    if 3 <= imc >= 24:
        score += 5
    if 25 <= imc >= 29:
        score -= 3
    else:
        score -= 5
    #smoker
    if smoke == 0:
        score += 3
    else:
        score -= 3
    #alcohol
    if 0<= alcohol >= 2:
        score += 2
    if 3<= alcohol >= 4:
        score += 0
    else:
        score -= 3
    #bike
    if 0<= bike >= 3:
        score += 5
    if 3< bike >= 6:
        score += 7
    else:
        score -= 10
    
    return (score)
    

scorekmW16_30= []
for i in womanAge1630:
   aux  = []
   aux.append(score16_30(i[12]))
   aux.append(calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(score16_30(i[12])+calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(i[1])
   aux.append(i[14])
   scorekmW16_30.append(aux)
print(scorekmW16_30)

scorekmm16_30= []
for i in manAge1630:
   aux  = []
   aux.append(score16_30(i[12]))
   aux.append(calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(score16_30(i[12])+calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(i[1])
   aux.append(i[14])
   scorekmm16_30.append(aux)
print(scorekmm16_30)

scorekmW31_45 = []
for i in womanAge3145:
   aux  = []
   aux.append(score31_45(i[12]))
   aux.append(calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(score31_45(i[12])+calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(i[1])
   aux.append(i[14])
   scorekmW31_45.append(aux)
print(scorekmW31_45)

scorekmm31_45= []
for i in manAge3145:
   aux  = []
   aux.append(score31_45(i[12]))
   aux.append(calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(score31_45(i[12])+calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(i[1])
   aux.append(i[14])
   scorekmm31_45.append(aux)
print(scorekmm31_45)

scorekmW46_65= []
for i in womanAge4665:
   aux  = []
   aux.append(score46_65(i[12]))
   aux.append(calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(score16_30(i[12])+calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(i[1])
   aux.append(i[14])
   scorekmW46_65.append(aux)
print(scorekmW46_65)

scorekmm46_65= []
for i in manAge4665:
   aux  = []
   aux.append(score46_65(i[12]))
   aux.append(calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(score16_30(i[12])+calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(i[1])
   aux.append(i[14])
   scorekmm46_65.append(aux)
print(scorekmm46_65)

scorekmW66_85= []
for i in womanAge6685:
   aux  = []
   aux.append(score66_85(i[12]))
   aux.append(calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(score66_85(i[12])+calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(i[1])
   aux.append(i[14])
   scorekmW66_85.append(aux)
print(scorekmW66_85)

scorekmm66_85= []
for i in manAge6685:
   aux  = []
   aux.append(score66_85(i[12]))
   aux.append(calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(score66_85(i[12])+calculatedScore(i[9], i[4], i[5], i[6], i[11], i[7], i[8], i[13]))
   aux.append(i[1])
   aux.append(i[14])
   scorekmm66_85.append(aux)
print(scorekmm66_85)

update_score="""update KmxDay set score=%s where clientsId=%s and createDate=%s;"""
for i in scorekmW16_30:
    print (i)
    updated_values=(i[2], i[3], i[4])
    mycursor.execute(update_score, updated_values)
db.commit()
for i in scorekmm16_30:
    print (i)
    updated_values=(i[2], i[3], i[4])
    mycursor.execute(update_score, updated_values)
db.commit()
for i in scorekmW31_45:
    print (i)
    updated_values=(i[2], i[3], i[4])
    mycursor.execute(update_score, updated_values)
db.commit()
for i in scorekmm31_45:
    print (i)
    updated_values=(i[2], i[3], i[4])
    mycursor.execute(update_score, updated_values)
db.commit()
for i in scorekmW46_65:
    print (i)
    updated_values=(i[2], i[3], i[4])
    mycursor.execute(update_score, updated_values)
db.commit()
for i in scorekmm46_65:
    print (i)
    updated_values=(i[2], i[3], i[4])
    mycursor.execute(update_score, updated_values)
db.commit()
for i in scorekmW66_85:
    print (i)
    updated_values=(i[2], i[3], i[4])
    mycursor.execute(update_score, updated_values)
db.commit()
for i in scorekmm66_85:
    print (i)
    updated_values=(i[2], i[3], i[4])
    mycursor.execute(update_score, updated_values)
db.commit()
    

mycursor.execute("SELECT Clients.clientId, KmxDay.score, KmxDay.km, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '16' and '30' AND gender = 'woman' ")
womanAge1630score = mycursor.fetchall()
for x in womanAge1630score:
  print(x)
  
mycursor.execute("SELECT Clients.clientId, KmxDay.score, KmxDay.km, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '16' and '30' AND gender = 'man' ")
manAge1630score = mycursor.fetchall()
for x in manAge1630score:
  print(x)

mycursor.execute("SELECT Clients.clientId, KmxDay.score, KmxDay.km, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '31' and '45' AND gender = 'woman' ")
womanAge3145score = mycursor.fetchall()
for x in womanAge3145score:
  print(x)

mycursor.execute("SELECT Clients.clientId, KmxDay.score, KmxDay.km, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '31' and '45' AND gender = 'man' ")
manAge3145score = mycursor.fetchall()
for x in manAge3145score:
  print(x)

mycursor.execute("SELECT Clients.clientId, KmxDay.score, KmxDay.km, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '46' and '65' AND gender = 'woman' ")
womanAge4665score = mycursor.fetchall()
for x in womanAge4665score:
  print(x)

mycursor.execute("SELECT Clients.clientId, KmxDay.score, KmxDay.km, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '46' and '65' AND gender = 'man' ")
manAge4665score = mycursor.fetchall()
for x in manAge4665score:
  print(x)


mycursor.execute("SELECT Clients.clientId, KmxDay.score, KmxDay.km, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '66' and '85' AND gender = 'woman' ")
womanAge6685score = mycursor.fetchall()
for x in womanAge6685score:
  print(x)

mycursor.execute("SELECT Clients.clientId, KmxDay.score, KmxDay.km, KmxDay.createDate FROM Clients INNER JOIN KmxDay ON Clients.clientId = KmxDay.clientsId WHERE age BETWEEN '66' and '85' AND gender = 'man' ")
manAge6685score = mycursor.fetchall()
for x in manAge6685score:
  print(x)
#CATEGORIAS
def categorias (score):
    if score < 0:
        return "no recomendadmos asegurar al usuario"
    if score >= 0 and score < 26:
        return"categoria Bronce"
    if score >= 26 and score < 51:
        return "categoria Plata"
    if score >= 51 and score < 81:
        return "categoria Oro"
    if  score >= 81 :
        return "categoria diamante"
for i in womanAge1630score:
    print(categorias(i[1]))
for i in manAge1630score:
    print(categorias(i[1]))
for i in womanAge3145score:
    print(categorias(i[1]))
for i in manAge3145score:
    print(categorias(i[1]))
for i in manAge3145score:
    print(categorias(i[1]))
for i in womanAge4665score:
    print(categorias(i[1]))
for i in manAge4665score:
    print(categorias(i[1]))
for i in womanAge6685score:
   print(categorias(i[1]))
for i in manAge6685score:
   print(categorias(i[1]))

