#Global Envs
RCON_PASSWD=$(echo $RANDOM | md5sum | head -c 10)
GSM_CONFIG="./lgsm/config-lgsm/rustserver/common.cfg"

#Pull down GSM
if [ ! -f linuxgsm.sh ]; then
    wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh
    sudo ./linuxgsm.sh rustserver
fi

#Install Rust
sudo ./rustserver auto-install
sudo ./rustserver mods-install <<< $'rustoxide\nyes\n'

#Install plugins
./oxide/setup_plugins.sh

#Update configs
sed -i 's/CHANGE_ME/${RCON_PASSWD}/g' ${GSM_CONFIG}

#install RCON
cargo install rust-rcon 
