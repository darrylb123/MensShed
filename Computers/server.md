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

#### Disable subscription warning

Follow these [instructions](https://johnscs.com/remove-proxmox51-subscription-notice/)

``` Shell
sed -Ezi.bak "s/(function\(orig_cmd\) \{)/\1\n\torig_cmd\(\);\n\treturn;/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
```

### Install Home Assistant OS (HAOS) in a Virtual Machine

Use [Installing Home Assistant OS using Proxmox 8](https://community.home-assistant.io/t/installing-home-assistant-os-using-proxmox-8/201835) procedure.
