# macOS libs

Config Development Environment On macOS 

## 工具编译安装

- [基础工具](./build.md#基础工具)
    + [Terminal基础配置](./build.md#terminal基础配置)
    + [SSH免密](./build.md#ssh免密)
- [安装包下载链接](./build.md#安装包下载链接)
    + [配置 & 编译](./build.md#配置--编译)
    + [Python2.7.15 & Python3.7.4 源码构建](./build.md#python2--python3-源码构建)  
      使用 **LibreSSL 2.9.2**  _macOS 自带 LibreSSL 2.6.5(`/usr/bin/openssl version`)_
    + [Python 模块安装](./build.md#python-模块安装)
    + [Nginx](./build.md#nginx)
    + [构建流程备份](./build.md#构建流程备份)
    + [GnuPG](./build.md#gnupg)
- [`Squirrel`(`鼠鬚管`)安装](http://yakirchen.com/2016/11-20-squirrel-build-on-macOS/)
- [Shadowsocks](./build.md#shadowsocks)

- [Useful Shell Fragment](./useful-shell.md)

## 自签名证书生成 & Nginx开启 h2、ssl
[自签名证书生成 & Nginx开启 h2、ssl](nginx自签名证书.md)

## Soft Links

```bash
ln -s /Volumes/To/repos/m2 ${HOME}/.m2 
ln -s /Volumes/To/repos/vscode ${HOME}/.vscode 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/npmrc ${HOME}/.npmrc 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/tm_properties ${HOME}/.tm_properties 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/vim/vimrc ${HOME}/.vimrc 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/yarnrc ${HOME}/.yarnrc 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/zshrc ${HOME}/.zshrc 
```

## Too many open files

```bash
sudo cp "/Users/yakir/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/macOS-limit/limit.maxfiles.plist" /Library/LaunchDaemons/
sudo cp "/Users/yakir/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/macOS-limit/limit.maxproc.plist" /Library/LaunchDaemons/

sudo chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist
sudo chown root:wheel /Library/LaunchDaemons/limit.maxproc.plist

sudo launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist
sudo launchctl load -w /Library/LaunchDaemons/limit.maxproc.plist

```

```bash
sudo vim /etc/sysctl.conf
sudo vim /etc/launchd.conf

sysctl -A | grep kern.max
kern.maxvnodes: 600000
kern.maxproc: 10000
kern.maxfiles: 300000
kern.maxfilesperproc: 300000
kern.maxprocperuid: 7500
kern.maxnbuf: 16384

launchctl limit
	cpu         unlimited      unlimited
	filesize    unlimited      unlimited
	data        unlimited      unlimited
	stack       8388608        67104768
	core        0              unlimited
	rss         unlimited      unlimited
	memlock     unlimited      unlimited
	maxproc     7500           10000
	maxfiles    256            unlimited
```

:grinning:
