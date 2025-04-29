#to reduce size
FROM nginx:mainline-alpine3.21-slim

RUN rm -rf /etc/nginx/nginx.conf && \
    rm -rf /etc/nginx/conf.d/ && \
    mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/fastcgi_temp && \
    mkdir -p /var/cache/nginx/uwsgi_temp && \
    mkdir -p /var/cache/nginx/scgi_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /etc/nginx/ && \
    chmod -R 755 /etc/nginx/ && \
    chown -R nginx:nginx /var/log/nginx 
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /run/nginx.pid
COPY nginx.conf /etc/nginx/nginx.conf
COPY code /usr/share/nginx/html
USER nginx


#before reducing size
FROM nginx 
COPY code /usr/share/nginx/html
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
#COPY expense.conf /etc/nginx/conf.d/expense.conf