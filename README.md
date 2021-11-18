# Build db
Go to database folder and type command from below:

```sh
docker build -t nts/db .
```

# Build app

Go to server folder and type command from below:

```sh
docker build -t nts/uk .
```

# Run db & app in compose

```sh
docker compose up
```

# Run db or app with standalone mode
DB

```sh
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Kinjirou@#123' -p 1433:1433 --name nts-db  --restart always -d nts/db
```

App

```sh
docker run -d --name nts-uk -p 8080:8080 -p 9990:9990 -it nts/uk /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
```


## Tự bạch.

Đây là cấu hình để chạy một dự án của công ty cũ, do công ty không yêu cầu. Mình tự cấu hình để chạy dự án trong docker. Mục đích để phục vụ CICD và demo cách thức update hệ thống khi công ty cần.

Hiện tại, mình đã rời công ty, mã nguồn của dự án mình cũng không giữ lại. Cấu hình này mình đẩy lên để mọi người tìm hiểu.

## Cấu trúc thư mục

- app
    - Dockerfile: File cấu hình build docker image.
    - wildfly.tgz: File nén chứa wildfly server phiên bản 10.1.0 đã có đủ cấu hình.
    - deployments.tgz: File nén chứa các tập tin war.
- dba
    - Dockerfile: File cấu hinhhf build docker image.
    - entry-point.sh: File cấu hình cách thức container tự khởi động.
    - restore-db.sh: File cấu hình restore file BAK vào SQL server.
    - UK4_KDW013.BAK: File backup của db
- docker-compose.yml: File cấu hình compose của dự án.

README.md

## Các thành phần bị thiếu.

### deployments.tgz

Đây là file nén chứa các tập tin war, khi thực hiện build docker image, file nén sẽ được tự bung và image.

### UK4_KDW013.BAK

Đây là file db của project, khi build image, file db sẽ được đóng gói vào image và restore rồi tự xoá (nhằm tiết kiệm dung lượng file image).

### wildfly.tgz

Đây là file nén chứa chương trình thực thi của wildfly server.
