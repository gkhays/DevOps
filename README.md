# DevOps
This is a collection of Scripts and code for various development and operations (DevOps) activities. I've started with a Liquibase diffing script and hope to start adding Jenkins and Maven
 components.

### One-Time Maven Deploy
Normally you would add a `mvn deploy` goal to an automated build, but there may be a need to bootstrap-upload a single Maven artifiact to Nexus.

```bash
mvn deploy:deploy-file -DgroupId=org.gkh.devops \
  -DartifactId=readme-doc -Dversion=0.1 -Dfile=readme.txt \
  -DrepositoryId=nexus -Durl=http://nexus.gkh.org/nexus/content/repositories/snapshots \
  -Dtypes=txt -Dclassifiers=sources
```
