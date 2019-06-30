# simple-sbt-project
Scala sbt kickstarter project kit. This project can also be refered for the following:
1. Simple sbt project structuring
2. Adding simple logs to a sbt project
3. Reading `jvm` parameters
4. Reading `application.conf`
5. Building a sbt project

## Dev
```
$ cd simple-sbt-project
$ sbt
$ sbt> universal:stage
$ cd target/universal/stage
$ bin/start.sh
```

## Deploy
```
$ cd simple-sbt-project
$ sbt
$ sbt> universal:packageBin
$ cd target/universal
$ unzip simple-sbt-project-0.1.zip
$ cd simple-sbt-project-0.1
cd bin/start.sh
```
