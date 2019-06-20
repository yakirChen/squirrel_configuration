#!/usr/bin/env zsh
HIST_STAMPS="yyyy-mm-dd"
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="jtriley"
plugins=(
    ant
    mvn
    # spring
    rust
    cargo
    fd
    rustup
    ripgrep
    golang
    npm
    # docker
    # swift
    # zsh-completions
    # zsh-autosuggestions
    zsh-navigation-tools
    # zsh-history-substring-search
    colorize
    torrent
)

# export PROMPT_COMMAND='echo -n [$(date +%H:%M:%S)]'
# export PS1="\u@\h [\$(date +%H:%M:%S)]> "

# export PS1="\\033[01;36m[cyan]%}%T%{$fg_bold[green]%} %{$fg_bold[white]%}%n%{$fg[magenta]%}@%{$fg_bold[white]%}%m %{$fg_bold[green]%}%d
# %{$fg_bold[yellow]%}%% %{$reset_color%}"

func ssproxy() {
    sslocal -s $1 -p $2 -l 1080 -k $3  -t 300 -m aes-256-cfb
}

# ########################################## User Configuration #####################################
export LOCAL=${HOME}/local
export TO=/Volumes/To
export TO_REPOS=/Volumes/To/repos
export TO_SERVERS=/Volumes/To/servers
export JARS=${LOCAL}/jars

# 语言工具
export RUBY_HOME=${LOCAL}/ruby
export PY2_HOME=${LOCAL}/python2
export PY3_HOME=${LOCAL}/python3
export GOROOT=${LOCAL}/go
export ERL_HOME=${LOCAL}/otp
export NODE_PATH=${LOCAL}/node
export NPM_GLOBAL=${TO_REPOS}/npm
# export RUST_HOME=${LOCAL}/rust
export CARGO_HOME=${LOCAL}/rust
export CARGO_PATH=${CARGO_HOME}/
export RUSTUP_HOME=${LOCAL}/rust
export RUSTFLAGS='-C target-cpu=native'
# export RUSTFLAGS='-C prefer-dynamic'
#export RUSTUP_TOOLCHAIN=stable
export RUSTUP_TOOLCHAIN=nightly
# export MIRI_SYSROOT=${TO_REPOS}/miri
#export RUSTUP_DIST_SERVER=https://static.rust-lang.org
#export RUSTUP_UPDATE_ROOT=https://static.rust-lang.org/rustup
# export RUST_SRC_PATH=$(${CARGO_HOME}/bin/rustc --print sysroot)/lib/rustlib/src/rust/src
# export DYLD_LIBRARY_PATH=$(${CARGO_HOME}/bin/rustc --print sysroot)/lib:$DYLD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
# export DYLD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$DYLD_LIBRARY_PATH
export STACK_HOME=${LOCAL}/stack

export IPFS_PATH=/Volumes/To/repos/ipfs

# export RUST_SRC_PATH=
# export OCAML_HOME=${LOCAL}/ocaml
# export GROOVY_HOME=${LOCAL}/groovy
# export LUA_HOME=${LOCAL}/lua
# export GCC_HOME=${LOCAL}/gcc
#export CLANG_HOME=${TO_REPOS}/clang
# export IGV_HOME=${LOCAL}/igv

# 开发辅助
export VIM_CONFIG_PATH=${HOME}/.vim
export SQLITE=${LOCAL}/sqlite
export MYSQL_BASE_DIR=/Volumes/To/servers/mysql
export MYSQL_DATA_DIR=/Volumes/To/repos/mysql/data
export MYSQL_LOGS_DIR=/Volumes/To/repos/mysql/logs
# export BTRACE_HOME=${LOCAL}/btrace
# export HTOP_HOME=${LOCAL}/htop
# export FISH_HOME=${LOCAL}/fish

