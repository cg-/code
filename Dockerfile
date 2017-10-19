FROM ubuntu:16.04
MAINTAINER Cole Grim

RUN echo "Docker Plugin Benchmark"

# Install prereqs
RUN echo "Installing dependencies into container."
RUN apt update
RUN apt install -y wget tar automake build-essential libtool byacc flex vim

RUN wget https://github.com/filebench/filebench/archive/1.4.9.1.tar.gz -O /tmp/fb.tar.gz
RUN tar -zxvf /tmp/fb.tar.gz -C /opt

RUN wget http://www.coker.com.au/bonnie++/bonnie++-1.03e.tgz -O /tmp/bonnie.tgz
RUN tar -zxvf /tmp/bonnie.tgz -C /opt

RUN wget http://www.iozone.org/src/current/iozone3_457.tar -O /tmp/iozone.tar
RUN tar -xvf /tmp/iozone.tar -C /opt

# Install filebench personalities
#WORKDIR /home/user/scripts/filebench
#COPY workloads/fileserver.f /home/user/scripts/filebench/fileserver.f
#COPY workloads/varmail.f /home/user/scripts/filebench/varmail.f
#COPY workloads/webproxy.f /home/user/scripts/filebench/webproxy.f
#COPY workloads/webserver.f /home/user/scripts/filebench/webserver.f

# Install filebench
RUN cd /opt/filebench-1.4.9.1 && libtoolize && aclocal && autoheader && automake --add-missing && autoconf && ./configure && make && make install
RUN rm -rf /opt/filebench-1.4.9.1
RUN rm /tmp/fb.tar.gz

# Install bonnie++
RUN cd /opt/bonnie++-1.03e && ./configure && make && make install
RUN rm /tmp/bonnie.tgz
RUN rm -rf bonnie++-1.03e

RUN cd /opt/iozone3_457/src/current && make linux-AMD64 && mv iozone /usr/local/bin/iozone

RUN rm -rf /opt/iozone3_457
RUN rm /tmp/iozone.tar


#WORKDIR /home/user/scripts
#COPY run.sh /home/user/scripts/run.sh
#ENTRYPOINT ["/home/user/scripts/run.sh"]