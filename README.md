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
    2. 安装ctag: sudo yum install ctags-5.8-13.el7.x86_64
    3. pip install -r requirements.txt
3.  vim .config/nvim/init.vim(编辑环境配置） > 
        mkdir -p ~/.config/nvim && ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
4. sudo yum install  xclip (系统剪切板）
    set clipboard=unnamedplus 
5.  plugInstall



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

