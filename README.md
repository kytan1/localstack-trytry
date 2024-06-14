# localstack-trytry

support for textract only for pro
- alternative: https://mockoon.com/mock-samples/amazonawscom-textract/

## Prerequisites
- Docker:
    - macOS / Linux: https://docs.docker.com/engine/install/
    - Docker Desktop for Windows: https://docs.docker.com/desktop/install/windows-install/
- Make:
    - RHEL/ Centos: yum install make
    - Ubuntu: sudo apt-get install make
    - Windows: https://leangaurav.medium.com/how-to-setup-install-gnu-make-on-windows-324480f1da69
- aws cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- localstack cli (optional): https://docs.localstack.cloud/getting-started/installation/

## How to run
- run `make` to start up localstack on docker container.
    - the `make` will attempt to put a file in s3 and create a dynamoDB table locally and list them once create
- run `make teardown` to shutdown localstack


