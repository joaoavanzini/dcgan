FROM python:3.8-slim-buster

WORKDIR /usr/app/src/

USER root

RUN pip install --upgrade pip
ADD requirements.txt .
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113
RUN python3 -m pip install -r requirements.txt

COPY main.py ./
COPY celeb_dataset ./celeb_dataset/

RUN chmod 777 ./main.py


Entrypoint [ "python", "main.py", "--dataset", "folder", "--dataroot", "./celeb_dataset", "--cuda", "--ngpu", "2"]


