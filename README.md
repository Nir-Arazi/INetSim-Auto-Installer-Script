# INetSim Auto Installer Script

This script installs and configures INetSim for quick malware analysis lab setup. It includes:

- Automatic installation of INetSim & cpanminus
- Downgrades `Net::DNS` to avoid known INetSim issues
- Edits config to bind on 0.0.0.0
- Restarts the service and verifies it's listening

## Usage
```bash
wget https://raw.githubusercontent.com/yourusername/inetsim-installer/main/inetsim_installer.sh
chmod +x inetsim_installer.sh
sudo ./inetsim_installer.sh
