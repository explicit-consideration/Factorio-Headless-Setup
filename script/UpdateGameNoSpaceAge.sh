#!/bin/bash
echo 'Stop Service'
sudo systemctl stop factorio.service

echo 'Download Update'
sudo -u factorio wget 'https://factorio.com/get-download/stable/headless/linux64' -O /tmp/factorio-headless.tar.xz

echo 'Backup Files'
sudo mkdir /opt/BackupFactorioUpdate
sudo cp -r /opt/factorio/ /opt/BackupFactorio/

echo 'Install Update'
sudo -u factorio tar -xf /tmp/factorio-headless.tar.xz -C /opt/
sudo rm -r /opt/factorio/data/elevated-rails/ /opt/factorio/data/quality/ /opt/factorio/data/space-age/

echo 'Restart'
sudo systemctl daemon-reload
sudo systemctl restart factorio.service