#
# Cinder Dockerfile
#
#

FROM diepnt/ubuntu14
ADD script /tmp/script

  RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y cinder-api cinder-scheduler python-cinderclient  supervisor && \
  sed -i '17i[program:cinder-scheduler]' /etc/supervisor/supervisord.conf && \
  sed -i '18icommand=/usr/bin/cinder-scheduler' /etc/supervisor/supervisord.conf && \
  sed -i '19i[program:cinder-api]' /etc/supervisor/supervisord.conf && \
  sed -i '20icommand=/usr/bin/cinder-api' /etc/supervisor/supervisord.conf  && \
  service supervisor start
ADD cinder.conf /etc/cinder/cinder.conf
RUN  bash /tmp/script
  RUN \
  supervisorctl restart cinder-scheduler  && \
  supervisorctl restart cinder-api

# Define working directory.
WORKDIR /root

# Define default command.

CMD ["/usr/bin/supervisord", "-n"]
# Expose ports.
EXPOSE 8776
