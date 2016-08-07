FROM aquilae/dotnet-zeromq:dotnet-latest.base

RUN cd /tmp \
    && git clone git://github.com/jedisct1/libsodium.git \
    && cd libsodium \
    && git checkout stable \
    && ./autogen.sh \
    && ./configure \
    && make check \
    && make install \
    && ldconfig

RUN cd /tmp \
    && git clone --depth 1 git://github.com/zeromq/libzmq.git \
    && cd libzmq \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && ldconfig
