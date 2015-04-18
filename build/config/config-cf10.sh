#!/bin/sh

JAVAHOME=/usr/lib/jvm/java-7-openjdk-amd64/jre

# use our heavily-locked down/restricted web.xml file
cp -f /tmp/web.xml /opt/coldfusion10/cfusion/wwwroot/WEB-INF/web.xml

# use our jvm.config file (which also swaps jvm out to openjdk 7)
cp -f /tmp/jvm.config /opt/coldfusion10/cfusion/bin

# copy in our SSL certificates to the store
# /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -> /etc/ssl/certs/java/cacerts
$JAVAHOME/bin/keytool -importcert -alias godaddy-root -trustcacerts -noprompt -file /tmp/certs/godaddy-root.cer -keystore $JAVAHOME/lib/security/cacerts -storepass changeit
$JAVAHOME/bin/keytool -importcert -alias godaddy-inter -trustcacerts -noprompt -file /tmp/certs/godaddy-intermediary.cer -keystore $JAVAHOME/lib/security/cacerts -storepass changeit
$JAVAHOME/bin/keytool -importcert -alias godaddy-bmwcca -trustcacerts -noprompt -file /tmp/certs/godaddy-bmwcca.cer -keystore $JAVAHOME/lib/security/cacerts -storepass changeit

# change wwwroot to be /var/www	
sed -i 's|</Host>|<Context path="/" docBase="/var/www" WorkDir="/opt/coldfusion10/cfusion/runtime/conf/Catalina/localhost/tmp" aliases="/CFIDE=/opt/coldfusion10/cfusion/wwwroot/CFIDE,/WEB-INF=/opt/coldfusion10/cfusion/wwwroot/WEB-INF"></Context></Host>|' /opt/coldfusion10/cfusion/runtime/conf/server.xml


