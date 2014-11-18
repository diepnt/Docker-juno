#
# Glance Dockerfile
#
#

FROM diepnt/ubuntu14
ADD script /tmp/script

  RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y glance python-glanceclient  supervisor && \
  sed -i '/sqlite_db/d' /etc/glance/glance-api.conf && \
  sed -i '/sqlite_db/d' /etc/glance/glance-registry.conf && \
  sed -i '553iconnection = mysql://keystone:KEYSTONE_DBPASS@mysql/keystone'  /etc/glance/glance-api.conf && \
  sed -i '81iconnection = mysql://keystone:KEYSTONE_DBPASS@mysql/keystone' /etc/glance/glance-registry.conf && \
  sed -i '647iauth_uri = http://controller:5000'  /etc/glance/glance-api.conf && \
  sed -i '175iauth_uri = http://controller:5000' /etc/glance/glance-registry.conf && \
  sed -i '/^auth_host/s/=.*/= keystone/' /etc/glance/glance-api.conf && \
  sed -i '/^auth_host/s/=.*/= keystone/' /etc/glance/glance-registry.conf && \
  sed -i '/^admin_tenant_name/s/=.*/= service/' /etc/glance/glance-api.conf && \
  sed -i '/^admin_tenant_name/s/=.*/= service/' /etc/glance/glance-registry.conf && \
  sed -i '/^admin_user/s/=.*/= glance/' /etc/glance/glance-api.conf && \
  sed -i '/^admin_user/s/=.*/= glance/' /etc/glance/glance-registry.conf && \
  sed -i '/^admin_password/s/=.*/= GLANCE_PASS/' /etc/glance/glance-api.conf && \
  sed -i '/^admin_password/s/=.*/= GLANCE_PASS/' /etc/glance/glance-registry.conf && \
  sed -i '655iflavor = keystone'  /etc/glance/glance-api.conf && \
  sed -i '183iflavor = keystone' /etc/glance/glance-registry.conf && \
  sed -i '17i[program:glance-api]' /etc/supervisor/supervisord.conf && \
  sed -i '18icommand=/usr/bin/glance-api' /etc/supervisor/supervisord.conf && \
  sed -i '19i[program:glance-registry]' /etc/supervisor/supervisord.conf && \
  sed -i '20icommand=/usr/bin/glance-registry' /etc/supervisor/supervisord.conf  && \
  service supervisor start && \
  bash /tmp/script && \
  supervisorctl restart glance-api && \
  supervisorctl restart glance-registry

# Define working directory.
WORKDIR /root

# Define default command.

CMD ["/usr/bin/supervisord", "-n"]
# Expose ports.
EXPOSE 9292
