
from openjdk:8

MAINTAINER EOG eduardo.ortiz@dekra.com

ADD ["entrypoint.sh","/opt/entrypoint"]

ADD ["procesamiento.sh","/opt/procesamiento.sh"]

RUN apt update -y && apt install cron -y
RUN service cron start && echo "* * * * * root /opt/procesamiento.sh\n#" >> /etc/crontab && service cron stop

RUN chmod u+x /opt/procesamiento.sh
CMD bash -C '/opt/entrypoint'
