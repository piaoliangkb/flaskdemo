FROM python:3.6

ENV FLASK_APP start.py
ENV FLASK_CONFIG production

RUN apt install  gcc

WORKDIR /home/flaskdemo

COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install gunicorn

COPY app app
COPY start.py config.py boot.sh ./

EXPOSE 8000
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "start:app"]
