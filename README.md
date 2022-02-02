# Data Project 1 - Master Data Analytics EDEM 2022

| ![](https://github.com/aloa04/dataproject-1/blob/main/media/logo_shonos.png?raw=true) | **Improve your business with Data Analysis**<br /><br />B2B2C projects for the healthcare sector |
| ------------------------------------------------------------ | :----------------------------------------------------------: |

## Meet our team

- [Julen Aguirreurreta](https://github.com/juagvi)
- [Pablo Bottero](https://github.com/aloa04)
- [Thais Casares](https://github.com/thais1987)
- [Olimpia Fuster](https://github.com/olimpiaf99)
- [Jose Luis Rodriguez](https://github.com/joselra98)
- [MªAngeles Sanmartín](https://github.com/mac-sanmartin)



## Proyecto

El objetivo del proyecto es diseñar un modelo que cuantifique la actividad física de los usuarios en su día a día para analizar su estilo de vida y así adaptar su seguro, además de ofrecerles una visión que les ayude a conseguir una vida más activa.

## Requerimientos de software
1. Docker

2. Asegurarse de tener los siguientes puertos disponibles: 
   - 3306
   - 9092
   - 2181
3. Python (v. 3.9)

## Configuración del sistema

1- Crear Base de datos con MariaDb
 - Ejecutar el siguiente comando en la terminal: docker run --name zurichmariadb -e MYSQL_ROOT_PASSWORD=ZurichDb -p 3306:3306  -d docker.io/library/mariadb:latest
 - Conectarse a la instancia de Mysql con una herramienta como Datagrip o WorkBench.
 - Ejecutar los scripts contenidos en el archivo CreateTablesDB.sql que se encuentra en la carpeta DB

2- Servicio Kafka.
 - En la terminal posicionarse en la siguiente carpeta dentro del Repo: cd ../DataGeneratorWithKafka/kafka-docker
 - Una vez en la carpeta ejecutar el siguiente comando en la terminal: docker-compose -f docker-compose-expose.yml up

3- Instalar los requirements.
 - En la terminal posicionarse en la siguiente carpeta dentro del Repo: cd ../DataGeneratorWithKafka
 - Una vez en la carpeta ejecutar el siguiente comando en la terminal: pip3 install -r requirements.txt

4- Levatar el Consumer
 - En la terminal, dentro de la misma carpeta donde estamos (DataGeneratorWithKafka), ejecutar el siguiente comando: python3 consumer.py
   * Si se quiere detener el consumer se deben presionar las siguientes teclas en la terminal: control + c

5- Levatar el Producer
 - En la terminal, dentro de la misma carpeta donde estamos (DataGeneratorWithKafka), ejecutar el siguiente comando: python3 producer.py
   * Si se quiere detener el producer se deben presionar las siguientes teclas en la terminal: control + c

* Si se requiere validar la data en la base de datos, el diagrama que se encuentra en la carpeta DB tiene la estructura de tablas y relacion de la misma.

## Aplicaciones para los clientes

Los **clientes de Zurich** podrán descargar la aplicación TRAVIS desde la AppStore de Apple. En ella podrán ver toda la información sobre su salud, además de recolectar los datos necesarios para la cuantificación de su ejercicio.

Los **agentes de Zurich** tendrán un portal web al que podrán acceder para analizar la situación de su cartera de clientes y así poder tomar mejores decisiones. 

Para acceder a la web, los agentes deberán entrar a [Control Panel (shonos.digital)](https://travis.shonos.digital/)

- Usuario: agente_demo
- Contraseña: demo_agente98

