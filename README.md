# terraform.ibmcloud.vpc-rhoic
Terraform templates for building a single zone RHOIC cluster and the required VPC and Storage prerequisites.

If you want this is two separate steps then there are repositories for that:
* Network and Storage - [terraform.ibmcloud.vpc](https://github.com/redhat-gpst/terraform.ibmcloud.vpc)
* OpenShift - [terraform.ibmcloud.rhoic](https://github.com/redhat-gpst/terraform.ibmcloud.rhoic)

# Using the templates

The one variable that has to be passed is `ibmcloud_api_key`. The one variable I recommend passing, or checking 
anyway, is `cluster_version`. The available versions can be found using the CLI command `ibmcloud oc versions` 
or by connecting to the [IBM Cloud Kubernetes Versions API](https://containers.cloud.ibm.com/global/v1/versions)
with curl or a browser (no authentication needed).

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
