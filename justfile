run program +FLAGS='':
    mvn compile exec:java -Dexec.mainClass="com.bluecc.{{program}}" -Dexec.args="{{FLAGS}}"

app program +FLAGS='':
    mvn compile exec:java -Dexec.mainClass="com.bluecc.bluesrv.{{program}}" -Dexec.args="{{FLAGS}}"

bot:
	mvn spring-boot:run -Dstart-class=com.bluecc.bluesrv.bot.BotApp

workflows:
    ls -alh /opt/asset/workflow/blues
