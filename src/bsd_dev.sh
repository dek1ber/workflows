function __bsd_dev__() {
  echo "[*] Starting install of the BSD dev packages"
  pkg install pkgconf python3 boost-libs openssl sqlite3 \
  doxygen graphviz py37-sphinx neovim
}
