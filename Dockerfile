FROM golang:1.10

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y install vim apt-utils
RUN apt-get -y install automake bison flex g++ git libboost-all-dev libevent-dev libssl-dev libtool make pkg-config gpg
RUN curl -s https://www-us.apache.org/dist/thrift/0.11.0/thrift-0.11.0.tar.gz.asc > /tmp/thrift-0.11.0.tar.gz.asc
RUN curl -s https://www-us.apache.org/dist/thrift/0.11.0/thrift-0.11.0.tar.gz > /tmp/thrift-0.11.0.tar.gz 
RUN gpg --keyserver pgpkeys.mit.edu --recv-key DE885DD3
RUN (cd /tmp && tar xf thrift-0.11.0.tar.gz && cd thrift-0.11.0 && ./bootstrap.sh && ./configure --without-java --without-csharp --without-erlang --without-nodejs --without-lua --without-python --without-perl --without-php --without-php_extension --without-dart --without-ruby --without-haskell --with-go --without-rs --without-haxe --without-dotnetcore --without-d && make -j 3 && make install)

WORKDIR /app
