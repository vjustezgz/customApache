FROM ubi8:8.4
MAINTAINER Vicente Juste
ARG CUSTOM_TEXT
ENV PORT=8080
ENV HOME_DIR=/home/vicente/
RUN yum install -y httpd && yum clean all \
  && groupadd -r -g 10001 vicente \
  && useradd -r -g vicente -u 10001 -m -d ${HOME_DIR} vicente \
  && chown -R vicente:vicente /etc/httpd/logs/ \
  && chown -R vicente:vicente  /run/httpd/ \
  && sed -i "s/Listen 80/Listen ${PORT}/g" /etc/httpd/conf/httpd.conf  \
  && echo ${CUSTOM_TEXT} > /var/www/html/index.html \
  && chmod a+w /var/www/html/index.html
USER vicente
COPY myscript.sh ${HOME_DIR}
COPY init.sh ${HOME_DIR}
USER vicente
WORKDIR ${HOME_DIR}
CMD ["sh", "init.sh"]

  
