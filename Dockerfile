FROM fedora
RUN dnf install -y xz tar wget perl make automake gcc gmp gmp-devel \
  ca-certificates libcurl-devel gcc-c++ xz zlib-devel git

RUN wget https://github.com/commercialhaskell/stack/releases/download/v0.1.6.0/stack-0.1.6.0-linux-x86_64.tar.gz -O stack.tar.gz \
  && tar -xvf stack.tar.gz \
  && mv stack-0.1.6.0-linux-x86_64/stack /usr/local/bin \
  && rm -r stack-0.1.6.0-linux-x86_64 \
  && rm stack.tar.gz \
  && mkdir /root/.stack

ADD config.yaml /root/.stack/

RUN stack setup

ENTRYPOINT ["/usr/local/bin/stack"]
