FROM python:3.8-slim-buster

COPY requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

COPY action_fabfile_creator.py /action_fabfile_creator.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]