# #1st Best Practice implimented bridgenetwork(default)
# FROM node:20
# EXPOSE 8080
#it become bridge network which container network
# ENV DB_HOST="mysql" 
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# CMD ["node", "index.js"]

# # 2nd Best practices implemented Hostnetwork(localhost)
# FROM node:20
# #why because we have two services in the server it is for host network
# ENV DB_HOST="localhost" 
# EXPOSE 8080
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# CMD ["node", "index.js"]


# 3rd Best practices implemented using (custom_network_host) 
# FROM node:20
# #why because we have two services in the server it is for host network
# ENV DB_HOST="mysql" 
# EXPOSE 8080
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# CMD ["node", "index.js"]

#4th Best Practices to reduce the size of the image and create expense user 
# FROM node:20.19.1-alpine3.21
# ENV DB_HOST="mysql" 
# EXPOSE 8080
# RUN addgroup -S expense && adduser -S expense -G expense
# RUN mkdir /opt/server
# RUN chown -R expense:expense /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# USER expense
# CMD ["node", "index.js"]

#5th Best Practices same as above there is taking much time to create, we can reduce the time by reducing the layers.
# FROM node:20.19.1-alpine3.21
# ENV DB_HOST="mysql" 
# EXPOSE 8080
# RUN addgroup -S expense && adduser -S expense -G expense && \
#     mkdir /opt/server && \
#     chown -R expense:expense /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# USER expense
# CMD ["node", "index.js"]

#6th multistage usage: what ever the cache getting from npm install we can save memory.
#this env is going to delete once its done part and send the output to 2nd file

FROM node:20 AS builder
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install 


FROM node:20.19.1-alpine3.21
EXPOSE 8080
ENV DB_HOST="mysql" 
RUN addgroup -S expense && adduser -S expense -G expense && \
    mkdir /opt/server && \
    chown -R expense:expense /opt/server
WORKDIR /opt/server 
COPY --from=builder /opt/server /opt/server/
USER expense
CMD ["node", "index.js"]