#
# neutron dockerfile
#

# Pull base image.
FROM diepnt/ubuntu14

# Install neutron
  RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y neutron-server neutron-plugin-ml2 supervisor && \
  sed -i '17i[program:neutron-server]' /etc/supervisor/supervisord.conf && \
  sed -i '18icommand=/usr/bin/neutron-server' /etc/supervisor/supervisord.conf && \
  service supervisor start 
ADD neutron.conf /etc/neutron/neutron.conf
ADD ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini
RUN  supervisorctl restart neutron-server


# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/usr/bin/supervisord", "-n"]
# Expose ports.
EXPOSE 9696
