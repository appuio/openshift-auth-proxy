FROM centos/nodejs-4-centos7

MAINTAINER OpenShift Development <dev@lists.openshift.redhat.com>

ENV APP_DIR=${HOME}

COPY . ${APP_DIR}

USER root

RUN yum update -y && \
    yum clean all && \
    cd ${APP_DIR} && \
    scl enable rh-nodejs4 "npm install" && \
    chown -R 1001:0 /opt/app-root && chmod -R ug+rwx /opt/app-root

USER 1001

WORKDIR ${APP_DIR}

CMD ["/opt/app-root/src/run.sh"]
