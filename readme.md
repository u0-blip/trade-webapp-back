
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
