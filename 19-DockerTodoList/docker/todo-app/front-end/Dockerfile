FROM node:14-alpine AS todofrontend 
WORKDIR /front-end
COPY package*.json ./
ADD  node_modules.tar.gz ./
RUN npm install
EXPOSE 3000
COPY . .
CMD [ "npm", " start" ]