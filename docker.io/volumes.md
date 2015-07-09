# volum and linking and backup commands

> create a volum

```bash
docker create -v /var/lib/postgresql/data --name postgres9.4-data busybox
```
> mix reminder
```bash
docker run --name local-postgres -e POSTGRES_PASSWORD=tcuser -d --volumes-from postgres9.4-data -p5432:5432 postgres
docker run --name demo -v /home/docker/data/db:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=tcuser -d postgres
docker run -it --link local-postgres9.3.6:postgres --rm postgres:9.3.6 sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'

```
## links and dokus

https://docs.docker.com/userguide/dockervolumes/

http://ryaneschinger.com/blog/dockerized-postgresql-development-environment/
