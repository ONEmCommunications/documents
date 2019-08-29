FROM python:3.7-slim-buster

# Update the os
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git

# Fetch the arg keys
ARG SSH_PRV_KEY
ARG SSH_PUB_KEY

# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
RUN echo "$SSH_PRV_KEY" > /root/.ssh/id_rsa && \
    echo "$SSH_PUB_KEY" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub

# Init the project
COPY . /documents
# RUN git clone git@github.com:ONEmCommunications/documents.git /documents
WORKDIR /documents
# RUN git fetch --all
# ARG BRANCH=master
# RUN git checkout $BRANCH

# Install requirements
RUN pip install -r requirements.txt

# Remove ssh keys
RUN rm -rf /root/.ssh/

# Add documents user and other stuff
RUN adduser --home /documents --shell /bin/bash --disabled-password documents

RUN chown -R documents. /documents

USER documents

ENV HOME /documents
ENV RESTDAPI_REDOC http://172.16.38.113:6212/redoc
ENV RESTDAPI_DOCS http://172.16.38.113:6212/docs
ENV DEV_PORTAL_SITE http://testtool.dhq.onem:6060
