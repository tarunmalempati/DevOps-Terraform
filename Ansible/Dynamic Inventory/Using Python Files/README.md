1. First, ensure you have the boto3 library installed:
   pip install boto3

2. Install AWS CLI
3. Then, create a Python script (e.g., ec2_details.py).
4. Ensure the script is executable:
   chmod +x ec2_details.py

5. Edit your ansible.cfg file to use the script as the inventory source:
   [defaults]
   inventory = ./dynamic_inventory.py
   
7. You can now run Ansible commands using the dynamic inventory:
   ansible all -m ping

   or

   if you didnt specify the inventory source in the ansible.cfg file, you can run the below ansible command by including inventory file in the command itself:
   ansible -i ec2_details.py -m ping all
