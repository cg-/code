FROM ubuntu:16.04
MAINTAINER Cole Grim

RUN echo "Docker Plugin Benchmark"

WORKDIR /tmp

ADD setup.sh /tmp/setup.sh

RUN /bin/bash /tmp/setup.sh

# Install filebench personalities
RUN mkdir -p /opt/fb_scripts
ADD workloads/fileserver.f /opt/fb_scripts/fileserver.f
#COPY workloads/varmail.f /home/user/scripts/filebench/varmail.f
#COPY workloads/webproxy.f /home/user/scripts/filebench/webproxy.f
#COPY workloads/webserver.f /home/user/scripts/filebench/webserver.f

RUN mkdir -p /opt/test_scripts
ADD scripts/run_tests.sh /opt/test_scripts/run_tests.sh
ENTRYPOINT ["/bin/bash", "/opt/test_scripts/run_tests.sh"]