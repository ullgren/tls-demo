# TLS Demo

This repositoy contains various files to setup a environment for testing and debuging TLS and mutual TLS scenarios.

It is primarly expected to be used on a Linux host environment running containers using a [Compose Spec](https://compose-spec.io/) compliant implementation.

I use [Podman](https://podman.io/) and [Podman Compose](https://github.com/containers/podman-compose).


## Requiremments

An implementation of the [Compose Spec](https://compose-spec.io/) such as [Podman Compose](https://github.com/containers/podman-compose) or [Docker compose}(https://docs.docker.com/compose/).

To be able to use DNS names to call the various hosts you have to add the following to your `/etc/hosts`

```
127.0.1.2       test.local pki.snakeoil.local
```


## Starting the servers

To start the servers use podman-compose (or any other [Compose Spec](https://compose-spec.io/) compliant implementation).

```
cd server
podman-compose up
```

This will start four nginx instances

<dl>
    <dt>cawebserver</dt>
        <dd>Listens on 8080 for http requests. This is used to serve CRL and CRT files for the fictional Snake Oil Ltd. Certificate Authority.</dd>
    <dt>validatingwebserver</dt>
        <dd>Listens on port 1443 for https requests. This is the test.local server setup to require mutual TLS with a complete certificate chain and anouncing availbale client CAs.</dd>
    <dt>optinalnocawebserver</dt>
        <dd>Listens on port 2443 for https requests. This is the test.local server setup for optional mutial TLS with a complete certicate chain but sending an empty availbale client CA list.</dd>
    <dt>brokenwebserver</dt>
        <dd>Listens on port 3443 for https requests. This is the test.local server setup with our a complete certificate chain, only announcing the servers certificate.</dd>
</dl>