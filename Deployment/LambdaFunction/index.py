import os
from datetime import datetime
import yfinance
import yahoo_fin
import boto3
import json
import os

def handler(event, context):
    sns_topic_arn = os.environ['SNS_TOPIC_ARN']
    s3_bucket = os.environ['S3_BUCKET']
    sns_client = boto3.client('sns')
    s3_client = boto3.client('s3')
    
    s3_key = "output.txt"
    message = "Hello from Lambda!"
    
    try:
        response = s3_client.put_object(
            Bucket=s3_bucket,
            Key=s3_key,
            Body=message
        )
        
        response = sns_client.publish(
            TopicArn=sns_topic_arn,
            Message=message,
            Subject="Lambda SNS Test"
        )
        return {
            'statusCode': 200,
            'body': json.dumps(f"Message sent to SNS with response: " {response})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': f"Error: {str(e)}"
        }