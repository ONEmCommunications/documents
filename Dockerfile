FROM node:10

WORKDIR /usr/src/app
COPY ./package.json ./
COPY yarn.lock ./
RUN yarn install --modules-folder ../node_modules/
RUN yarn global add static-server
COPY ./site ./site
#COPY *.pem .
CMD [ "npm", "run", "start:docker" ]