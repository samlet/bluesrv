## start
```bash
$ mysql -uroot -proot gmall2020
mysql> source script/gmall2020_12_08.sql
```

* 修改application.properties

```ini
spring.datasource.url=jdbc:mysql://localhost:3306/gmall2020?characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8
spring.datasource.username=root
spring.datasource.password=root
```

* run Gmall2020MockDbApplication
