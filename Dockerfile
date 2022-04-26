FROM python:3.8-slim-buster

WORKDIR $GITHUB_WORKSPACE

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY action_fabfile_creator.py $GITHUB_WORKSPACE/action_fabfile_creator.py

COPY entrypoint.sh $GITHUB_WORKSPACE/entrypoint.sh

ENTRYPOINT ["$GITHUB_WORKSPACE/entrypoint.sh"]