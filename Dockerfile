from openjdk:8
WORKDIR /app

COPY ./src/Main.java /app
COPY ./test_files/* /test_files/
COPY ./start.sh /app

RUN javac Main.java
RUN chmod +x /app/start.sh

CMD ["./start.sh"]
#CMD ["java", "Main"]
