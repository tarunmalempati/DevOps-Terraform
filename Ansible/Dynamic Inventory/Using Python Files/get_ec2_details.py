import boto3

def get_ec2_instances():
    ec2 = boto3.client('ec2')
    response = ec2.describe_instances()
    instances = response['Reservations']

    instance_details = []

    for reservation in instances:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            instance_type = instance['InstanceType']
            private_ip = instance.get('PrivateIpAddress', 'N/A')
            public_ip = instance.get('PublicIpAddress', 'N/A')
            state = instance['State']['Name']
            tags = {tag['Key']: tag['Value'] for tag in instance.get('Tags', [])}

            instance_info = {
                "Instance ID": instance_id,
                "Instance Type": instance_type,
                "Private IP": private_ip,
                "Public IP": public_ip,
                "State": state,
                "Tags": tags
            }

            instance_details.append(instance_info)

    return instance_details

def print_instance_details():
    instances = get_ec2_instances()
    for instance in instances:
        print(f"Instance ID: {instance['Instance ID']}")
        print(f"Instance Type: {instance['Instance Type']}")
        print(f"Private IP: {instance['Private IP']}")
        print(f"Public IP: {instance['Public IP']}")
        print(f"State: {instance['State']}")
        print(f"Tags: {instance['Tags']}")
        print("-" * 40)

if __name__ == "__main__":
    print_instance_details()
