# Proxmox server configuration

## Dell R620 Hardware

Dual redundant power supplies

### Disks

Installed 8 1.2TB SAS 10000RPM disks configured as RAID6, ie redundant checksum disks.

### Network

Ports 3 and 4 connected to network.

## Proxmox Installation

1. Download the Proxmox ISO and write to a USB thumb drive.
2. Remove top of server and locate the USB port in front of the power supplies. This is th eonly USB port that can boot the server.
3. Boot Proxmox installation
4. Use graphical install
5. Choose BTRFS RAID0 (Technology preview)
6. Install as prompted

### Test Proxmox

Browse to IP address:



### Install Home Assistant OS (HAOS) in a Virtual Machine

Use [Installing Home Assistant OS using Proxmox 8](https://community.home-assistant.io/t/installing-home-assistant-os-using-proxmox-8/201835) procedure.

The first script configures the server to a no-subscription status

```
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"
```

Install the Home Assistant VM

```
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/vm/haos-vm.sh)"
```

### Install Frigate

