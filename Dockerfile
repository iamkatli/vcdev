FROM node:12.18.2
# specifies environment (usually, development or production)
ENV NODE_ENV=production

# instructs Docker use this path as the default location for all subsequent commands
WORKDIR /app

# copy dependency file
COPY ["package.json", "package-lock.json*", "./"]
# install npm packages
RUN npm install --production

# we have an image node v12.18.2 and installed our dependencies
# NEXT, add our source code into the image
COPY . .
# Now, tell Docker what command we want to run 
# when our image is run inside of a container
CMD [ "node", "server.js" ]