# 运行时环境变量
export PKG_CONFIG=${LOCAL}/bin/pkg-config       # pkg-config
export PKG_CONFIG_PATH=/Users/yakir/local/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${LOCAL}/lib/pkgconfig
export CFLAGS="-I${LOCAL}/include -I${LOCAL}/include/openssl" # -I${LOCAL}/include/readline -I${LOCAL}/include/sodium -I${LOCAL}/include/freetype2"
# # -I${LOCAL}/include/lzma -I${LOCAL}/include/freetype2
export CXXFLAGS="--std=c++17 "
export CPPFLAGS=${CFLAGS}
export LDFLAGS="-L${LOCAL}/lib"
export BOOST_ROOT=${TO_REPOS}/boost69
export BOOSTDIR=${BOOST_ROOT}/include
# export OPAMROOT=${TO_REPOS}/opam
# export OCAML_TOPLEVEL_PATH=${TO_REPOS}/ocaml
# export COREUTILS=${LOCAL}/coreutils
export GOPATH=${TO_REPOS}/go/gopath
export GOCACHE=${TO_REPOS}/go/gocache

# 服务
export ZK_HOME=${TO_SERVERS}/zookeeper
# export ZK_HOME=${LOCAL}/zookeeper
# export TOMCAT_HOME=${TO_SERVERS}/tomcat
export REDIS_HOME=${TO_SERVERS}/redis
export NGINX=${LOCAL}/nginx
# export MYSQL_SHELL=${LOCAL}/mysqlsh
export WGET_HOME=${LOCAL}/wget

# 打包编译工具
export CHEZ_SCHEME_HOME=${TO_SERVERS}/chez_scheme
export CMAKE_HOME=${LOCAL}/cmake
export M2_HOME=${LOCAL}/maven0                   # maven
# export M2_HOME=${LOCAL}/maven                   # maven
export MAVEN_CONFIG=${M2_HOME}/conf
export MAVEN_SKIP_RC=true
export ANT_HOME=${LOCAL}/ant                    # ant
export GRADLE_HOME=${LOCAL}/gradle              # gradle
# export JAVACC_HOME=${LOCAL}/javacc
export NASM_HOME=${LOCAL}/nasm
export BISON_HOME=${LOCAL}/bison
# export PROTOBUF_HOME=${LOCAL}/protobuf
#export MX_HOME=${LOCAL}/mx
# export BAZEL_HOME=${LOCAL}/bazel
# export YASM_HOME=${LOCAL}/yasm
export YARN_HOME=${LOCAL}/yarn                # yarn

# repos
export HASKELL_BIN=${TO_REPOS}/haskell
export GRADLE_USER_HOME=${TO_REPOS}/gradle
export GEM_HOME=${TO_REPOS}/gem
export GEM_PATH=${TO_REPOS}/gem

# 日常工具
# export ARIA2_HOME=${LOCAL}/aria2              # aria2
export FFMPEG_HOME=${LOCAL}/ffmpeg
export GNUPG_HOME=${LOCAL}/gnupg

export JABBA_HOME=${LOCAL}/jabba
export JFX_HOME=${TO_SERVERS}/openjfx
export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v 11)
export JAVA_12_HOME=$(/usr/libexec/java_home -v 12)
export JAVA_13_HOME=$(/usr/libexec/java_home -v 13)
# export GRAAL_HOME='/Library/Java/JavaVirtualMachines/graalvm/Contents/Home'
export JDK_8_HOME=${JAVA_8_HOME}
export JDK_11_HOME=${JAVA_11_HOME}
export JDK_12_HOME=${JAVA_12_HOME}
export JDK_13_HOME=${JAVA_13_HOME}
export KOTLIN_HOME=${TO_SERVERS}/kotlinc
export SCALA_HOME=${LOCAL}/scala
export SBT_HOME=${TO_SERVERS}/sbt

alias jdk8="export JAVA_HOME=${JAVA_8_HOME}"
#alias jdk90="export JAVA_HOME=${JDK_19_ZERO_HOME}"
alias jdk11="export JAVA_HOME=${JAVA_11_HOME}"
alias jdk12="export JAVA_HOME=${JAVA_12_HOME}"
alias jdk13="export JAVA_HOME=${JAVA_13_HOME}"
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

