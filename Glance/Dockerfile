#
# Glance Dockerfile
#
#

FROM diepnt/ubuntu14
ADD script /tmp/script

  RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y glance python-glanceclient  supervisor && \
  sed -i '17i[program:glance-api]' /etc/supervisor/supervisord.conf && \
  sed -i '18icommand=/usr/bin/glance-api' /etc/supervisor/supervisord.conf && \
  sed -i '19i[program:glance-registry]' /etc/supervisor/supervisord.conf && \
  sed -i '20icommand=/usr/bin/glance-registry' /etc/supervisor/supervisord.conf  && \
  service supervisor start
ADD glance-api.conf /etc/glance/glance-api.conf
ADD glance-registry.conf /etc/glance/glance-registry.conf
RUN  bash /tmp/script
  RUN \
  supervisorctl restart glance-api && \
  supervisorctl restart glance-registry

# Define working directory.
WORKDIR /root

# Define default command.

CMD ["/usr/bin/supervisord", "-n"]
# Expose ports.
EXPOSE 9292
