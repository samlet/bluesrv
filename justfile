run program +FLAGS='':
    mvn compile exec:java -Dexec.mainClass="com.bluecc.{{program}}" -Dexec.args="{{FLAGS}}"

app program +FLAGS='':
    mvn compile exec:java -Dexec.mainClass="com.bluecc.bluesrv.{{program}}" -Dexec.args="{{FLAGS}}"
