import psycopg2
import os
from datetime import datetime

def handler(event, context):
    
    try:
        
        
        return {
            'statusCode': 200,
            'body': f'The current time is: {datetime.now()}'
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': f'Error: {str(e)}'
        }
