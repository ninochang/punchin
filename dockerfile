FROM        python:3.7.13-alpine

WORKDIR     /

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY        requirements.txt /requirements.txt
COPY        entrypoint.sh /entrypoint.sh

RUN         pip install -m requirements.txt

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT  ["/entrypoint.sh"]
