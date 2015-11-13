FROM java:8

MAINTAINER José Moreno
LABEL Description="Aplicación de ejemplo de acceptance test con Docker" 
LABEL Version="1.0"

ADD ./resources/helloworld.jar  ~/
ENTRYPOINT ["java", "-jar", "~/helloworld.jar", "server"]
