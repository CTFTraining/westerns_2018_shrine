FROM python:2.7-alpine

LABEL Author="Virink <virink@outlook.com>"
LABEL Blog="https://www.virzz.com"

ENV FLAG='flag{shrine_is_good_ssti}' FLASK_APP=app.py FLASK_ENV=production

ADD shrine.py /app/app.py

RUN pip install \
	-i http://mirrors.aliyun.com/pypi/simple/ \
	--trusted-host mirrors.aliyun.com \
	-U flask && \
	touch /app/error.html && \
	chmod 777 /app/error.html

EXPOSE 5000

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/flask","run","-h","0.0.0.0"]