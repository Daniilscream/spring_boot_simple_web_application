#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/id_rsa \
    target/spring_boot_simple_web_application-1.0-SNAPSHOT.jar \
    daniil@192.168.100.7:/home/daniil/

echo 'Restart server...'

ssh -tt -i ~/.ssh/id_rsa daniil@192.168.100.7 << EOF

pgrep java | xargs kill -9
nohup java -jar spring_boot_simple_web_application-1.0-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'