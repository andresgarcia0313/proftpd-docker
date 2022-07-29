echo $(echo $(cat passwordroot.txt)) | sudo -S -u root sudo apt install iproute2 -y
echo PROFTPD_IP=$(ip -j route get 8.8.8.8 | jq -r '.[0].prefsrc') > .env
echo "Configurado Con:"
cat .env