# Copyright 2015 Telefónica Investigación y Desarrollo, S.A.U
#
# This file is part of the IoT Agent for the Ultralight 2.0 protocol (IOTAUL) component
#
# IOTAUL is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the License,
# or (at your option) any later version.
#
# IOTAUL is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public
# License along with IOTAUL.
# If not, see http://www.gnu.org/licenses/.
#
# For those usages not covered by the GNU Affero General Public License
# please contact with: [daniel.moranjimenez@telefonica.com]

FROM centos:6

MAINTAINER Petr Viktorovich Fedchenkov <giggsoff@gmail.com>

RUN yum install -y epel-release && yum update -y && \
        printf '[Fiware]\nname=FIWARE repository\nbaseurl=http://repositories.testbed.fi-ware.eu/repo/rpm/x86_64/\ngpgcheck=0\nenabled=1' >> /etc/yum.repos.d/fiware.repo && \
	yum install -y cygnus-ngsi java-1.7.0-openjdk-devel nc git nano

EXPOSE 5050 8081 
#ENTRYPOINT service cygnus start && tail -f /var/log/cygnus/cygnus.log
ENTRYPOINT sleep 10 && /usr/cygnus/bin/cygnus-flume-ng agent --conf /usr/cygnus/conf -f /usr/cygnus/conf/agent_mongo.conf -n cygnusagent -Dflume.root.logger=INFO,console -Duser.timezone=UTC && tail -f /var/log/cygnus/cygnus.log


