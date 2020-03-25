FROM ubuntu:16.04


RUN apt-get update -y && \
    apt-get install -y python-pip python-dev    

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
RUN pip install flask-mail
RUN pip install pillow

COPY run.py /usr/src/app/
COPY flaskblog/static/main.css /usr/src/app/flaskblog/static/
COPY flaskblog/templates/* /usr/src/app/flaskblog/templates/
COPY flaskblog/errors/* /usr/src/app/flaskblog/errors/
COPY flaskblog/main/* /usr/src/app/flaskblog/main/ 
COPY flaskblog/posts/* /usr/src/app/flaskblog/posts/ 
COPY flaskblog/users/* /usr/src/app/flaskblog/users/
COPY flaskblog/*.py /usr/src/app/flaskblog/
COPY flaskblog/static/profile_pics/* /usr/src/app/flaskblog/static/profile_pics/

 
WORKDIR /usr/src/app/

EXPOSE 5000

CMD ["python", "/usr/src/app/run.py"] 