# Appendix

## Run This Demo Yourself (no Gitpod)

### Choosing your Docker host environment

- This demo (currently) runs 16 different Docker containers, so this might be too much for your laptop.
- Testing has been done on a c4.4xlarge EC2 instance, with good performance (probably over-provisioned).
- It's recommended to run ```docker system  prune -a``` before running ```docker-compose```

### Configuring the demo environment

- Running a really big pcap [optional]
  - The packet capture file included in this repository features DNS exfiltration (among other things), but will repeat itself after a few minutes.  This can be tiresome during a live demo or workshop.
  - Run ```python3 scripts/get_pcap.py``` script to download a 1GB/1hr playback pcap.
 

- Configure Control Center's ksqlDB advertised listener
  - You need to advertise the correct hostname for the ksqlDB server to ensure that the ksqlDB editor in Confluent Control Center can communicate with the ksqlDB server. 
  - In the `docker-compose.yml` file, change the value of  `CONTROL_CENTER_KSQL_KSQLDB1_ADVERTISED_URL` to `http://localhost:8088` if running locally, or to whatever the public DNS hostname is for your EC2 instance.
  
### Starting the demo
- Run ```docker-compose up -d```

If you are using sudo with docker-compose then you will likely need to use the -E option to sudo so it inherits your environmental variables so the last command will become ```sudo -E docker-compose up -d```
