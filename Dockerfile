FROM python:3.6

ENV FLASK_APP start.py
ENV FLASK_CONFIG production

RUN apt-get install gcc

COPY . /src
WORKDIR /src

RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn
EXPOSE 8000
ENTRYPOINT ["bash","boot.sh"]
