I have been using a workflow wherein we create Liquibase changesets manually. However, this is far from ideal so I have started experimenting with some automation. The first step is to find the difference between the "baseline" database and the latest updates based on changesets. My goal is to start using `generateChangeLog` to automate changesets.

[Liquibase Command Line](http://www.liquibase.org/documentation/command_line.html)
