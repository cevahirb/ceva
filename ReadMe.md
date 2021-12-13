Python Apllication Deploy with Ansible, Terraform on Jenkins

Login My Jenkins http://34.242.145.52:8080/
Run task deployServers on Jenkins
After deploy finished, You can test http://99.81.85.177:32700 with any browser
Features
You can view codes on my repo : https://github.com/cevahirb/ceva

Terraform
I created the servers with Terraform. Here I used the module structure. I created two ec2s, one master and one worker on aws

Ansible
I installed kubernetes for master and worker with Ansible. Then I made the necessary deployment and service(NodePort) setups for the python application that I sent to dockerhub.

Build Python Application
You can see the necessary installations for the Python application in the Dockerfile.