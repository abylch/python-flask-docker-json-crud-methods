#preconditions --> python, apps, services...., port mapping
#Dockerfile --> conditions

#wich image
FROM python:alpine3.17
#mkdr + cd; workinw directory in vm
WORKDIR /app
#move from to /app 
COPY . .
# install requirements from text file list
RUN pip install -r requirements.txt
# enviroment variable IN VM, in container
ENV PORT=5010
# expose port 5010 for the Flask application in the container
EXPOSE 5010
#run
CMD ["python", "main.py"]

# docker build --> every time there is a change in Dockerfile run build
# docker run <tag>

# docker ps --> check if somethin open
# docker build -t flaskimage:v1.0.0 . ---> .; current path, -t; Name and optionally a tag in the name:tag format
# docker image | grep flask --> check image, docker image ls; all images
# docker run -p 8989:5010 flaskimage --> specify ports manually for mapping the localhost port to flask app port

# Dockerfile itself cannot automatically map ports on the host machine to ports in the container
# without explicitly specifying the port during the docker run command.

# docker-compose.yml file to automatically map port 8989 on the host to port 5010 in the container
# run the file type in terminal: 'docker-compose up'
