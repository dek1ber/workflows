function __ubuntu_dev__() {
  echo "[*] Starting install of the Ubuntu dev packages"
  apt-get update

  echo "[*] Installing main packages from apt repos"
  sudo apt install -y build-essential pkg-config \
    python3-minimal libboost-all-dev libssl-dev \
    libsqlite3-dev doxygen graphviz python3-pip \
    git tmux libx11-dev libxrandr-dev libxinerama-dev \
    libxft-dev neovim gcc make perl

  echo "[*] Installing pip packages"
  pip3 install jedi pwntools pycryptodome \
    setuptools yara python-socketio pyelftools \
    websockets urllib3 binwalk 

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
