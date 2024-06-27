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

Follow [Running Frigate on Proxmox](https://www.homeautomationguy.io/blog/running-frigate-on-proxmox) to create the docker environment inside a Proxmox LXC container.

#### Video requirement for frigate

Edit /etc/pve/lxc/10x.conf to add the video /dev/dri/renderD128 entry as described

Start the docker container

Inside the docker container, install the following packages (for RADEON GPU card)

apt install mesa-va-drivers vainfo libgl1-mesa-dri

#### docker-compose.yml

```
version: '3.9'

services:

  frigate:
    container_name: frigate
    privileged: true
    restart: unless-stopped
    image: ghcr.io/blakeblackshear/frigate:stable
    shm_size: "128mb" # update for your cameras based on calculation above
    devices:
      - /dev/bus/usb:/dev/bus/usb
      - /dev/dri/renderD128 # for intel hwaccel, needs to be updated for your hardware
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /opt/frigate/config:/config:rw
      - /cctv_clips:/media/frigate
      - type: tmpfs # Optional: 1GB of memory, reduces SSD/SD Card wear
        target: /tmp/cache
        tmpfs:
          size: 1000000000
    ports:
      - "5000:5000"
      - "1935:1935" # RTMP feeds
    environment:
      FRIGATE_RTSP_PASSWORD: "xxxx"
      LIBVA_DRIVER_NAME: "radeonsi"

```

#### Frigate Configuration

Make sure the camera is configured for H264 streams as H265 doesn't work with VAAPI currently
 


