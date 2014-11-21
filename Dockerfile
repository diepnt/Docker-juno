#
# Horizon Dockerfile
#
#

FROM diepnt/ubuntu14
ADD script /tmp/script

  RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y openstack-dashboard apache2 libapache2-mod-wsgi memcached python-memcache
  service supervisor start
ADD cinder.conf /etc/cinder/cinder.conf
RUN service apache2 start
RUN service memcached start
RUN  bash /tmp/script

# Define working directory.
WORKDIR /root

# Define default command.

CMD ["/usr/bin/supervisord", "-n"]
# Expose ports.
EXPOSE 80 443
