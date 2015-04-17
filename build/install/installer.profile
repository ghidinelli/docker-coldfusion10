INSTALLER_UI=SILENT
SILENT_LICENSE_MODE=developer
# provide serial number if SILENT_LICENSE_MODE=full
#SILENT_SERIAL_NUMBER=serial_number

SILENT_INSTALL_ODBC=false
#i cant imagine a scenario where I need the samples
SILENT_INSTALL_SAMPLES=false

#only used on windows with .net installed
#SILENT_INSTALL_JNBRIDGE=false

SILENT_INSTALL_ADMIN=true
SILENT_INSTALL_SOLR=false
SILENT_INSTALL_FOLDER=/opt/coldfusion10

#only unix systems can use this.. it starts CF automatically when system boots
#does not work on linux!
#SILENT_CONFIGURE_SYSTEM_INIT

SILENT_ENABLE_SECURE_PROFILE=false
SILENT_ADMIN_IP=
SILENT_ADMIN_USERNAME=admin
SILENT_ADMIN_PASSWORD=Adm1n$
SILENT_ENABLE_RDS=false

SILENT_JETTY_USERNAME=admin
SILENT_JETTY_PASSWORD=Adm1n$

SILENT_CONTEXT_ROOT=
#this doesnt seem to do anything
#SILENT_AUTO_ENABLE_UPDATES=true