# export ES_JAVA_OPTS="-Xms1G -Xmx1G -server -XX:+UseG1GC -XX:+UseNUMA -XX:+UseCompressedOops -XX:+AlwaysPreTouch -XX:SurvivorRatio=8 -XX:+AlwaysPreTouch"
export JAVA_DEBUG_OPTS="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,suspend=n,address="
#export JAVA_OPTS="${DEF_JAVA_OPTS} --illegal-access=deny -XX:HeapDumpPath=${TO_REPOS}/logs/jvm_error.hprof"
export JAVA_OPTS="${DEF_JAVA_OPTS} -XX:HeapDumpPath=${TO_REPOS}/logs/jvm_error.hprof"
#export MAVEN_OPTS="${DEF_JAVA_OPTS} -XX:HeapDumpPath=${TO_REPOS}/logs/maven_java_error.hprof"
export ANT_ARGS="-nouserlib -lib ${TO_REPOS}/ant/lib"
export ANT_OPTS="-Djava.io.tmpdir=/Volumes/To/repos/javaiotmp -Divy_install_path=${TO_REPOS}/ant/lib -Ddest=${TO_REPOS}/ant -Divy.default.ivy.user.dir=${TO_REPOS}/ant"
export SBT_OPTS="-Dsbt.global.base=${TO_SERVERS}/sbt \
-Dsbt.version=1.0.4 \
-Dsbt.boot.directory=${TO_REPOS}/sbt/boot \
-Dsbt.ivy.home=${TO_REPOS}/ivy2 \
-Dsbt.override.build.repos=true \
-Dsbt.repository.config=${TO_REPOS}/sbt/repositories"

# for HTTP_METHOD in GET HEAD POST PUT DELETE TRACE OPTIONS; do
#     alias "${HTTP_METHOD}"="lwp-request -m '${HTTP_METHOD}'"
# done
# GET www.baidu.com

########################################### OpenSSL ##################################################
export OPENSSL_CFLAGS=${HOME}/local/include/openssl/        # openssl
# export OPENSSL_LIBS=${HOME}/local/lib/                    # openssl lib 貌似要所有的动态链接库都列出来
export OPENSSL_INCLUDE_DIR=${HOME}/local/include/openssl/
export DEP_OPENSSL_INCLUDE=${HOME}/local/include/openssl/
export OPENSSL_LIB_DIR=${HOME}/local/lib/
export OPENSSL_ROOT_DIR=${OPENSSL_INCLUDE_DIR}

SILVER=(status:black:white dir:blue:black git:green:black cmdtime:magenta:black)
export SILVER_SHELL=$0

# ############################################ PATH #################################################
PATH=${LOCAL}/bin:${LOCAL}/kits:$PATH
PATH=${JABBA_HOME}/bin:$PATH
PATH=${WGET_HOME}/bin:$PATH
PATH=${GNUPG_HOME}/bin:$PATH
PATH=${CMAKE_HOME}/bin:$PATH
PATH=${CARGO_HOME}/bin:${M2_HOME}/bin:${GRADLE_HOME}/bin:${ANT_HOME}/bin:$PATH
PATH=${ERL_HOME}/bin:$PATH
PATH=${SQLITE}/bin:$MYSQL_BASE_DIR/bin:$MYSQL_BASE_DIR/support-files:${MYSQL_SHELL}/bin:$PATH
PATH=$KOTLIN_HOME/bin:$PATH
PATH=$PY2_HOME/bin:$PY3_HOME/bin:$LUA_HOME/bin:$PATH
PATH=$GOROOT/bin:$GOPATH/bin:$CHEZ_SCHEME_HOME/bin:$NODE_PATH/bin:$NPM_GLOBAL/bin:$PATH
PATH=$REDIS_HOME/bin:$NGINX:$PATH
PATH=$RUBY_HOME/bin:$GEM_HOME/bin:$PATH
PATH=${YARN_HOME}/bin:$PATH
PATH=${STACK_HOME}:$PATH

