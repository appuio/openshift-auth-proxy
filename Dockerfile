FROM centos/nodejs-4-centos7

MAINTAINER OpenShift Development <dev@lists.openshift.redhat.com>

ENV APP_DIR=${HOME}

COPY . ${APP_DIR}

USER root

RUN yum update -y && \
    yum clean all && \
    cd ${APP_DIR} && \
    scl enable rh-nodejs6 "npm install" && \
    fix-perms ${HOME}

USER 1001

WORKDIR ${APP_DIR}

CMD ["/opt/app-root/src/run.sh"]
