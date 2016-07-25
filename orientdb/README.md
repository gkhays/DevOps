### Docker Container

Pull the latest image from DockerHub.

```bash
$ docker pull orientdb/orientdb
```

In order to persist the OrientDB configuration and data, use a Docker `Data Volume`. Instead of typing all this from the command line, use a docker-compose configuration file instead. Invoke as follows:

```bash
$ docker-compose up -d
```

The `-d` switch puts it in daemon mode, where you may attach to it later.

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
