# Docker Configs
Configs for quick docker installs.

## Wordpress
```
$ cd wordpress
$ ./install.sh -h
Worpress installation using docker compose (wordpress, mysql images)
Usage: ./install.sh [-p <host_listen_port:80> ] | [-h]

# Install wordpress (default port is 80 if not passed in with -p). Creates a 'htdocs' folder in cwd.
$ ./install.sh -p 8080

# Status of containers
$ ./status.sh

# Uninstall and clean up
$ ./uninstall.sh
```


