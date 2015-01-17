FROM terrapyn_base

RUN useradd docker -s /bin/bash -d /home/docker
RUN echo 'docker:docker' | chpasswd
RUN chown -R docker:docker /home/docker
RUN echo "docker ALL=(ALL) ALL" >> /etc/sudoers

USER docker
WORKDIR /home/docker/terrapyn_project

EXPOSE 22 80 8000 443 1338
VOLUME ["/home/docker/terrapyn_project"]

USER root
WORKDIR /home/docker/terrapyn_project
CMD /bin/bash
