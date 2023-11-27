ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:latest-cd
FROM $IMAGE

USER root

WORKDIR /opt/irisapp
RUN chown -R irisowner:irisowner /opt/irisapp

USER irisowner

# copy files to image
WORKDIR /opt/irisapp
COPY --chown=irisowner:irisowner src src

COPY --chown=$ISC_PACKAGE_MGRUSER:$ISC_PACKAGE_IRISGROUP /iris/irissession.sh /
RUN chmod +x /irissession.sh

SHELL ["/irissession.sh"]

RUN \
zn "%SYS" \
set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/Config", "ck", , 1) \
if sc do ##class(Config.Installer).Install() \
zn "WHATSAPP" \
set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/Whatsapp", "ck", , 1) \
# start production
set production = "Whatsapp.Production" \
set ^Ens.Configuration("csp","LastProduction") = production \
do ##class(Ens.Director).SetAutoStart(production) \
do ##class(%Net.HttpRequest).%New(),r.Server="default",r.SSLConfiguration="ISC.FeatureTracker.SSL.Config" \
set sc = 1 \