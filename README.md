Dockerfile for EC-CUBE 3.x
====

## What's this

Development environment for [EC-CUBE 3.x](https://github.com/EC-CUBE/ec-cube).  

* Japanese
    * [Dockerで手軽に！今直ぐ試そう EC-CUBE 3.0 開発版 (Docker+Apache2.4+PHP5.4+PostgreSQL9.2)](http://qiita.com/ysaotome/items/2652be3e90d5c69df0f0) 

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

### Supported tags and respective Dockerfile links
* [`3.0.0-dev`, `latest` _(3.0.0-dev/Dockerfile)_](https://github.com/ysaotome/docker-ec-cube3/blob/3.0.0-dev/Dockerfile)
* [`3.0.0-beta` _(3.0.0-beta/Dockerfile)_](https://github.com/ysaotome/docker-ec-cube3/blob/3.0.0-beta/Dockerfile)

## How to Build Image

* git clone
    * tag `latest`

        ```zsh
        git clone https://github.com/ysaotome/docker-ec-cube3.git
        ```

    * ex) tag `3.0.0-beta`

        ```zsh
        git clone -b 3.0.0-beta https://github.com/ysaotome/docker-ec-cube3.git
        ```

* docker build
    * tag `latest`

        ```zsh
        docker build --rm \
            -t ysaotome/ec-cube3 \
            docker-ec-cube3/
        ```

    * ex) tag `3.0.0-beta`

        ```zsh
        docker build --rm \
            -t ysaotome/ec-cube3:3.0.0-beta \
            docker-ec-cube3/
        ```

### Prebuild Image

* pulling from docker hub
    * tag `latest`

        ```
        docker pull ysaotome/ec-cube3
        ```

    * ex) tag `3.0.0-beta`

        ```
        docker pull ysaotome/ec-cube3:3.0.0-beta
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



