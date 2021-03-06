FROM php-73-rhel7:latest  
MAINTAINER Josue Ramirez


COPY index.html /opt/app-root/src
USER root
RUN chmod 777 /opt/app-root/src
COPY run_wordpress.sh /
USER root
RUN chmod 777 /run_wordpress.sh


USER 907
EXPOSE 8080

CMD ["/bin/bash","/run_wordpress.sh"]
# Set labels usados en OpenShift para describir la construccion de la imagen
LABEL io.k8s.description="wordpress-intranet" \
      io.k8s.display-name="wordpress apache php " \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,wordpress,apache" \
      io.openshift.min-memory="3Gi" \
      io.openshift.min-cpu="2" \
      io.openshift.non-scalable="false"
