#
# keystone dockerfile
#

# Pull base image.
FROM diepnt/ubuntu14

# Install keystone
ADD script /tmp/script
  RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y  keystone python-keystoneclient rabbitmq-server supervisor && \
  sed -i '17i[program:keystone]' /etc/supervisor/supervisord.conf && \
  sed -i '18icommand=/usr/bin/keystone-all' /etc/supervisor/supervisord.conf && \
  rm /var/lib/keystone/keystone.db && \
  service supervisor start
ADD keystone.conf /etc/keystone/keystone.conf
RUN  supervisorctl restart keystone
RUN  bash /tmp/script


# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/usr/bin/supervisord", "-n"]
# Expose ports.
EXPOSE 5000 35357 5672
