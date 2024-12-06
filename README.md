# Terraform,Docker and GitHub Actions Pipeline

## Table of Contents
- [Terraform Setup](#terraform-setup-for-provisoning-vpc-and-ec2-in-aws)
- [App Containerization](#hello-world-html-file-and-containerization)
- [GitHub Actions](#github-actions-workflow-for-terraform-validation-and-docker-image-build)

## Terraform Setup for provisoning VPC and EC2 in AWS

For provisiong VPC and EC2 in AWS,terraform is used in an structured way as defining modules.So Configurations needed for creating VPC and EC2 are kept in 
two different directories as Modules names "vpc" and "ec2".In VPC module main.tf file there is configurations for creating new custom vpc,subnet,route table,
internet gateway,subnet association,routing configuration.Same like vpc module there is main.tf file inside ec2 module directory.In which configurations include 
Creating an security group, Key pair,EBS volume and an EC2 Instance in the Created VPC and Subnet. Below is the terraform code structure.
```
├── main.tf
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
└── variables.tf
```

The required variables values for each modules is taking from "variables.tf" file in respective modules directory.And those module level "variables.tf" geting the
necessary values from "variables.tf" file placed in root terraform directory.And there is an "outputs.tf" file residing in both of the modules directory and terraform
root directory.The purpose of the output directory is to store necessary output values to respective "outputs.tf" file both modules level and root level.

And there is an "main.tf" file in root terraform directory,in which the modules are mentioned along with required variables configuration.

So,the workflow will be like "terraform apply" will be executed from root directory and terraform will be provision resources in aws as per modules mentioned in root "main.tf"
file,that is pointing to the configurations written in both vpc and ec2 modules "main.tf" files.The necessary variables values will be pickup from "variables.tf" files and
output values will gets stored in outputs.tf file.

To format terraform code :

```terraform fmt```

To validate terraform code :

```terraform validate```

To initialize terraform dependencies :

```terraform init```

To plan resources provisiong :

```terraform plan```

To provision resources :

```terraform apply```

To destroy resources :

```terraform destroy```


## Hello World HTML file and Containerization

There is an index.html file in the repository root directory,Its an simple html file with text "Hello World".
For containerizing that html file as an static content,and Dockerfile also places in the project root directory.The Dockerfile uses an Nginx Webserver as Base Image and there is an 
Instruction to copy the "index.html" file from the root directory to nginx containers "/usr/share/nginx/html/" directory. So when running the nginx container using the image build using
the Dockerfile,the index.html file gets served.

To build the docker Image :

```docker build -t hello-world:v1 .```

To run the nginx container using tha image :

```docker run -d -p 8080:80 --name hello-world hello-world:v1```

To Verify the static content serving from nginx container :

```curl -f http://localhost:8080```


## GitHub Actions Workflow for Terraform Validation and Docker Image build

Since we already setup all the necessary configuration for VPC and EC2 provsioning in aws using terraform and html file containerization using docker,This github actions workflow continously 
ensuring the validation and format checking of the terraform codes and also building the nginx docker image with the index.html file latest changes and verifying it.

So the workflow configuration is placed in the directory ".github/workflows/ and in the file "main.yml". The workflow having two jobs,First job is to checkout the repository codes,setup terraform 
dependencies and execute terraform format check and terraform validation.The second job is to checkout the repository codes,setup docker dependencies and build the docker image and run an container 
using the docker image and the verify the index.html content serving using  "curl".And atlast after verifying the content serving,just stop the container and remove it.

The Actions CICD pipeline gets triggered and run whenever a push event or pull request event happens to "main" branch of the repository and First it will wait for getting an ubuntu github actions 
runner,and once it gets one ubuntu runner,the job will checkout to the repository code and setup terraform dependenies in the ubuntu runner and then exeucte the "terraform fmt -check" command to check
formatting of the terraform codes and then executes "terraform init" to initialize necessary dependencies and then executes "terraform validate" to validate terraform code.And after the terraform validation 
is completed,next job will get started and checkout to the code and define and environment variable "IMAGE_NAME" as hello-world:${{ github.run_id }} and it will store as GITHUB environment variable to use it
in next stage.Then the docker image gets build with image name as value in "IMAGE_NAME".Then will run an docker container with the builded image and once the container got started,the "index.html" content 
serving will check using "curl" command.After that verification the container gets stopped and also gets removed.



# **Thats the End of the Task, Thank You**
