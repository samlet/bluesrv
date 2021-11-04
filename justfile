run program +FLAGS='':
    mvn compile exec:java -Dexec.mainClass="com.bluecc.{{program}}" -Dexec.args="{{FLAGS}}"

app program +FLAGS='':
    mvn compile exec:java -Dexec.mainClass="com.bluecc.bluesrv.{{program}}" -Dexec.args="{{FLAGS}}"

bot:
	mvn spring-boot:run -Dstart-class=com.bluecc.bluesrv.bot.BotApp

workflows:
    ls -alh /opt/asset/workflow/blues
rabbit-admin:
    open http://localhost:15672/#/exchanges
import-db:
    mysql -uroot -proot order_proto < ./maintain/init_sql/ofbiz.sql

gendb:
    just run gen.SchemaGen --module ofbiz -w
    just import-db
    just run gen.ProtoGen
