#
# Horizon Dockerfile
#
#

FROM diepnt/ubuntu14
ADD script /tmp/script

  RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y openstack-dashboard apache2 libapache2-mod-wsgi memcached python-memcache
ADD local_settings.py /etc/openstack-dashboard/local_settings.py
RUN  bash /tmp/script
RUN service apache2 restart
RUN service memcached restart

# Define working directory.
WORKDIR /root

# Define default command.

CMD ["/usr/bin/supervisord", "-n"]
# Expose ports.
EXPOSE 80 443
