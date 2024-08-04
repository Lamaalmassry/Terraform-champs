import boto3
import os
import json

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    dest_bucket = os.environ['DEST_BUCKET']
    

    print("Event: ", json.dumps(event))
    
    try:
        for record in event['Records']:
            source_bucket = record['s3']['bucket']['name']
            key = record['s3']['object']['key']
            
            copy_source = {'Bucket': source_bucket, 'Key': key}
            s3.copy_object(CopySource=copy_source, Bucket=dest_bucket, Key=key)
        
        return {
            'statusCode': 200,
            'body': f'File moved from {source_bucket}/{key} to {dest_bucket}/{key}'
        }
    except KeyError as e:
        print(f"KeyError: {e}")
        return {
            'statusCode': 400,
            'body': f"KeyError: {e}"
        }
