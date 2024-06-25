PHONY: setup

# variables
LOCALSTACK_URL=http://127.0.0.1:4566

.EXPORT_ALL_VARIABLES:
AWS_ACCESS_KEY_ID=test
AWS_SECRET_ACCESS_KEY=TEST
AWS_DEFAULT_REGION=ap-southeast-1

setup:
	docker-compose up -d
	# create bucket with receipt
	aws --endpoint-url ${LOCALSTACK_URL} s3api create-bucket --bucket receipts --create-bucket-configuration LocationConstraint=${AWS_DEFAULT_REGION}
	aws --endpoint-url ${LOCALSTACK_URL} s3api put-object --bucket receipts --key somehash --body README.md
	aws --endpoint-url ${LOCALSTACK_URL} s3api list-objects --bucket receipts
	# create payment table
	# aws --endpoint-url ${LOCALSTACK_URL} dynamodb create-table \
	# --table-name Payment \
	# --attribute-definitions  AttributeName=PaymentId,AttributeType=S  AttributeName=Description,AttributeType=S \
	# --key-schema   AttributeName=PaymentId,KeyType=HASH AttributeName=Description,KeyType=RANGE \
	# --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
	# --table-class STANDARD
	# aws --endpoint-url ${LOCALSTACK_URL} dynamodb list-tables


teardown:
	docker-compose down

fake-submit:
	aws --endpoint-url ${LOCALSTACK_URL} dynamodb put-item --table-name payment \
	--item '{"PaymentId": {"S": "3"}, "Description": {"S": "some_desc"}}'

