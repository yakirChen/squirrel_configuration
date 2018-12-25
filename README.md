# macOS libs

Config Development Environment On macOS 

- [基础工具](./build.md#基础工具)
    + [Terminal基础配置](./build.md#terminal基础配置)
    + [SSH免密](./build.md#ssh免密)
- [安装包下载链接](./build.md#安装包下载链接)
    + [配置 & 编译](./build.md#配置--编译)
    + [Python2.7.15 & Python3.7.2 源码构建](./build.md#python2--python3-源码构建) 使用 **LibreSSL 2.8.3**  
      macOS 自带 **LibreSSL 2.6.5(`/usr/bin/openssl version`)**
    + [Python 模块安装](./build.md#python-模块安装)
    + [Nginx](./build.md#nginx)
    + [构建流程备份](./build.md#构建流程备份)
    + [GnuPG](./build.md#gnupg)
- [`Squirrel`(`鼠鬚管`)安装](http://yakirchen.com/2016/11-20-squirrel-build-on-macOS/)
- [Shadowsocks](./build.md#shadowsocks)

- [Useful Shell Fragment](./useful-shell.md)

:grinning:


## soft links

```bash
ln -s /Volumes/To/repos/m2 ${HOME}.m2 
ln -s /Volumes/To/repos/vscode ${HOME}.vscode 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/npmrc ${HOME}.npmrc 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/tm_properties ${HOME}.tm_properties 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/vim/vimrc ${HOME}.vimrc 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/yarnrc ${HOME}.yarnrc 
ln -s ${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Developer/macOS-libs/zshrc ${HOME}.zshrc 
```