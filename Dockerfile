from openjdk:8
WORKDIR /app

COPY ./src/Main.java /app
COPY ./test_files/* /test_files/
COPY ./docker_start.sh /app

RUN javac Main.java
RUN chmod +x /app/docker_start.sh

CMD ["./docker_start.sh"]
#CMD ["java", "Main"]
