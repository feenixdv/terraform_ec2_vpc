# lambda_function.py
def lambda_handler(event, context):
    print("This is a sample Lambda function.")
    print("Environment:", event.get('ENVIRONMENT'))
