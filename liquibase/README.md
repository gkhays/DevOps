I have been using a workflow wherein we create Liquibase changesets manually. However, this is far from ideal so I have started experimenting with some automation. The first step is to find the difference between the "baseline" database and the latest updates based on changesets, using the Liquibase [diff](http://www.liquibase.org/documentation/diff.html) tool. My goal is to start using `generateChangeLog` to automate changesets. I found additional `diff` command-line arguments here: [Liquibase Command Line](http://www.liquibase.org/documentation/command_line.html). Use the `diffChangeLog` (vs `diff`) command.

#### Properties

By default the properties file is called `liquibase.properties`. But this can be overriden with the `--defaultsFile` switch, e.g.

```bash
java -jar liquibase.jar update
```
#liquibase.properties
```java
driver: oracle.jdbc.OracleDriver
classpath: jdbcdriver.jar
url: jdbc:oracle:thin:@localhost:1521:oracle
username: scott
password: tiger
```

[Using a liquibase.properties file](http://www.liquibase.org/documentation/command_line.html#using_a_liquibase.properties_file).

### Maven

The article: [Use Liquibase to Safely Evolve Your Database Schema](http://www.baeldung.com/liquibase-refactor-schema-of-java-app) shows how to generate a changeLog with a Maven plugin.

**Plugin Configuration**
```xml
<dependency>
    <groupId>org.liquibase</groupId>
    <artifactId>liquibase-maven-plugin</artifactId>
    <version>3.4.1</version>
</dependency> 
...
<plugins>
    <plugin>
        <groupId>org.liquibase</groupId>
        <artifactId>liquibase-maven-plugin</artifactId>
        <version>3.4.1</version>
        <configuration>                  
            <propertyFile>src/main/resources/liquibase.properties</propertyFile>
        </configuration>                
    </plugin> 
</plugins>
```
**Generate Change Log**<br/>
`mvn liquibase:generateChangeLog`

Properties:
```bash
url=jdbc:mysql://localhost:3306/oauth_reddit
username=tutorialuser
password=tutorialmy5ql
driver=com.mysql.jdbc.Driver
outputChangeLogFile=src/main/resources/liquibase-outputChangeLog.xml
```

### References
[Liquibase: Fed up With Inconsistent Schemas?](https://www.credera.com/blog/technology-insights/java/liquibase-fed-inconsistent-schemas/), by Justin Wilson
