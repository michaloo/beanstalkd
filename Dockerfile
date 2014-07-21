FROM ubuntu:14.04

WORKDIR /root
ENV HOME /root

# install basic tools
RUN apt-get update && \
    apt-get install beanstalkd -y

EXPOSE 11300

ADD ./start.sh /app/start.sh

VOLUME ["/var/run/beanstalkd"]

ENV WAL_DIRECTORY /var/run/beanstalkd

ENTRYPOINT ["/bin/bash"]

CMD ["/app/start.sh"]
