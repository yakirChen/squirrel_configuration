#!/usr/bin/env bash
HIST_STAMPS="yyyy-mm-dd"
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="jtriley"
plugins=(
    ant
   # mvn
    spring
    rust
    cargo
    rustup
    golang
    npm
    git
    git-extras
    zsh-completions
#    zsh-autosuggestions
    zsh-navigation-tools
    zsh-history-substring-search
    colorize
)

func ssproxy() {
    sslocal -s $1 -p $2 -l 1080 -k $3  -t 300 -m aes-256-cfb
}

# ########################################## User Configuration #####################################
export LOCAL=${HOME}/local
export VOLUMES_TOSHIBA=/Volumes/Toshiba
export VOLUMES_TOSHIBA_REPOS=/Volumes/Toshiba/repos
export VOLUMES_TOSHIBA_SERVERS=/Volumes/Toshiba/servers
export JARS=${LOCAL}/jar

# 语言工具
export RUBY_HOME=${LOCAL}/ruby
export PY2_HOME=${LOCAL}/python2
export PY3_HOME=${LOCAL}/python3
export GOROOT=${LOCAL}/go
export NODE_PATH=${LOCAL}/node
export NODE_GLOBAL_PATH=${VOLUMES_TOSHIBA_REPOS}/node_global
#export RUST_HOME=${LOCAL}/rust
export CARGO_HOME=${VOLUMES_TOSHIBA_REPOS}/cargo
export CARGO_PATH=${CARGO_HOME}/
export RUSTUP_HOME=${VOLUMES_TOSHIBA_REPOS}/rustup
export RUSTFLAGS='-C target-cpu=native'
export RUSTUP_TOOLCHAIN=nightly
#export RUSTUP_DIST_SERVER=https://static.rust-lang.org
#export RUSTUP_UPDATE_ROOT=https://static.rust-lang.org/rustup
export RUST_SRC_PATH=${RUSTUP_HOME}/toolchains/${RUSTUP_TOOLCHAIN}-x86_64-apple-darwin/lib/rustlib/src/rust/src
export DYLD_LIBRARY_PATH=$(${CARGO_HOME}/bin/rustc --print sysroot)/lib:$DYLD_LIBRARY_PATH
# export RUST_SRC_PATH=
# export OCAML_HOME=${LOCAL}/ocaml
# export GROOVY_HOME=${LOCAL}/groovy
# export LUA_HOME=${LOCAL}/lua
# export GCC_HOME=${LOCAL}/gcc
#export CLANG_HOME=${VOLUMES_TOSHIBA_REPOS}/clang
# export IGV_HOME=${LOCAL}/igv

# 开发辅助
export MYSQL_BASE_DIR=/Volumes/Toshiba/servers/mysql
export MYSQL_DATA_DIR=/Volumes/Toshiba/repos/mysql/data
export MYSQL_LOGS_DIR=/Volumes/Toshiba/repos/mysql/logs
# export BTRACE_HOME=${LOCAL}/btrace
# export HTOP_HOME=${LOCAL}/htop
# export FISH_HOME=${LOCAL}/fish

# 运行时环境变量
export PKG_CONFIG=${LOCAL}/bin/pkg-config       # pkg-config
export PKG_CONFIG_PATH=${PKG_CONFIG}
export PKG_CONFIG_LIBDIR=${LOCAL}/lib/pkgconfig
export CFLAGS="-I${LOCAL}/include -I${LOCAL}/include/openssl -I${LOCAL}/include/readline -I${LOCAL}/include/sodium"
# -I${LOCAL}/include/lzma -I${LOCAL}/include/freetype2
export CXXFLAGS=${CFLAGS}
export CPPFLAGS=${CFLAGS}
export LDFLAGS="-L${LOCAL}/lib"
export BOOST_ROOT=${VOLUMES_TOSHIBA_REPOS}/boost
export OPENSSL_CFLAGS=${LOCAL}/bin/openssl      # openssl
export OPENSSL_LIBS=${LOCAL}/lib                # openssl lib
# export OPAMROOT=${VOLUMES_TOSHIBA_REPOS}/opam
# export OCAML_TOPLEVEL_PATH=${VOLUMES_TOSHIBA_REPOS}/ocaml
# export COREUTILS=${LOCAL}/coreutils
export GOPATH=${VOLUMES_TOSHIBA_REPOS}/go/gopath
export GOCACHE=${VOLUMES_TOSHIBA_REPOS}/go/gocache

# 服务
#export ZK_HOME=${VOLUMES_TOSHIBA}/Developer/zookeeper
export ZK_HOME=${LOCAL}/zookeeper
export TOMCAT_HOME=${VOLUMES_TOSHIBA_SERVERS}/tomcat
export REDIS_HOME=${VOLUMES_TOSHIBA_REPOS}/redis
export KOTLIN_NATIVE_HOME=${VOLUMES_TOSHIBA_REPOS}/kotlin-native
# export NGINX=${LOCAL}/nginx
# export MYSQL_SHELL=${LOCAL}/mysqlsh
export WGET_HOME=${LOCAL}/wget

