FROM mongo:3.6.18-xenial
MAINTAINER SBU-BMI

RUN mkdir /config
WORKDIR /config
COPY config /config
RUN chmod 0775 /config/run*.sh

RUN useradd -u 1001 -r -g 0 -d /config -s /sbin/nologin -c "Default Application User" default \
&& mkdir -p /config \
&& chown -R 1001:0 /config && chmod -R g+rwX /config

RUN chown -R 1001:0 /config && \
    chgrp -R 0 /config && \
    chmod -R g+rwX /config

RUN mkdir -p /mongodb/db && \
    chown -R 1001:0 /mongodb && \
    chgrp -R 0 /mongodb && \
    chmod -R g+rwX /mongodb

USER 1001

CMD /config/run_db.sh 
