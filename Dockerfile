FROM centos/nodejs-6-centos7

MAINTAINER OpenShift Development <dev@lists.openshift.redhat.com>

ENV APP_DIR=/opt/openshift-auth-proxy

COPY . ${APP_DIR}

USER root

RUN cd ${APP_DIR} && \
    scl enable rh-nodejs6 "npm install"

USER 1001

WORKDIR ${APP_DIR}

ENTRYPOINT ["/opt/openshift-auth-proxy/run.sh"]
