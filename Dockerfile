FROM openjdk:8-jre-slim

RUN mkdir /app
WORKDIR /app

ADD *.jar /app/
EXPOSE 8080

RUN echo "#!/bin/sh \n\
exec /usr/local/openjdk-8/bin/java -jar $(ls /app/*.jar)\n"\
 > /app/entrypoint.sh
RUN chmod u+x /app/entrypoint.sh
ENTRYPOINT ["/bin/sh","/app/entrypoint.sh"]
