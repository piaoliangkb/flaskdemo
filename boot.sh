#!/bin/sh
exec gunicorn -b 127.0.0.1:8000 start:app
