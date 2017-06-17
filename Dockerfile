FROM centos:7

ENV APP_DIR=/opt/openshift-auth-proxy

RUN yum install centos-release-scl-rh -y && \
    yum install nodejs010-npm -y && \
    yum clean all

COPY . ${APP_DIR}

RUN cd ${APP_DIR} && \
    scl enable nodejs010 "npm install"

WORKDIR ${APP_DIR}

ENTRYPOINT ["/opt/openshift-auth-proxy/run.sh"]
