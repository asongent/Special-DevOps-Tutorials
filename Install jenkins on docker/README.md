## This Tutorial Installation Guide of Jenkins On Docker Container 


#### 1), Pull jenkins image from docker registry by running the following command

```bash
docker pull jenkins/jenkins:lts
```

#### 2), After pulling jenkins images, type the following command to verify that the image was successfully pulled
```bash
docker images
```
or

```bash
docker image ls
```  


#### 3), Create a container with the jenkins image you just pulled. This will create jenkins server for you. Run the following command to create docker container.

```bash
docker run -d --name (YourPreferedName) -p3000:8080 jenkins/jenkins:lts
```
Explanation of the above command.
  - `run`, starts a new container for you
  - `-d`, runs the container in detached mode
  - `--name` enables you to specify the name (example, Jenkins-Serever) of the container/jenkins server that you want to create. 
  - ` -p` is publish or port 
  - `300` is my prefered port number. You can choose a port number of your choice say, 7000, 9000 5000, 6000 or any if not in used already. 
  - `8080` is jenkins default port number. 
  - `jenkins/jenkins:lts` is the jenkins images we just pulled from docker registry
  - `lts` is the short form of `latest` jenkins images in the docker registry.

#### 4), Start your jenkins server on any browser. Type:
`localhost:3000` This will open jenkins server for you. 

You should be asked to enter Administrator password. TO get Administrator password, type

```bash
 docker logs <container's name>
```
You should see something like this

```bash
*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

73c38352b5f747a18f309f83beb53f84

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************
```

Here, the Admin password is `73c38352b5f747a18f309f83beb53f84`. Keep in mind that your own password will br different.

or

 ```bash
 docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
 ```
This will deplay Administrator password. You will copy and paste to gain initial access to your jenkins server.

- Create admin/root account and then click on "sujected plugins" to install plugins. 

#Start bulding your projects and pipelines 