import boto3

client = boto3.client('sagemaker-runtime')

endpoint_name = "mia-mytask-endpoint"                                       # Your endpoint name.
content_type = "application/jsonlines"                                        # The MIME type of the input data in the request body.
accept = "text/json"                                              # The desired MIME type of the inference in the response.
#payload = '{"source":"帮 我 尽快 发货 ， 家里 没有 了"}'                                         # Payload for inference.
payload = '{"source":"能不能 快点 发货"}'                                         # Payload for inference.

 
response = client.invoke_endpoint(
    EndpointName=endpoint_name, 
    ContentType=content_type,
    Accept=accept,
    Body=payload
    )

print(response)
print(response['Body'].read())
