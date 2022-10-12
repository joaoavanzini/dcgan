FROM python:3.8-slim-buster


USER root
WORKDIR /usr/app/src
COPY main.py .
COPY celeb_dataset .

RUN chmod -R 777 .

RUN pip install --upgrade pip

ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt

CMD [ "python", "main.py", "--dataset folder", "--dataroot celeb_dataset/"]
