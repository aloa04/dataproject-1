# Data Project 1 - Master Data Analytics EDEM 2022

| ![](https://github.com/aloa04/dataproject-1/blob/main/logo/logo_shonos.png?raw=true) | **Improve your business with Data Analysis**<br /><br />B2B2C projects for the healthcare sector |
| ------------------------------------------------------------ | :----------------------------------------------------------: |

## Meet our team

- [Julen Aguirreurreta](https://github.com/juagvi)
- [Pablo Bottero](https://github.com/aloa04)
- [Thais Casares](https://github.com/thais1987)
- [Olimpia Fuster](https://github.com/olimpiaf99)
- [Jose Luis Rodriguez](https://github.com/joselra98)
- [MªAngeles Sanmartín](https://github.com/mac-sanmartin)



## Our project

The goal of the project is to design a model that quantifies the physical activity of users on a daily basis in order to analyze their lifestyle and thus adapt their insurance, as well as to offer them an insight to help them achieve a more active life.

## Requerimientos de software
1- Tener docker instalado. De no tenerlo ir a está página y seguir las instrucciones para la instalación, según sistema operativo: 
    https://docs.docker.com/get-docker/
2- Asegurarse de tener los siguientes puertos disponibles: 3306, 9092, 2181
3- Tener python 3.9 instalado.

## Configuración

1- Crear Base de datos con MariaDb
 - Abrir una terminal y posicionarse en la siguiente carpeta dentro del Repo: cd DB
 - Una vez en la carpeta ejecutar el siguiente comando en la terminal: docker build -t ZurichMariaDb . && docker run -it ZurichMariaDb

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