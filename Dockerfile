FROM hyper.cd/sapjvm/jdk:8.1.023

ADD target/motan.war /opt/motan/

RUN \
    cd /opt/motan &&\
    unzip motan.war  &&\
    rm -rf motan.war &&\
    { \
        echo '#!/usr/bin/env bash'; \
        echo 'java -cp /opt/motan/WEB-INF/lib/*:/opt/motan/WEB-INF/classes/ com.wallace.motan.Server'; \
    } > /usr/bin/start-app.sh &&\
    chmod +x /usr/bin/start-app.sh &&\
    echo 'done'

ENTRYPOINT ["/usr/bin/start-app.sh"]