# set base image (host OS)
FROM python:3.9

# set the working directory in the container
WORKDIR /melvin

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

# command to run on container start
# CMD [ "python", "./server.py" ]
CMD ["uwsgi",   "--http", \
                "127.0.0.1:3031", \
                "--mount", \
                "/=server:app", \
                "--uid=1000", \
                "--gid=2000" ]
