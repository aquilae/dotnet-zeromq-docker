FROM aquilae/dotnet-zeromq:dotnet-latest.base

RUN cd /tmp/build \
    && git clone git://github.com/jedisct1/libsodium.git libsodium \
    && cd libsodium \
    && git checkout stable \
    && ./autogen.sh \
    && ./configure \
    && make check \
    && make install \
    && ldconfig

RUN cd /tmp/build \
    && git clone --depth 1 git://github.com/zeromq/libzmq.git libzmq \
    && cd libzmq \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && ldconfig

RUN rm /tmp/build -rf
