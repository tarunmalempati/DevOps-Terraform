#!/usr/bin/env python3

import argparse
import json
import boto3

def get_ec2_instances():
    ec2 = boto3.client('ec2')
    response = ec2.describe_instances()
    instances = response['Reservations']

    inventory = {
        "_meta": {
            "hostvars": {}
        }
    }

    for reservation in instances:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            private_ip = instance.get('PrivateIpAddress', '')
            public_ip = instance.get('PublicIpAddress', '')
            tags = {tag['Key']: tag['Value'] for tag in instance.get('Tags', [])}

            host_info = {
                "ansible_host": private_ip if private_ip else public_ip
            }

            inventory["_meta"]["hostvars"][instance_id] = host_info

            group = tags.get('Group', 'ungrouped')
            if group not in inventory:
                inventory[group] = {
                    "hosts": []
                }
            inventory[group]["hosts"].append(instance_id)

    return inventory

def list_inventory():
    inventory = get_ec2_instances()
    print(json.dumps(inventory, indent=2))

def host_inventory(host):
    inventory = get_ec2_instances()
    host_vars = inventory["_meta"]["hostvars"].get(host, {})
    print(json.dumps(host_vars, indent=2))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--list', action='store_true')
    parser.add_argument('--host', type=str)

    args = parser.parse_args()

    if args.list:
        list_inventory()
    elif args.host:
        host_inventory(args.host)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
