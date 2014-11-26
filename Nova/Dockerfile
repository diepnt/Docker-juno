#
# Nova dockerfile
#

# Pull base image.
FROM diepnt/ubuntu14

# Install keystone
  RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y nova-api nova-cert nova-conductor nova-consoleauth nova-novncproxy nova-scheduler python-novaclient supervisor && \
  sed -i '17i[program:nova-api]' /etc/supervisor/supervisord.conf && \
  sed -i '18icommand=/usr/bin/nova-api' /etc/supervisor/supervisord.conf && \
  sed -i '19i[program:nova-cert]' /etc/supervisor/supervisord.conf && \
  sed -i '20icommand=/usr/bin/nova-cert' /etc/supervisor/supervisord.conf && \
  sed -i '21i[program:nova-consoleauth]' /etc/supervisor/supervisord.conf && \
  sed -i '22icommand=/usr/bin/nova-consoleauth' /etc/supervisor/supervisord.conf && \
  sed -i '23i[program:nova-scheduler]' /etc/supervisor/supervisord.conf && \
  sed -i '24icommand=/usr/bin/nova-scheduler' /etc/supervisor/supervisord.conf && \
  sed -i '25i[program:nova-conductor]' /etc/supervisor/supervisord.conf && \
  sed -i '26icommand=/usr/bin/nova-conductor' /etc/supervisor/supervisord.conf && \
  sed -i '27i[program:nova-novncproxy]' /etc/supervisor/supervisord.conf && \
  sed -i '28icommand=/usr/bin/nova-novncproxy' /etc/supervisor/supervisord.conf && \
  rm /var/lib/nova/nova.sqlite && \
  /etc/init.d/supervisor start
ADD nova.conf /etc/nova/nova.conf
RUN \
  supervisorctl restart nova-api && \
  supervisorctl restart nova-cert && \
  supervisorctl restart nova-consoleauth && \
  supervisorctl restart nova-scheduler && \
  supervisorctl restart nova-conductor &&\
  supervisorctl restart nova-novncproxy 

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/usr/bin/supervisord", "-n"]
# Expose ports.
EXPOSE 8774
