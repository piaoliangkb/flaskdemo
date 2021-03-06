FROM python:3.6

ENV FLASK_APP start.py

RUN apt install gcc

WORKDIR /home/flaskdemo

COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install gunicorn

COPY app app
COPY data-dev.sqlite start.py config.py ./

EXPOSE 8000
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "start:app", "--access-logfile", "-", "--error-logfile", "-"]
