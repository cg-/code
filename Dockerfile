FROM ubuntu:16.04
MAINTAINER Cole Grim

RUN echo "Docker Plugin Benchmark"

WORKDIR /tmp

ADD setup.sh /tmp/setup.sh

RUN /bin/bash /tmp/setup.sh

# Install filebench personalities
#WORKDIR /home/user/scripts/filebench
#COPY workloads/fileserver.f /home/user/scripts/filebench/fileserver.f
#COPY workloads/varmail.f /home/user/scripts/filebench/varmail.f
#COPY workloads/webproxy.f /home/user/scripts/filebench/webproxy.f
#COPY workloads/webserver.f /home/user/scripts/filebench/webserver.f

#WORKDIR /home/user/scripts
#COPY run.sh /home/user/scripts/run.sh
#ENTRYPOINT ["/home/user/scripts/run.sh"]