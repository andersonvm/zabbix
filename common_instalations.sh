#!/usr/bin/env bash

# Atualização do sistema

echo "Atualizando os repositórios e os pacotes do sistema"

apt update && apt upgrade -y

# Instalação do Chrony

echo "Instalando o Chrony"

apt install chrony -y

# Habilita o Chrony para início automático com o sistema

echo "Habilitando o Chrony para início automático com o sistema"

systemctl enable chrony
systemctl start chrony

# Adicionando a lista de servidores NTP

# Nome do arquivo a ser editado
arquivo="/etc/chrony/chrony.conf"

# Comentando a linha que começa com "pool"
sed -i '/^pool/s/^/# /' "$arquivo"

# Adicionando as novas linhas após a linha comentada
sed -i '/^# pool/a \
# servidores publicos do NTP.br com NTS disponível\n\
server a.st1.ntp.br iburst nts\n\
server b.st1.ntp.br iburst nts\n\
server c.st1.ntp.br iburst nts\n\
server d.st1.ntp.br iburst nts\n\
server gps.ntp.br iburst nts' "$arquivo"

echo "Servidores adicionados com sucesso"

# Reiniciar o serviço do Chrony

systemctl restart chrony

# Adicionar o repositório do Zabbix 7.0

cd /tmp

wget https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_7.0-2+debian12_all.deb && dpkg -i zabbix-release_7.0-2+debian12_all.deb

apt update

echo "Repositório adicionado"