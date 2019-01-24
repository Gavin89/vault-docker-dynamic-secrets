# vault-docker-dynamic-secrets
POC showing how dynamic secrets work using vault

Maintainers
-----------

Gavin Hardy

Getting Started
---------------------

```sh
$ git clone git@github.com:Gavin89/vault-docker-dynamic-secrets.git
$ cd vault-docker-dynamic-secrets
$ docker-compose up -d
```

Note
---------------------

`vault-client` will populate the vault server with the required policies/role in order for this demo to work, this will take around 40 seconds to complete.

`php` container will execute `run.sh` to request temporary credentials from vault, to use for the mysql database. This will have a time to live of '1m' (this can be changed in the `default_ttl="1m"` on docker-compose).

Once the php container has finished, you can go to `localhost:8080` on your host, and you should see a successful connection to the database. If you wait 60seconds, and refresh, you should see that it has revoked you user access.

References
---------------------

This project used content from the following github repository

https://github.com/neumayer/mysql-docker-compose-examples/tree/master/vault-mysql
