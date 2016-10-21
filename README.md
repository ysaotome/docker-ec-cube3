Dockerfile for EC-CUBE 3.x with docker-compose
====

## What's this

Development environment for [EC-CUBE 3.x](https://github.com/EC-CUBE/ec-cube).  

* Japanese
    * [Dockerで手軽に！今直ぐ試そう EC-CUBE 3.0 開発版 (Docker+Apache2.4+PHP5.4+PostgreSQL9.2)](http://qiita.com/ysaotome/items/2652be3e90d5c69df0f0) 

* Components
    * [PHP](https://registry.hub.docker.com/_/php/)
        * Apache/2.4.10 (Debian)
        * PHP 7.x
    * [PostgreSQL](https://registry.hub.docker.com/_/postgres/)
        * PostgreSQL 9.4.x


## How to Build Image

* git clone

```zsh
git clone https://github.com/nanasess/docker-ec-cube3.git
```

* docker build

```zsh
docker build --rm \
    -t nanasess/ec-cube3 \
    --build-arg ECCUBE_BRANCHE=master \
    --build-arg ECCUBE_REPOS=https://github.com/EC-CUBE/ec-cube.git \
    docker-ec-cube3/eccube3
```


## Example Usage

```
docker-compose up -d
```

Let's Access in Browser
  * ex)```http://localhost:8080/admin```
  * ID: admin / PW: password


6. Cleanup

```zsh
docker-compose stop
docker-compose rm
```

----
* This software is released under the MIT License, see LICENSE.txt.



