FROM eclipse-temurin:21-jdk

RUN apt-get update && \
    apt-get install -y maven wget unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://download2.gluonhq.com/openjfx/21/openjfx-21_linux-x64_bin-sdk.zip -O /tmp/openjfx.zip && \
    unzip /tmp/openjfx.zip -d /opt && \
    rm /tmp/openjfx.zip

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests && \
    cp target/sum-product_fx-1.0-SNAPSHOT.jar /app/app.jar

CMD ["java", "-cp", "/app/app.jar", "org.example.DatabaseInitializer"]