# 打包编译工具
export JAVACC_HOME=${LOCAL}/javacc
export CHEZ_SCHEME_HOME=${VOLUMES_TOSHIBA_SERVERS}/chez_scheme
export NASM_HOME=${LOCAL}/nasm
export BISON_HOME=${LOCAL}/bison
export PROTOBUF_HOME=${LOCAL}/protobuf
#export MX_HOME=${LOCAL}/mx
export CMAKE_HOME=${LOCAL}/cmake
export M2_HOME=${LOCAL}/maven                   # maven
export MAVEN_CONFIG=${M2_HOME}/conf
export MAVEN_SKIP_RC=true
export ANT_HOME=${LOCAL}/ant                    # ant
export GRADLE_HOME=${LOCAL}/gradle              # gradle
export BAZEL_HOME=${LOCAL}/bazel
export YASM_HOME=${LOCAL}/yasm
export YARN_HOME=${LOCAL}/yarn                # yarn

# repos
export HASKELL_BIN=${VOLUMES_SD}/repos/haskell
export GRADLE_USER_HOME=${VOLUMES_SD}/repos/gradle
export GEM_HOME=${VOLUMES_SD}/repos/gem

# 日常工具
# export ARIA2_HOME=${LOCAL}/aria2              # aria2
export FFMPEG_HOME=${LOCAL}/ffmpeg
export GNUPG_HOME=${LOCAL}/gnupg

export JFX_HOME=${VOLUMES_SD_APP}/openjfx
export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v 11)
export JAVA_12_HOME=$(/usr/libexec/java_home -v 12)
# export GRAAL_HOME='/Library/Java/JavaVirtualMachines/graalvm/Contents/Home'
export JDK_18_HOME=${JAVA_8_HOME}
export JDK_11_HOME=${JAVA_11_HOME}
export JDK_12_HOME=${JAVA_12_HOME}
export KOTLIN_HOME=${VOLUMES_SD_APP}/kotlinc

alias jdk8="export JAVA_HOME=${JAVA_8_HOME}"
#alias jdk90="export JAVA_HOME=${JDK_19_ZERO_HOME}"
alias jdk11="export JAVA_HOME=${JAVA_11_HOME}"
alias jdk12="export JAVA_HOME=${JAVA_12_HOME}"
# alias graal="export JAVA_HOME=${GRAAL_HOME} && \
    # export PATH=$JAVA_HOME/bin:$PATH"
# alias zulujdk8="export JAVA_HOME=${ZULU_JDK_18_HOME}"
# alias zulujdk9="export JAVA_HOME=${ZULU_JDK_19_HOME}"

export JDK_BOOT_DIR=${JAVA_8_HOME}

jdk8

export DEF_JAVA_OPTS="-Xms100M \
-Xmx256M \
-Xverify:none \
-XX:ReservedCodeCacheSize=100m \
-XX:+UseG1GC \
-XX:+AlwaysPreTouch \
-XX:+UseNUMA \
-XX:+UseCompressedOops \
-XX:-OmitStackTraceInFastThrow \
-XX:+HeapDumpOnOutOfMemoryError"
#-XX:+PrintGCDetails \

export ES_JAVA_OPTS="-Xms1G -Xmx1G -server -XX:+UseG1GC -XX:+UseNUMA -XX:+UseCompressedOops -XX:+AlwaysPreTouch -XX:SurvivorRatio=8 -XX:+AlwaysPreTouch"
export JAVA_DEBUG_OPTS="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,suspend=n,address="
#export JAVA_OPTS="${DEF_JAVA_OPTS} --illegal-access=deny -XX:HeapDumpPath=${VOLUMES_SD}/logs/jvm_error.hprof"
export JAVA_OPTS="${DEF_JAVA_OPTS} -XX:HeapDumpPath=${VOLUMES_SD}/logs/jvm_error.hprof"
export MAVEN_OPTS="${DEF_JAVA_OPTS} -XX:HeapDumpPath=${VOLUMES_SD}/logs/maven_java_error.hprof"
export ANT_ARGS="-nouserlib -lib ${VOLUMES_TOSHIBA_REPOS}/ant/lib"
export ANT_OPTS="-Divy_install_path=${VOLUMES_TOSHIBA_REPOS}/ant/lib -Ddest=${VOLUMES_TOSHIBA_REPOS}/ant -Divy.default.ivy.user.dir=${VOLUMES_TOSHIBA_REPOS}/ivy2"
export SBT_OPTS="-Dsbt.global.base=/Volumes/sd/servers/sbt \
-Dsbt.version=1.0.4 \
-Dsbt.boot.directory=${SBT_HOME}/boot \
-Dsbt.ivy.home=${VOLUMES_TOSHIBA_REPOS}/ivy2 \
-Dsbt.override.build.repos=true \
-Dsbt.repository.config=/Volumes/sd/servers/sbt/repositories"

