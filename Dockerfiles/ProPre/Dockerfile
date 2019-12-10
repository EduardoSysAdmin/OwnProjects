RUN apt-get -y install sudo

RUN useradd -m procesamiento && echo "procesamiento:procesamiento" | chpasswd && adduser procesamiento sudo

echo 'procesamiento' | sudo -S service cron start