PHONY: setup

# variables
LOCALSTACK_URL=http://127.0.0.1:4566

setup:
	docker-compose up -d
	export AWS_ACCESS_KEY_ID=test
	export AWS_SECRET_ACCESS_KEY=TEST
	export AWS_DEFAULT_REGION=ap-southeast-1
	# create bucket with receipt
	aws --endpoint-url ${LOCALSTACK_URL} s3api create-bucket --bucket receipts --create-bucket-configuration LocationConstraint=${AWS_DEFAULT_REGION}
	aws --endpoint-url ${LOCALSTACK_URL} s3api put-object --bucket receipts --key somehash --body README.md
	aws --endpoint-url ${LOCALSTACK_URL} s3api list-objects --bucket receipts
	# create payment table
	aws --endpoint-url ${LOCALSTACK_URL} dynamodb create-table \
	--table-name Music \
	--attribute-definitions  AttributeName=PaymentId,AttributeType=S  AttributeName=Description,AttributeType=S \
	--key-schema   AttributeName=PaymentId,KeyType=HASH AttributeName=Description,KeyType=RANGE \
	--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
	--table-class STANDARD
	aws --endpoint-url ${LOCALSTACK_URL} dynamodb list-table


teardown:
	docker-compose down

