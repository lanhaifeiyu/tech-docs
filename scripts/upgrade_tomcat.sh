#!/bin/sh
###############################################################################
#
#                    S H E L L   S C R I P T  F I L E  
# 
#                       COPYRIGHT 2016-2017, ZOM LTD
#                        All Rights Reserved
#
###############################################################################

function initialize_common_variables
{
    SUCCESS=0
    FAILURE=255

    JDK_VER=1.8.0_144
    TOMCAT_VER=8.5.59 #8.5.20

    CP="/bin/cp"
    MV="/bin/mv"
    RM="/bin/rm"
    ID="/bin/id"
    LN="/bin/ln"
    SED="/bin/sed"
    CHMOD="/bin/chmod"
    CHOWN="/bin/chown"
    CHGRP="/bin/chgrp"
    MKDIR="/bin/mkdir"
    TOUCH="/usr/bin/touch"
}

function upgrade_tomcat_env
{

    printf "\n... tomcat upgrade start 8.5.20 -> 8.5.59 ...\n\n"

    #create tomcat env
    TOMCAT_PACKAGE=apache-tomcat-${TOMCAT_VER}
    newuser=itrunk

    ${RM} -rf /home/itrunk/tmp/${TOMCAT_PACKAGE}/

    tar -xzf ./${TOMCAT_PACKAGE}.tar.gz -C /home/itrunk/tmp/

    ${RM} -rf /usr/local/${newuser}_tomcat/LICENSE
    ${RM} -rf /usr/local/${newuser}_tomcat/NOTICE
    ${RM} -rf /usr/local/${newuser}_tomcat/RELEASE-NOTES
    ${RM} -rf /usr/local/${newuser}_tomcat/RUNNING.txt

    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/BUILDING.txt /usr/local/${newuser}_tomcat/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/CONTRIBUTING.md /usr/local/${newuser}_tomcat/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/LICENSE /usr/local/${newuser}_tomcat/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/NOTICE /usr/local/${newuser}_tomcat/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/README.md /usr/local/${newuser}_tomcat/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/RELEASE-NOTES /usr/local/${newuser}_tomcat/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/RUNNING.txt /usr/local/${newuser}_tomcat/

    ${CP} -f /usr/local/${newuser}_tomcat/conf/catalina.properties  /home/itrunk/tmp/${TOMCAT_PACKAGE}/
    ${CP} -f /usr/local/${newuser}_tomcat/conf/context.xml  /home/itrunk/tmp/${TOMCAT_PACKAGE}/
    ${CP} -f /usr/local/${newuser}_tomcat/conf/server.xml  /home/itrunk/tmp/${TOMCAT_PACKAGE}/

    ${RM} -rf /usr/local/${newuser}_tomcat/bin/*
    ${RM} -rf /usr/local/${newuser}_tomcat/conf/*
    ${RM} -rf /usr/local/${newuser}_tomcat/lib/*
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/bin/* /usr/local/${newuser}_tomcat/bin/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/conf/* /usr/local/${newuser}_tomcat/conf/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/lib/* /usr/local/${newuser}_tomcat/lib/

    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/catalina.properties /usr/local/${newuser}_tomcat/conf/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/context.xml /usr/local/${newuser}_tomcat/conf/
    ${CP} -f /home/itrunk/tmp/${TOMCAT_PACKAGE}/server.xml /usr/local/${newuser}_tomcat/conf/

    #### update startup.sh and shutdown.sh
    CATALINA_HOME=/usr/local/${newuser}_tomcat
    CATALINA_BASE=/usr/local/${newuser}_tomcat
    TOMCAT_HOME=/usr/local/${newuser}_tomcat
    JAVA_HOME=/usr/java/jdk${JDK_VER}
    ${SED} -i -e "/^$/d; s/^.* CATALINA_BASE=.*//g" /usr/local/${newuser}_tomcat/bin/startup.sh
    ${SED} -i -e "/^$/d; s/^.* CATALINA_HOME=.*//g" /usr/local/${newuser}_tomcat/bin/startup.sh
    ${SED} -i -e "/^$/d; s/^.* TOMCAT_HOME=.*//g" /usr/local/${newuser}_tomcat/bin/startup.sh
    ${SED} -i -e "/^$/d; s/^.* JAVA_HOME=.*//g" /usr/local/${newuser}_tomcat/bin/startup.sh
    ${SED} -i -e "/^$/d; s/^.* CATALINA_BASE=.*//g" /usr/local/${newuser}_tomcat/bin/shutdown.sh
    ${SED} -i -e "/^$/d; s/^.* CATALINA_HOME=.*//g" /usr/local/${newuser}_tomcat/bin/shutdown.sh
    ${SED} -i -e "/^$/d; s/^.* TOMCAT_HOME=.*//g" /usr/local/${newuser}_tomcat/bin/shutdown.sh
    ${SED} -i -e "/^$/d; s/^.* JAVA_HOME=.*//g" /usr/local/${newuser}_tomcat/bin/shutdown.sh

    ${SED} -i "/esac/aexport CATALINA_BASE=${CATALINA_BASE}\nexport CATALINA_HOME=${CATALINA_HOME}\nexport TOMCAT_HOME=${TOMCAT_HOME}\nexport JAVA_HOME=${JAVA_HOME}" /usr/local/${newuser}_tomcat/bin/startup.sh
    ${SED} -i "/esac/aexport CATALINA_BASE=${CATALINA_BASE}\nexport CATALINA_HOME=${CATALINA_HOME}\nexport TOMCAT_HOME=${TOMCAT_HOME}\nexport JAVA_HOME=${JAVA_HOME}" /usr/local/${newuser}_tomcat/bin/shutdown.sh

    ####update     catalina.sh for JVM memory and heap
    ${SED} -i -e "/^JAVA_OPTS=.*$/d" /usr/local/${newuser}_tomcat/bin/catalina.sh
    MEM=$(free -m | grep Mem |awk '{print $2}')
    let heap=(MEM/4/512+1)*512
    if [ ${heap} -lt 512 ]; then
        ${SED} -i "/#JAVA_OPTS=\"$JAVA_OPTS/aJAVA_OPTS=\"-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms512m -Xmx1024m -XX:+DisableExplicitGC\"" /usr/local/${newuser}_tomcat/bin/catalina.sh
    elif [ ${heap} -gt 8192 ]; then
        ${SED} -i "/#JAVA_OPTS=\"$JAVA_OPTS/aJAVA_OPTS=\"-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms8192m -Xmx8192m -XX:+DisableExplicitGC\"" /usr/local/${newuser}_tomcat/bin/catalina.sh
    else
        ${SED} -i "/#JAVA_OPTS=\"$JAVA_OPTS/aJAVA_OPTS=\"-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms${heap}m -Xmx${heap}m -XX:+DisableExplicitGC\"" /usr/local/${newuser}_tomcat/bin/catalina.sh
    fi

    ####update     catalina.sh for umask
    ${SED} -i "s/UMASK=\"0027\"/UMASK=\"0022\"/g" /usr/local/${newuser}_tomcat/bin/catalina.sh

}

