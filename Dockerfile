FROM ubuntu:16.04
MAINTAINER Cole Grim

RUN echo "Docker Plugin Benchmark"

WORKDIR /tmp

ADD setup.sh /tmp/setup.sh

RUN /bin/bash /tmp/setup.sh

VOLUME ["/test", "/results"]

# Install filebench personalities
RUN mkdir -p /opt/fb_scripts
ADD workloads/fileserver.f /opt/fb_scripts/fileserver.f
ADD workloads/varmail.f /opt/fb_scripts/varmail.f
ADD workloads/webserver.f /opt/fb_scripts/webserver.f
ADD workloads/webproxy.f /opt/fb_scripts/webproxy.f

RUN mkdir -p /opt/test_scripts
ADD scripts/run_tests.sh /opt/test_scripts/run_tests.sh

#ENTRYPOINT ["/bin/bash", "/opt/test_scripts/run_tests.sh"]