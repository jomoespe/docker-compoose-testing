Test with docker sample
=======================

A sample about test ejecution with docker.

## Goal

Be able to execute a container that execute tests to other container and chech test result.


## Description

There are two containers:

  - the **application** container have a very simple rest application
  - the **test** container hace a script that call the application URl and check responses to verify the *application* behavour.

The **application** responds to **http://<container ip or name>:8080/hi[?name=a_name]** and responses with a *text/plain* response 
with content **hello <<unknown> | *a_name*>**. Example:

    http://localhost:8080/hi 
    hello <unknown>

    http://localhost:8080/hi?name=test
    hello test

The **test** container send two request to the application. returns 0 (zero) if all test paas, or >0 (greater than zero) if any test fail.


## Requisites:

  - Linux (bash)
  - Docker 1.9.0
  - Docker compose: 1.5.1


## Execution

The test works with a container composition. Four (one more optional) steps:

  - First build de containers composition
  - Second up the composition as daemon. 
  - Then wait to sut (the test container) to finish. This commands returns the container's exit code. 
  - Optionally we can lee the test logs
  - And finally stops the containers (only app container should be still running)

And the commands:

    $ docker-compose -f docker-compose.test.yml build
    $ docker-compose -f docker-compose.test.yml up -d
    $ docker wait sut
    $ docker logs sut
    $ docker-compose -f docker-compose.test.yml stop

This steps could be added to the CI/CD pipelines before publish/push application containers.
