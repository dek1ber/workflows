function __fedora_dev__() {
  echo "[*] Starting install of the Fedora dev packages"
  dnf update -y

  echo "[*] Installing main packages from dnf repos"
  dnf install gcc-c++ pkgconf-pkg-config python3 \
    boost-devel openssl-devel sqlite-devel doxygen \
    graphviz python3-pip libX11-devel libXinerama-devel \
    libXft-devel libXrandr-devel libpcap-devel \
    systemd-devel cargo rustc rubygems rubypick \
    tmux lua luarocks picom xrandr xsetroot libstdc++-static

  echo "[*] Specific pip packages"
  pip3 install --user sphinx sphinxcontrib-doxylink

  echo "[*] Bringing down github config files"
  git clone https://github.com/dek1ber/dots.git
  mkdir -p /home/$1/.config
  mv dots/.config/* /home/$1/.config/
  mv dots/.tmux.conf /home/$1/.tmux.conf
  mv dots/.zshrc /home/$1/.zshrc
  mv dots/.scripts/ /home/$1/.scripts/
  mv dots/.xinitrc /home/$1/.xinitrc
  cd /home/$1/.config 
  git clone https://github.com/dek1ber/st.git
  cd st 
  make clean install
}
