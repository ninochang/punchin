FROM        python:3.7.13-alpine

WORKDIR     /

COPY        requirements.txt /requirements.txt
COPY        entrypoint.sh /entrypoint.sh

RUN         pip install -m requirements.txt

ENTRYPOINT  ["/entrypoint.sh"]
