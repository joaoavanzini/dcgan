FROM python:3.8-slim-buster

USER root
WORKDIR /usr/app/src
COPY model.py ./
COPY train.py ./
COPY celeb_dataset ./

RUN pip install --upgrade pip

ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt

CMD [ "python", "./train.py"]
