# terraform.ibmcloud.rhoic
Terraform templates for building a single zone RHOIC cluster and the required VPC and Storage prerequisites.

If you want this is two separate steps then there are repositories for that:
* Network and Storage - [terraform.ibmcloud.vpc](https://github.com/redhat-gpst/terraform.ibmcloud.vpc)
* OpenShift - [terraform.ibmcloud.rhoic](https://github.com/redhat-gpst/terraform.ibmcloud.rhoic)

# Using the templates

## With the terraform CLI

```
$ git clone <this repo>
$ cd <this repo>
$ terraform init
$ terraform plan
$ terraform apply
```

And when you are done

```
$ terraform destroy
$ cd ..
$ rm -rf <this repo>
```

## With IBM Cloud Schematics

[IBM Cloud Schematics documentation](https://cloud.ibm.com/docs/schematics)

* Create workspace
* Create execution plan (action) pointed at this git repo
* Execute the plan

When completed you can simply delete the workspace which will run a delete and destroy all objects the workspace provisioned.
