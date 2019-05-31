FROM node:10

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./
RUN npm install
#RUN npm install -g pm2

# Copying source files
COPY . .

# Building app
RUN npm run build
ENV NODE_ENV=production
ENV PORT=8080
EXPOSE 8080
# Running the app
#CMD pm2 start --no-daemon ./src/server.js
CMD npm run start