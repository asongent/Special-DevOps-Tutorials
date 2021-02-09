#Prepare your Ec2 instance.
	
#Log into your instance and  do a:
sudo yum update -y

#Add the Jenkins repo using the following command:
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

#Import a key file from Jenkins-CI to enable installation from the package:
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

#Install Jenkins:
sudo yum install jenkins -y

#Start Jenkins as a service:
sudo service jenkins start

#Sometimes after launching a "sudo service jenkins start", you will see an ERROR that looks like the description below: 
Starting jenkins (via systemctl): Job for jenkins.service failed because the control process exited wit
h error code. See "systemctl status jenkins.service" and "journalctl -xe" for details.
                                        [FAILED]

#If it FAILS, launch the following command to install java:
sudo yum install java-1.8.0 -y  

#Enter the command below to restart Jenkins as a service:
sudo service jenkins start

you should see something like this: "Starting jenkins (via systemctl):  [  OK  ]"

   
                  #Jenkins Is Now Running!!!

#Open your prefered browser and enter your Public DN:
 http://<your_server_public_DNS>:8080 

#An "Unlock jenkins" screen will pop up asking you to put an Administrative password. To get the password, do a:

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

#The Jenkins installation script directs you to the Customize Jenkins page:
Click Install "suggested plugins"

#Once the installation is complete, enter Administrator Credentials, click
Save Credentials, and then click Start Using Jenkins

               |-------------[GOODLUCK]----------------------|

