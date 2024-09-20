import os

def lambda_handler(event, context):
    dir_name = event.get('directory_name', 'default-dir')
    efs_mount = '/mnt/efs'
    dir_path = os.path.join(efs_mount, dir_name)
    try:
        os.makedirs(dir_path, exist_ok=True)
        return {
            'statusCode': 200,
            'body': f'Directory {dir_name} created successfully'
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': f'Error: {str(e)}'
        }
