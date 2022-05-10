OCI deployment over OCI instances using canary.

=======

- create a terraform.tfvars file based on the sample below.

```
# Authentication
tenancy_ocid         = "<OCID Of OCI Tenancy>"
user_ocid            = "<OCID OF AN OCI USER >"
fingerprint          = "OCI FINGER PRINT"
private_key_path     = "PRIVATE KEY PATH "

# Region
region = "OCI REGION "

# Compartment
compartment_ocid = "<OCI OF OCI COMPARTMENT>" 

# OCI  
oci_username         = "<OCI TENANCY/USERNAME or FEDERATED USER INFORMATION>"
oci_user_authtoken     = "USER SECRET KEY"

# Set a value which will be prefixed to the resource names.
app_name = "mycanary"

```

Terraform instructions (for manual run)

```
$ terraform init
$ terraform plan -out plan.out
$ terraform apply
$ terraform destroy (Ensure to delete artifact from artifact repository)
```

How to Test and do a rollback.
----

- OCI Console > Developer Services > DevOps>Project>Project Name>Build pipeline  do click Start manual run.
- Wait until all the build stages completed.
- Switch to the deployment pipeline and click on the Deployments and deployment which is in progress.
- After a while pipeline will be pending for Approval stage. Click on the 3 dots and approve the stage .
- Wait for all the Deployment stages to finish.
- Launch the application using the public ip address of the Load balancer via browser.
- Now to realize the Canary effect ,do a re-run ,do a manual run of Build pipeline.
- Wait for all the Build stages to finish.
- Follow the Deployments progress and wait until Traffic Shift to Canary is finished (just before the approval).
- Launch the application using the public Ip address via browser. Since the canary % of shift is 25 ,25 % of request now will be served via Canary environment. Along the previous output you will additionally see the canary deployed application view as well. (For a demo we are using an icon to differentiate).

- Give the Approval and finish the deployment .
- You may do an application change via updating the file app_version.config via the OCI Code Repo to a different value and re - run the build pipeline .
- Since we are not using a test load balancer , you may launch the canary vm IP via browser to test the changes during the Traffic shift to Canary stage completion and approve further for production deployment and once the end of Production Canary stage ,the new version will be available via production load balancer.
- To do a rollback ,click on the 3 dots of Last stage of Deployment pipeline and use Manual rollback.

- Detailed instruction is here - https://github.com/oracle-devrel/oci-devops-examples/tree/main/oci-deployment-examples/oci-devops-deploy-instances-with-canary
