FROM python:3.9.6

RUN pip install flask==3.0.0 \
    && mkdir /code 

WORKDIR /code

COPY main.py .
EXPOSE 8080
CMD [ "/usr/local/bin/python", "main.py" ]