for HTTP_METHOD in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "${HTTP_METHOD}"="lwp-request -m '${HTTP_METHOD}'"
done
# GET www.baidu.com

########################################### OpenSSL ##################################################
export OPENSSL_INCLUDE_DIR=${HOME}/local/include/openssl/
export OPENSSL_LIB_DIR=${HOME}/local/lib/

# ############################################ PATH #################################################
PATH=${LOCAL}/bin:${LOCAL}/kits:${_LOCAL}/bin:$PATH
PATH=${WGET_HOME}/bin:$PATH
PATH=${SPRINGCLI_HOME}/bin:${VOLUMES_SD_BIN}:${FFMPEG_HOME}/bin:${GNUPG_HOME}/bin:$PATH
PATH=${CMAKE_HOME}/bin:${NASM_HOME}/bin:${YASM_HOME}/bin:${YARN_HOME}/bin:${BISON_HOME}/bin:$PATH
PATH=${CARGO_HOME}/bin:${M2_HOME}/bin:${GRADLE_HOME}/bin:${ANT_HOME}/bin:$PATH
# PATH=${BTRACE_HOME}/bin:${HTOP_HOME}/bin:$PATH
# PATH=$CBC_HOME/bin:$JAVACC_HOME/bin:$GCC_HOME/bin:$PATH
PATH=$MYSQL_BASE_DIR/bin:$MYSQL_BASE_DIR/support-files:$REDIS_HOME/bin:$NGINX:${MYSQL_SHELL}/bin:$PATH
PATH=$KOTLIN_HOME/bin:$PATH
PATH=$HASKELL_BIN/bin:$ZK_HOME/bin:$TOMCAT_HOME/bin:$PATH
PATH=$RUBY_HOME/bin:$GEM_HOME/bin:$PY2_HOME/bin:$PY3_HOME/bin:$LUA_HOME/bin:$PATH
PATH=$GOROOT/bin:$GOPATH/bin:$CHEZ_SCHEME_HOME/bin:$NODE_PATH/bin:$NODE_GLOBAL_PATH/bin:$PATH

PATH=${LOCAL}/jadx/bin:$PATH


export PATH

export DYLD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$DYLD_LIBRARY_PATH

# ########################################## User Alias Commond #####################################
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias pin='ping -c 4 $1'
alias wgetnc='wget --no-check-certificate'
alias zshconfig="sl ~/.zshrc"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias week='date +%V'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias recaf="${JAVA_11_HOME}/bin/java -Dapplication.home=${JAVA_11_HOME} -jar ${JARS}/recaf.jar >/dev/null 2>&1 &"
alias bcv="${JAVA_11_HOME}/bin/java -Dapplication.home=${JAVA_11_HOME} -jar ${JARS}/Bytecode-Viewer.jar >/dev/null 2>&1 &"

MVN_MB="-Dmaven.compiler.fork=true -T6"        # MVN_MULTI_THREADED_BUILDER
# MVN_AS="-Paliyun -Pspring"
# MVN_ASA="-Paliyun -Pspring -Pmaven2 -Papache"
# MVN_ALL="-Paliyun -Pspring -Pmaven2 -Papache -Psonatype -Pxinwang"
MVN_TEMPLATE="mvn clean package -DskipTests ${1} -U "
# ; mvn dependency:sources ${1} -U ; mvn dependency:resolve -Dclassifier=javadoc ${1} -U

alias mvnc="mvn clean"
alias mvnsrc="mvn dependency:sources"
alias mvndocs="mvn dependency:resolve -Dclassifier=javadoc"
alias mvncpst="${MVN_TEMPLATE}"
alias mvncpstc="${MVN_TEMPLATE} -Pmaven2 ; mvn clean"
alias mvna="mvn dependency:sources ; mvn dependency:resolve -Dclassifier=javadoc ; ${MVN_TEMPLATE} -Pmaven2 ; mvn clean"

alias mx="mx --user-home=/Volumes/sd/repos/mx"
alias schemescript='scheme --script'
alias clojure='java -jar ${LOCAL_LIB_DIR}/clojure/clojure.jar'

########################################### RustUp ##################################################
alias rnr="rustup run nightly cargo --color always "
alias rsr="rustup run stable cargo --color always "
alias rbr="rustup run beta cargo --color always "
alias rsu="rustup self update"
alias ru="rustup update"

# source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# OPAM configuration
# . /Volumes/sd/repos/opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source $ZSH/oh-my-zsh.sh
 # source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
 
 # OPAM configuration
. /Volumes/sd/repos/opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