function setup_tomcat_nonroot_user
{
		chown -R itrunk:itrunk /usr/local/itrunk_tomcat
		chmod -R 640 /usr/local/itrunk_tomcat/logs/*
}

function set_tomcat_log_permission
{

	 grep -q 'UMASK="0022"' /usr/local/itrunk_tomcat/bin/catalina.sh && sed -i 's/UMASK="0022"/UMASK="0027"/' /usr/local/itrunk_tomcat/bin/catalina.sh || echo 'UMASK="0027"' >> /usr/local/itrunk_tomcat/bin/catalina.sh

}
function remove_tomcat_version
{

	mkdir -p /tmp/updatettomcat
	rm -rf /tmp/updatettomcat/*
	cp /usr/local/itrunk_tomcat/lib/catalina.jar /tmp/updatettomcat/
	unzip /tmp/updatettomcat/catalina.jar -d /tmp/updatettomcat/  > /dev/null

	sed -i 's/server.info=.*/server.info=Apache Tomcat/' /tmp/updatettomcat/org/apache/catalina/util/ServerInfo.properties
	sed -i 's/server.number=.*/server.number=0.0.0.0/' /tmp/updatettomcat/org/apache/catalina/util/ServerInfo.properties
	#sed -i 's/server.info=.*/server.info=Apache Tomcat/' /tmp/updatettomcat/org/apache/catalina/util/ServerInfo.properties
	cd  /tmp/updatettomcat/
	jar uvf catalina.jar ./org/apache/catalina/util/ServerInfo.properties  >/dev/null
	/usr/bin/cp -rf  catalina.jar /usr/local/itrunk_tomcat/lib/
	chown itrunk:itrunk /usr/local/itrunk_tomcat/lib/catalina.jar

}

function upgrade_finished
{
    printf "\n... tomcat upgrade completed ...\n\n"
}

############################################################################
# Main Entry
############################################################################
function main
{    
    initialize_common_variables
    upgrade_tomcat_env
    setup_tomcat_nonroot_user
    set_tomcat_log_permission
    remove_tomcat_version
    upgrade_finished
    
    exit ${SUCCESS}
}

main ${*}

