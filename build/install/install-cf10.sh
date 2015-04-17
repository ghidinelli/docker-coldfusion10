#!/bin/sh
#
# Script based on https://forums.adobe.com/message/4727551

/tmp/ColdFusion_10_WWEJ_linux64.bin -f installer.profile

# Disable admin security
/tmp/neo-security-config.sh /opt/coldfusion10/cfusion false

# use our heavily-locked down/restricted web.xml file
cp -f /tmp/web.xml /opt/coldfusion10/cfusion/wwwroot/WEB-INF/web.xml

# change wwwroot to be /var/www	
sed -i 's|</Host>|<Context path="/" docBase="/var/www" WorkDir="/opt/coldfusion10/cfusion/runtime/conf/Catalina/localhost/tmp" aliases="/CFIDE=/opt/coldfusion10/cfusion/wwwroot/CFIDE,/WEB-INF=/opt/coldfusion10/cfusion/wwwroot/WEB-INF"></Context></Host>|' /opt/coldfusion10/cfusion/runtime/conf/server.xml

# Start up the CF server instance and wait for a moment
/opt/coldfusion10/cfusion/bin/coldfusion start; sleep 15

# Simulate a browser request on the admin UI to complete installation
wget -O /dev/null http://localhost:8500/CFIDE/administrator/index.cfm?configServer=true

# Stop the CF server instance
/opt/coldfusion10/cfusion/bin/coldfusion stop

# Re-enable admin security
/tmp/neo-security-config.sh /opt/coldfusion10/cfusion true

#apply mandatory hotfix
java -jar /tmp/cf10_mdt_updt.jar -i silent

#apply hotfix 16
java -jar /tmp/hotfix_016.jar -i silent

# Configure Apache2 to run in front of Tomcat
# /opt/coldfusion10/cfusion/runtime/bin/wsconfig -ws Apache -dir /etc/apache2/ -bin /usr/sbin/apache2 -script /etc/init.d/apache2
