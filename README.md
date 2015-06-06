Dockerfile for EC-CUBE 3.x
====

## What's this

Development environment for [EC-CUBE 3.x](https://github.com/EC-CUBE/ec-cube).

* Components
    * [PHP](https://registry.hub.docker.com/_/php/)
        * Apache/2.4.10 (Debian)
        * PHP 5.4.41
    * [PostgreSQL](https://registry.hub.docker.com/_/postgres/)
        * PostgreSQL 9.2.11

### :bangbang: ATTENTION :bangbang:
This is always build the latest version.
Does not meet the [recommended system requirements](https://github.com/EC-CUBE/ec-cube#verβの確認環境不具合).
Before build, please check the repository of EC-CUBE 3.x.

## How to Build Image

* git clone

    ```zsh
    git clone https://github.com/ysaotome/docker-ec-cube3.git
    ```

* docker build

    ```zsh
    docker build --rm -t ysaotome/ec-cube3 docker-ec-cube3
    ```

### Prebuild Image

* pulling from docker hub

    ```
    docker pull ysaotome/ec-cube3
    ```

## Example Usage

1. RUN PostgreSQL Container

    ```zsh
    docker run -d \
        --name cube3dev-postgres \
        -e POSTGRES_USER=cube3_dev_user \
        -e POSTGRES_PASSWORD=password \
        -e POSTGRES_DB=cube3_dev \
        postgres:9.2.11
    ```

2. RUN EC-CUBE 3.x in Apache & PHP Container

    ```zsh
    docker run -d \
        --name cube3dev \
        --link cube3dev-postgres:postgres \
        -p 8080:80 \
         ysaotome/ec-cube3
    ```

3. Check start container

    ```zsh
    docker logs -f cube3dev
    .
    .
    .
    Finished Successful!
    ```

4. Let's Access in Browser
    * ex)```http://localhost:8080/admin```
    * ID: admin / PW: password

5. Enter Container (Development)

    ```zsh
    docker exec -it cube3dev bash
    ```

6. Cleanup

    ```zsh
    docker stop cube3dev cube3dev-postgres && \
    docker rm cube3dev cube3dev-postgres
    ```


----
* This software is released under the MIT License, see LICENSE.txt.


