# Passos para provisionamento e instalação do Zabbix em 3 camadas (Zabbix Server - Zabbix Database - Zabbix Frontend)

## Primeiro passo

Provisionar um servidor que irá servir como template para os 3 utilizados

## Atualizar os repositórios e o sistema

apt update && apt upgrade -y

## Segundo passo - Instalação das feramentas e repositórios comuns

Antes de qualquer operação, devemos instalar um servidor NTP no servidor para que ele sempre esteja atualizado com o horário correto. Isso se deve ao fato do mesmo registrar as ocorrências em tempo real.

Todas as operações devem ser realizadas com o usuário root

### Instalação do VIM para manipulação dos arquivos de configuração

apt install vim -y

### Instalação do chrony

apt install chrony -y

### Configuração dos servidores de tempo

vim /etc/chrony/chrony.conf

### Adicionar os servidores ao arquivo de configuração

\# servidores publicos do NTP.br com NTS disponível

server a.st1.ntp.br iburst nts

server b.st1.ntp.br iburst nts

server c.st1.ntp.br iburst nts

server d.st1.ntp.br iburst nts

server gps.ntp.br iburst nts

### Reiniciar o serviço chrony

systemctl restart chrony

### Mudar para a pasta /tmp para realizar operações

cd /tmp

### Adicionar o repositório do Zabbix

wget https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_7.0-2+debian12_all.deb

dpkg -i zabbix-release_7.0-2+debian12_all.deb

### Atualizar os repositórios

apt update