### Docker Container

Pull the latest image from DockerHub.

```bash
$ docker pull orientdb/orientdb
```

In order to persist the OrientDB configuration and data, use a Docker `Data Volume`. Instead of typing all this from the command line, use a docker-compose configuration file instead. Invoke as follows:

```bash
$ docker-compose up -d
```

The `-d` switch puts it in daemon mode, where you may attach to it later; see http://askubuntu.com/a/507009.

#### Windows

Now get the ID and attach to the docker container.

```bash
$ docker-machine ssh
$ dm ssh
                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/
 _                 _   ____     _            _
| |__   ___   ___ | |_|___ \ __| | ___   ___| | _____ _ __
| '_ \ / _ \ / _ \| __| __) / _` |/ _ \ / __| |/ / _ \ '__|
| |_) | (_) | (_) | |_ / __/ (_| | (_) | (__|   <  __/ |
|_.__/ \___/ \___/ \__|_____\__,_|\___/ \___|_|\_\___|_|
Boot2Docker version 1.10.2, build master : 611be10 - Mon Feb 22 22:47:06 UTC 2016
Docker version 1.10.2, build c3959b1

docker@default:~$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS
                             NAMES
32adfbf6eb62        orientdb/orientdb   "server.sh"         About an hour ago   Up About an hour    0.0.0.0:2424->2424/t
cp, 0.0.0.0:2480->2480/tcp   orientdb
docker@default:~$ docker exec -i -t 32adfbf6eb62 /bin/bash
```

```yaml
# docker-compose up -d

orientdb:
  container_name: orientdb
  image: orientdb/orientdb
  ports:
    - "2424:2424"
    - "2480:2480"
  volumes:
    - ./data/orientdb/config:/orientdb/config
    - ./data/orientdb/databases:/orientdb/databases
  environment:
     ORIENTDB_ROOT_PASSWORD: changeme
```