# PATH=$HASKELL_BIN/bin:$ZK_HOME/bin:$TOMCAT_HOME/bin:$PATH
# PATH=${BTRACE_HOME}/bin:${HTOP_HOME}/bin:$PATH
# PATH=$CBC_HOME/bin:$JAVACC_HOME/bin:$GCC_HOME/bin:$PATH
# PATH${SPRINGCLI_HOME}/bin:${FFMPEG_HOME}/bin:$PATH
PATH=${NASM_HOME}:${YASM_HOME}/bin:${BISON_HOME}/bin:$PATH
# PATH=${LOCAL}/jadx/bin:$PATH

export PATH

# ########################################## User Alias Commond #####################################
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias pin='ping -c 6 $1'
alias wgetnc='wget --no-check-certificate'
alias zshconfig="sl ~/.zshrc"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias week='date +%V'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias recaf="${JAVA_11_HOME}/bin/java -Dapplication.home=${JAVA_11_HOME} -jar ${JARS}/recaf.jar >/dev/null 2>&1 &"
alias bcv="${JAVA_11_HOME}/bin/java -Dapplication.home=${JAVA_11_HOME} -jar ${JARS}/Bytecode-Viewer.jar >/dev/null 2>&1 &"
alias gitrb="git reset && git checkout -- . && git checkout origin/master &&  git branch -D master && git status && git checkout master && git status"
alias pg="ps aux|grep $1"
alias jpg="jps -lv|grep $1"

MVN_MB="-Dmaven.compiler.fork=true -T12"        # MVN_MULTI_THREADED_BUILDER
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
alias mvna="mvn dependency:sources -P163 -Pmaven2 ; mvn dependency:resolve -Dclassifier=javadoc -P163 -Pmaven2 ; ${MVN_TEMPLATE} -Pmaven2 -P163 ; mvn clean"
alias mvna24="mvn -T24 dependency:sources -Papache; mvn -T24 dependency:resolve -Dclassifier=javadoc -Papache; ${MVN_TEMPLATE} -T24 -Pmaven2 ; mvn clean -Papache"
alias mvnversion="mvn versions:display-plugin-updates -Pspring -Papache ; mvn -T24 versions:display-property-updates -Pspring -Papache"

alias mvnaxw="mvn dependency:sources -Pxinwang; mvn dependency:resolve -Dclassifier=javadoc -Pxinwang; ${MVN_TEMPLATE} -Pmaven2"
alias mvna24xw="mvn -T24 dependency:sources -Pxinwang; mvn -T24 dependency:resolve -Dclassifier=javadoc -Pxinwang; ${MVN_TEMPLATE} -T24 -Pmaven2 "
alias mvnversionxw="mvn -T24 versions:display-plugin-updates -Pspring -Papache -Pxinwang; mvn -T24 versions:display-property-updates -Pspring -Papache -Pxinwang"

alias mx="mx --user-home=${TO_REPOS}/mx"
alias schemescript='scheme --script'
alias clojure='java -jar ${LOCAL_LIB_DIR}/clojure/clojure.jar'

alias hgi='source /Volumes/To/repos/venv/hg/bin/activate'
alias hgd='deactivate'

########################################### rustup ##################################################
alias rnr="rustup run nightly cargo --color always "
alias rsr="rustup run stable cargo --color always "
alias rbr="rustup run beta cargo --color always "
alias rsu="rustup self update"
alias ru="rustup update"

############################################ alias ##################################################
#alias rm="rm -v "
alias gcr="git clone --recurse-submodules "
alias gcr1="git clone --recurse-submodules --depth 1 "
alias antlr4='java -Xmx500M -cp "/Volumes/To/app/antlr-4.7.2-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/Volumes/To/app/antlr-4.7.2-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

source $ZSH/oh-my-zsh.sh
 # source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
 
 # OPAM configuration
# . ${TO_REPOS}/opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# fpath=( "$HOME/.zfunctions" $fpath )
# autoload -U promptinit; promptinit

# # optionally define some options
# PURE_CMD_MAX_EXEC_TIME=10

# prompt pure


# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

#[ -s "/Users/yakir/local/jabba/jabba.sh" ] && source "/Users/yakir/local/jabba/jabba.sh"
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
