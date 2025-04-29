FROM node:20.19.1-alpine3.21
#it become bridge network which container network
ENV DB_HOST="mysql" 
#why because we have two services in the server it is for host network
# ENV DB_HOST="localhost" 
EXPOSE 8080
RUN mkdir /opt/server
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install 
CMD ["node", "index.js"]


#Before Best practices implemented 
# FROM node:20
# #it become bridge network which container network
# ENV DB_HOST="mysql" 
# #why because we have two services in the server it is for host network
# # ENV DB_HOST="localhost" 
# EXPOSE 8080
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# CMD ["node", "index.js"]