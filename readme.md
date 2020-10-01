
How does CircleCI works?
example file:
version: 2.1

orbs:
#define a testing environment.
python: circleci/python@0.2.1

#jobs to run for integration
jobs:
build-and-test:
executor: python/default
working_directory: ~/project/backend/
steps: - checkout:
path: ~/project - python/load-cache - python/install-deps - python/save-cache - run:
command: python ./manage.py test
name: Test

#define workflow to run
workflows:
main:
jobs: - build-and-test

steps involved in create CI/CD pipeline on AWS service.
AWS tools that's involved:

1. Codedeploy agent
2. EC2 instance
3. Deployment group: what does it do?

The pipeline has two stages:

A source stage named Source, which detects changes in the versioned sample application stored in the S3 bucket and pulls those changes into the pipeline.

A Deploy stage that deploys those changes to EC2 instances with CodeDeploy.
need to install the codedeploy agent on the ubuntu server.

appspec.yml doc:
Need to bundle the app into a achive file called revision, then the aws codedeploy agent can deploy it.
The orb in circleCI takes care of it automatically.


the AWS staging allow the application to be deployed onto Beta instances before the deployment onto the productions machines. 

CircleCI will build and test the application first. Then it will login to the AWS cli terminal using authentication with the environment variables. 


running into problem with insufficient permission to create the deployment group with the policy group of AWSCodeDeployFullAccess

How to Deploy Django Applications on AWS EC2 Using Apache:

Virtualenv problem. Changing the ownership of the files to the ec2-user results in the permission denied error for pip. It is strange because following the common sense, because the current user is ec2-user, I should have the permission to change the files.
It is resolved through recreating the virtual environment. 


another problem encounter is that the AWS Linux doesn't have the up to date sqlite, which is what my database for Django is trying to use. 
I solved it with the help of compiling the later version of sqlite. 

$ wget https://www.sqlite.org/2019/sqlite-autoconf-3290000.tar.gz
$ tar zxvf sqlite-autoconf-3290000.tar.gz
$ cd sqlite-autoconf-3290000
$./configure --prefix=$HOME/opt/sqlite
$ make && make install

then the path is exported to the environment, which is used to create the sqlite installation
export PATH=$HOME/opt/sqlite/bin:$PATH
export LD_LIBRARY_PATH=$HOME/opt/sqlite/lib
export LD_RUN_PATH=$HOME/opt/sqlite/lib

nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
In order to solve it:
sudo yum install net-tools
netstat -ltnp | grep -w ':80'
however, the above returns empty.
after turning on the port 80 for the EC2 instance. the nginx server is finally up and running. I suspect this is due to the port is not open and the nginx process is stuck in the limbo.
ps aux | grep nginx
after killing the old nginx process and start the new one, the port 80 is finally visitable.


commenting out the collect statics files because I don't have statistic files to serve.


encountered a problem where the virtual env cannot create the environment folder due to permission issue even though the appspec should make the owner and permission ec2-user in the permission section. need to look further into the practice of permission and ownership, however, the current strategy will be running all the scripts using root. I created a new deployment group to circumsize the error. 

raise KeyError(key) from None
[stderr]KeyError: 'DJANGO_SECRET_KEY'

even through is it exported from the bashrc.

