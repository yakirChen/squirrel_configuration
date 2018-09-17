
<!-- MarkdownTOC autolink="true" autoanchor="false" markdown_preview="" uri_encoding="false" bullets="-,+,*" remove_image="false" -->

- [基础工具](#基础工具)
    + [Terminal基础配置](#terminal基础配置)
    + [SSH免密](#ssh免密)
- [安装包下载链接](#安装包下载链接)
    + [配置 & 编译](#配置--编译)
    + [Python2 & Python3 源码构建](#python2--python3-源码构建)
    + [GnuPG](#gnupg)
    + [Python 模块安装](#python-模块安装)
    + [构建流程备份](#构建流程备份)

<!-- /MarkdownTOC -->


## 基础工具

```bash
# xcode 命令行工具
xcode-select --install
```

### Terminal基础配置
```bash
git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Developer/macOS-libs/zshrc ~/.zshrc
cp ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Developer/macOS-libs/zsh_history ~/.zsh_history
```

### SSH免密
```bash
# 生成ssh key
ssh-keygen -t rsa -b 4096 -C "iamyakirchen@outlook.com"
# 远程免密登录
touch ~/.ssh/authorized_keys
chmod 700 ~/.ssh                    # drwx------
chmod 600 ~/.ssh/authorized_keys    # -rw------- 
```

## 安装包下载链接

+ [autoconf](https://www.gnu.org/software/autoconf/autoconf.html)
+ [automake](http://www.gnu.org/software/automake)
+ [libtool](https://www.gnu.org/software/libtool/)
+ [zlib](http://www.zlib.net)
+ [XZ Utils](https://tukaani.org/xz)
+ [uuid](http://www.ossp.org/pkg/lib/uuid)
+ [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config)
+ [Docutils](http://docutils.sourceforge.net)
+ [Freetype](https://www.freetype.org)
+ [Libffi](https://github.com/libffi/libffi)
+ [LibreSSL](https://www.libressl.org)
+ [Ccache](https://ccache.samba.org/download.html)
+ [libsodium](https://download.libsodium.org/libsodium/releases/)
+ [Python](https://www.python.org/downloads/source)
+ [gdbm](https://www.gnu.org.ua/software/gdbm/download.html)
+ [Readline](https://tiswww.cwru.edu/php/chet/readline/rltop.html)
+ [mercurial](https://www.mercurial-scm.org)
+ [Ruby](http://www.ruby-lang.org/en/downloads)
+ [nginx](http://nginx.org/en/download.html)
+ [pcre](http://www.pcre.org)
+ [ngx_cache_purge](http://labs.frickle.com/nginx_ngx_cache_purge)
+ [libssh2](https://www.libssh2.org)
+ [wget](https://ftp.gnu.org/gnu/wget/)
+ [bison](https://ftp.gnu.org/gnu/bison/)
+ [jq JSON processor](https://github.com/stedolan/jq)

### 配置 & 编译

```bash
# pkg-config
./configure --prefix=${LOCAL} --with-internal-glib && make -j4 && make install
# autoconf
./configure --prefix=${LOCAL} && make -j4 && make install
# automake
./configure --prefix=${LOCAL} && make -j4 && make install
# libtool
./configure --prefix=${LOCAL} && make -j4 && make install && \
    cd ${LOCAL}/bin && ln -s libtoolize glibtoolize && cd -
# libressl
./configure --prefix=${LOCAL} && make -j4 && make install
# boost
./bootstrap.sh --prefix=${LOCAL} --with-libraries=all
./b2
./b2 --prefix=${LOCAL} install # 默认安装在/usr/local目录下
export BOOST_ROOT=${LOCAL} # 引入环境变量
# zlib
./configure --prefix=${LOCAL} && make -j4 && make install
# xz
./configure --prefix=${LOCAL} && make -j4 && make install
# freetype
./configure --prefix=${LOCAL} --without-harfbuzz && \
    make -j4 && make install
# libffi
git clone --depth 1 git@github.com:libffi/libffi.git
cd libffi
./autogen.sh && \
python ./generate-darwin-source-and-headers.py && \
./configure --enable-debug \
    --disable-dependency-tracking \
    --enable-purify-safety \
    --prefix=${LOCAL} && \
    make -j4 && make install
# 使用macOS自带Python2 
# Ccache
./configure --prefix=${LOCAL} && make -j4 && make install
# wget
./configure --prefix=${LOCAL}/wget \
    --with-ssl=openssl \
    --with-openssl=yes \
    --with-gnu-ld=no \
    --with-libssl-prefix=/Users/yakir/local \
    --without-libgnutls-prefix && make -j4 && make install
# bison
./configure --prefix=${LOCAL} && make -j4 && make install
# jq
autoreconf -i && \
    ./configure --with-oniguruma=builtin --disable-maintainer-mode --prefix=${LOCAL} && \
    make LDFLAGS=-all-static -j4 && make LDFLAGS=-all-static install
# ruby 
./configure --prefix=${RUBY_HOME} && make -j4 && make install
```

### Python2 & Python3 源码构建

```bash
# libsodium 支持 shadowsocks chacha20
./configure --prefix=${LOCAL} && make -j4 && make install
# Readline
git clone --depth 1 git://git.savannah.gnu.org/readline.git
mkdir build && cd build && \
../configure --prefix=${LOCAL} --enable-shared --enable-static --with-purify --enable-FEATURE=yes && \
make -j4 && make install
# python2
mkdir build && cd build && \
../configure --enable-shared --enable-optimizations --enable-unicode=ucs4  --prefix="${PY2_HOME}" && \
make -j4 && make install && python2 --version
# python2扩展包安装
curl -O https://bootstrap.pypa.io/get-pip.py
python2 get-pip.py
pip2 install requests
# pip2包检查更新
pip2 list --outdate

# Docutils
./python2 setup.py install

# python3 python3.6.6 依赖 libffi 3.2.1
mkdir build && cd build && \
../configure --enable-shared \
    --enable-ipv6 \
    --with-dtrace \
    --enable-optimizations \
    --prefix=${PY3_HOME} && \
    make -j4 && make install && python3 --version
# 在python3中自带pip，pip3包检查更新
pip3 list --outdate
```

### GnuPG

[gettext](http://www.gnu.org/software/gettext/)
[libgpg-error](https://gnupg.org/ftp/gcrypt/libgpg-error)
[libgcrypt](https://gnupg.org/ftp/gcrypt/libgcrypt/)
[libassuan](https://gnupg.org/ftp/gcrypt/libassuan/)
[libksba](https://gnupg.org/ftp/gcrypt/libksba/)
[npth](https://gnupg.org/ftp/gcrypt/npth/)
[gnupg](https://www.gnupg.org)

```bash
pkgs=(
    "libgpg-error-1.29.tar.gz"
    "libgcrypt-1.8.2.tar.gz"
    "libassuan-2.5.1.tar.bz2"
    "libksba-1.3.5.tar.bz2"
    "npth-1.5.tar.bz2"
);

urls=(
    "https://gnupg.org/ftp/gcrypt/libgpg-error/${pkgs[1]}"
    "https://gnupg.org/ftp/gcrypt/libgcrypt/${pkgs[2]}"
    "https://gnupg.org/ftp/gcrypt/libassuan/${pkgs[3]}"
    "https://gnupg.org/ftp/gcrypt/libksba/${pkgs[4]}"
    "https://gnupg.org/ftp/gcrypt/npth/${pkgs[5]}"
);

for pkg in ${urls[@]}; do
    curl -OL ${pkg}
done;

for pkg in ${pkgs[@]}; do
    if [[ -f ${pkg} ]]; then
        if [[ 'gz' == ${pkg##*.} ]]; then
            tar -zxf ${pkg}
        elif [[ 'bz2' == ${pkg##*.} ]]; then
            tar -jxf ${pkg}
        elif [[ 'xz' == ${pkg##*.} ]]; then
            tar -Jxf ${pkg}
        fi
    fi
done;
```

```bash
# gettext
./configure --prefix=${LOCAL} --disable-java && make -j4 && make install
# adns
./configure --prefix=${LOCAL} --disable-dynamic && make -j4 && make install
# libgpg-error
./configure --prefix=${LOCAL} \
    --disable-dependency-tracking \
    --disable-silent-rules \
    --enable-static && \
    make -j4 && \
    make install
# libgcrypt
./configure --disable-dependency-tracking \
    --disable-silent-rules \
    --enable-static \
    --prefix=${LOCAL} \
    --disable-asm \
    --disable-jent-support && \
    make -j4 && \
    make install
# libksba
./configure --disable-dependency-tracking \
    --disable-silent-rules \
    --prefix=${LOCAL} && \
    make -j4 && \
    make install
# libassuan
./configure --disable-dependency-tracking \
    --disable-silent-rules \
    --prefix=${LOCAL} \
    --enable-static && \
    make -j4 && \
    make install
# npth
./configure --disable-dependency-tracking \
    --disable-silent-rules \
    --prefix=${LOCAL} && \
    make -j4 && \
    make install
# pinentry
./configure --disable-dependency-tracking \
    --disable-silent-rules \
    --prefix=${LOCAL}/pinentry \
    --disable-pinentry-qt \
    --disable-pinentry-qt5 \
    --disable-pinentry-gnome3 \
    --disable-pinentry-tqt \
    --disable-pinentry-fltk \
    --enable-pinentry-tty \
    --disable-pinentry-gtk2 && \
    make -j4 && \
    make install
# ntbtls
./configure --disable-dependency-tracking \
    --enable-maintainer-mode \
    --disable-silent-rules \
    --prefix=${LOCAL} \
    --disable-heartbeat-support && \
    make -j4 && \
    make install
# gnupg
./configure --disable-dependency-tracking \
      --disable-silent-rules \
      --disable-gnutls \
      --disable-ntbtls \
      --prefix=${LOCAL}/gnupg \
      --enable-symcryptrun \
      --with-pinentry-pgm=/Users/yakir/local/pinentry/bin/pinentry \
      --enable-all-tests \
      --disable-sqlite \
      --disable-ccid-driver && make -j4 && \
      make install
      
# gpg-agent --homedir /Users/yakir/.gnupg --use-standard-socket --daemon
# 安装完成之后执行
# gpgconf --kill gpg-agent && gpg-agent --use-standard-socket --pinentry-program /Users/yakir/local/pinentry/bin/pinentry --daemon
# gpg --list-secret-keys --keyid-format LONG

# dirmngr.conf
# hkp-cacert /Users/yakir/Think/sks-keyservers.netCA.pem
```

### Python 模块安装

```bash
pip2 install requests
pip2 install Mercurial
```

### Shadowsocks
+ Python
```bash
pip2 install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U
```
+ Go [shadowsocks-go](https://github.com/shadowsocks/shadowsocks-go)
```bash
# on server
go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-server
# on client
go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-local
```
+ Rust [shadowsocks-rust](https://github.com/shadowsocks/shadowsocks-rust)
```bash
cargo install shadowsocks-rust
```

### 构建流程备份

```bash
# mercurial
rm -rf build
python2 setup.py build && \
python2 setup.py install --prefix=${PYTHON2_HOME}
hg --version

# Ruby

# nginx
./configure --prefix=${NGINX}  \
    --sbin-path=${NGINX}/nginx  \
    --conf-path=${NGINX}/nginx.conf  \
    --pid-path=${NGINX}/nginx.pid \
    --with-pcre=../pcre-8.41  \
    --with-zlib=../zlib-1.2.11  \
    --with-openssl=../libressl-2.6.2 \
    --with-http_stub_status_module \
    --with-http_realip_module \
    --add-module=../ngx_cache_purge-2.3 && \
    make -j4 && make install
# 开启 & 关闭
sudo nginx
sudo nginx -s stop

# Little CMS & FriBidi & libass & JPEG 
./configure --prefix=${LOCAL} && make -j4 && make install

# Berkeley DB
cd build_unix
../dist/configure --prefix=${LOCAL} \
    --enable-cxx \
    --enable-compat185 \
    --enable-sql \
    --enable-sql_codegen \
    --enable-dbm \
    --enable-stl \
    --enable-jdbc \
    --enable-java \
    --enable-server && make -j4 && make install

# jack-audio-connection-kit & libxml2
./configure --prefix=${LOCAL} && make -j4 && make install 

# libbluray
git clone --recursive http://git.videolan.org/git/libbluray.git
./bootstrap && ./configure --prefix=${LOCAL} && make -j4 && make install 

# libcaca
curl -L caca.zoy.org/files/libcaca/libcaca-0.99.beta19.tar.gz -o libcaca-0.99.beta19.tar.gz
./bootstrap
# 替换文件python/Makefile.in中的`$(am__py_compile) --destdir "$(DESTDIR)"`为`$(am__py_compile) --destdir "$(cacadir)"`
./configure --prefix=${LOCAL} \
    --disable-dependency-tracking \
    --disable-x11 \
    --disable-java \
    --disable-doc \
    --disable-slang \
    --disable-java \
    --disable-csharp \
    --disable-ruby && \
    make -j4 && make install

# libdvdnav

# yasm
./configure --prefix=${LOCAL} && make -j4 && make install

# x265
cd build/linux
./make-Makefiles.bash
# `<enter>`  CMAKE_INSTALL_PREFIX   /Users/yakir/Developer/local
# `<g>`
make -j4 && make install

# x264
./configure --prefix=${LOCAL} \
    --enable-shared \
    --enable-static \
    --enable-strip \
    --bit-depth=10 \
    --disable-lsmash

# Libav
./configure --prefix=${LOCAL} \
    --enable-shared \
    --enable-runtime-cpudetect \
    --disable-debug \
    --enable-gpl \
    --enable-version3 \
    --enable-libx264 \
    --enable-libx265 && \
    make -j4 && \
    make install

# ffmpeg
./configure --prefix=${LOCAL} \
    --enable-shared \
    --enable-pthreads \
    --enable-gpl \
    --enable-version3 \
    --enable-hardcoded-tables \
    --enable-avresample \
    --enable-libx264 \
    --enable-lzma \
    --enable-libbluray && \
    make -j4 && \
    make install

# MuJS
make prefix=/Users/yakir/Developer/local install

# mpv
python3 ./bootstrap.py 
python3 ./waf configure \
    --color=yes \
    --prefix=/Users/yakir/Developer/server/mpv \
    --enable-zsh-comp \
    --enable-libmpv-static \
    --enable-html-build \
    --enable-static-build \
    --enable-libbluray \
    --disable-x11 && \
    python3 ./waf build && \
    python3 TOOLS/osxbundle.py build/mpv
```

---
