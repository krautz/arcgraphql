#########################
##### INSTALL STAGE #####
#########################

# set base image for building project
FROM node:11-alpine as BASE_IMAGE

# set working directory
WORKDIR /usr/app/arcgraphql

# copy files to image
COPY . .

# install dependencies
RUN npm install

# build app
RUN npm run build


#######################
##### BUILD STAGE #####
#######################

# set node v11 as base image
FROM node:11-alpine

# set working directory
WORKDIR /usr/app/arcgraphql

# add maintainer Info
LABEL Author="Caio Krauthamer <caio_k@hotmail.com>"

# copy package.json, its lock and build folder from base image to our container
COPY --from=BASE_IMAGE /usr/app/arcgraphql/package*.json ./
COPY --from=BASE_IMAGE /usr/app/arcgraphql/build ./build

# install dependencies only for production
RUN npm ci --only=production

# remove unecessary files from node_modules folder
RUN npm prune --production

# set command to run when container starts
CMD ["node", "build/index.js"]
