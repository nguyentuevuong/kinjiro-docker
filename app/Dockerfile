FROM openjdk:8-jdk-oracle

ENV WILDFLY_VERSION=10.1.0.Final
ENV JBOSS_HOME=/opt/jboss/wildfly
ENV LAUNCH_JBOSS_IN_BACKGROUND=true

ADD ./wildfly.tgz /opt/jboss
ADD ./deployments.tgz /opt/jboss/wildfly/standalone

WORKDIR /opt/jboss

EXPOSE 8080

CMD ["-b", "0.0.0.0"]

ENTRYPOINT "/opt/jboss/wildfly/bin/standalone.sh"
