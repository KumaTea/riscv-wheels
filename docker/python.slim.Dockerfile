# FROM --platform=linux/riscv64 buildpack-deps:jammy
FROM riscv64/buildpack-deps:jammy

ARG CP312VER=3.12.0
ARG CP311VER=3.11.6
ARG CP310VER=3.10.13
ARG CP39VER=3.9.18
ARG CP38VER=3.8.18


# Python 3.12

RUN set -ex \
        \
        && cd /tmp \
        && wget https://www.python.org/ftp/python/$CP312VER/Python-$CP312VER.tar.xz \
        && tar xvJf Python-$CP312VER.tar.xz \
        && cd Python-$CP312VER \
        && ./configure --prefix=/opt/python/cp312 --enable-shared --with-ensurepip=no \
        && make -j16 \
        && make install \
        && cd /tmp \
        && rm -rf Python-$CP312VER.tar.xz Python-$CP312VER


# Python 3.11

RUN set -ex \
        \
        && cd /tmp \
        && wget https://www.python.org/ftp/python/$CP311VER/Python-$CP311VER.tar.xz \
        && tar xvJf Python-$CP311VER.tar.xz \
        && cd Python-$CP311VER \
        && ./configure --prefix=/opt/python/cp311 --enable-shared --with-ensurepip=no \
        && make -j16 \
        && make install \
        && cd /tmp \
        && rm -rf Python-$CP311VER.tar.xz Python-$CP311VER


# Python 3.10

RUN set -ex \
        \
        && cd /tmp \
        && wget https://www.python.org/ftp/python/$CP310VER/Python-$CP310VER.tar.xz \
        && tar xvJf Python-$CP310VER.tar.xz \
        && cd Python-$CP310VER \
        && ./configure --prefix=/opt/python/cp310 --enable-shared --with-ensurepip=no \
        && make -j16 \
        && make install \
        && cd /tmp \
        && rm -rf Python-$CP310VER.tar.xz Python-$CP310VER


# Python 3.9

RUN set -ex \
        \
        && cd /tmp \
        && wget https://www.python.org/ftp/python/$CP39VER/Python-$CP39VER.tar.xz \
        && tar xvJf Python-$CP39VER.tar.xz \
        && cd Python-$CP39VER \
        && ./configure --prefix=/opt/python/cp39 --enable-shared --with-ensurepip=no \
        && make -j16 \
        && make install \
        && cd /tmp \
        && rm -rf Python-$CP39VER.tar.xz Python-$CP39VER


# Python 3.8

RUN set -ex \
        \
        && cd /tmp \
        && wget https://www.python.org/ftp/python/$CP38VER/Python-$CP38VER.tar.xz \
        && tar xvJf Python-$CP38VER.tar.xz \
        && cd Python-$CP38VER \
        && ./configure --prefix=/opt/python/cp38 --enable-shared --with-ensurepip=no \
        && make -j16 \
        && make install \
        && cd /tmp \
        && rm -rf Python-$CP38VER.tar.xz Python-$CP38VER


# PATH and LD

RUN set -ex \
        \
        && echo "export PATH=/opt/python/cp312/bin:/opt/python/cp311/bin:/opt/python/cp310/bin:/opt/python/cp39/bin:/opt/python/cp38/bin:$PATH" > /etc/profile.d/99-add-python-bin.sh \
        && chmod +x /etc/profile.d/99-add-python-bin.sh \
        && echo "source /etc/profile.d/99-add-python-bin.sh" >> /root/.bashrc \
        && echo "/opt/python/cp312/lib" >> /etc/ld.so.conf.d/python3.conf \
        && echo "/opt/python/cp311/lib" >> /etc/ld.so.conf.d/python3.conf \
        && echo "/opt/python/cp310/lib" >> /etc/ld.so.conf.d/python3.conf \
        && echo "/opt/python/cp39/lib"  >> /etc/ld.so.conf.d/python3.conf \
        && echo "/opt/python/cp38/lib"  >> /etc/ld.so.conf.d/python3.conf \
        && ldconfig


# Entry

CMD ["/bin/bash"]

