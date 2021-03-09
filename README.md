Neovim 配置

## 主要功能
1. 定义跳转 (jedi)
2. 自动补全  (jedi, deaplete)
3. nerd tree
4. tagsbar
5. 错误提示(ale, pip installl flake8)
6. 注释/反注释 （nerdcommenter, <leader>cc/<leader>cu）
7. 共享剪切板
8. 高亮
9. 自动保存


## 安装步骤
1. 下载安装nvim
    1. ./nvim.appimage --appimage-extract
    2. sudo mv squashfs-root / && sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
2. 安装plug.vim (插件管理工具）
    1. mkdir -p ~/.local/share/nvim && cp -r site ~/.local/share/nvim
    2. pip install -r requirements.txt
    3. sudo yum install ctags-5.8-13.el7.x86_64 (安装ctag)
    4. sudo yum install xclip (系统剪切板）
3.  vim .config/nvim/init.vim(编辑环境配置） > 
        mkdir -p ~/.config/nvim && ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
    set clipboard=unnamedplus 
4.  In vim, :plugInstall



---


### Nvim install
    1. curl -x socks5h://127.0.0.1:10807  -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    2. chmod u+x nvim.appimage
    3. ./nvim.appimage --appimage-extract
    4. sudo mv squashfs-root / && sudo ln -s /squashfs-root/AppRun /usr/bin/nvim


### 安装plug.vim (插件管理工具）
    sh -c 'curl -x socks5h://127.0.0.1:10807 -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


### 安装tagsbar
    wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    tar -zxvf ctags-5.8.tar.gz
    cd ctags-5.8
    ./configure --prefix=$PATH # $PATH是你要安装的位置
    make -j
    make install
或者
    下载ctags，加入PATH 或者 `sudo yum install ctags-5.8-13.el7.x86_64`


### 共享服务器的粘贴板
1. 下载XQuartz,并安装(mac 上）
2. 配置远程服务器ssh服务 (centos 7)
    安装 xorg-xauth and xorg-xhost
    ```
    sudo yum install -y xorg-x11-xauth
    sudo yum -y install wqy-zenhei-fonts*
    sudo yum -y install ibus-libpinyin*
    sudo yum install -y xorg-x11-xauth xorg-x11-utils xorg-x11-fonts-*
    ```
    配置 /etc/ssh/sshd_config:
    ```
    AllowTcpForwarding  yes
    X11UseLocalhost  yes
    X11DisplayOffset 10
    X11Forwarding  yes
    ```
3. 在客户端可以用-X来连接服务器,或者将 ForwardX11 yes 加入到ssh配置中
4. 在客户端运行ssh -X test@your_server_ip, 连接后执行xclock,如果看到有一个时钟出来,就说明成功了. 如果没有的话加-vvv进行debug调试看下是哪里出错.
