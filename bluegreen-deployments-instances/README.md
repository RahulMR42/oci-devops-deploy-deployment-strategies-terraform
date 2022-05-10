OCI deployment over OCI instances using blue green strategies.

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
- Switch back to Network>Load balancer and fetch the public IP address .
- Switch back to Deployment pipeline and validate the completion of all steps.
- Launch the application via a browser and validate the deployment.
- The expected result would be

```
With Love from OCI Devops(Version:<Value>) ,Served via environment:<GREEN or BLUE>

```
- Let us do a new deployment ,by changing app version in the file app_version.config.
- Push back to the respective code repo ,followed by a manual run of Build pipeline and wait for the completion of build and deployment pipeline (with an approval phase as well ).
- If you wish to validate the service before going to production (That’s the best practice for production deployment ,you can add a test load-balancer to fetch the intermittent version release.).For a demo you may validate by launching the instance's public IP via the browser.
- Refresh the browser with load-balancer IP and validate the changes.
- To do a role back , use the Revert traffic shift option via the last stage.
- You can click Reverse Traffic Shift button to launch the rollback.
- Detailed instruction is here - https://github.com/oracle-devrel/oci-devops-examples/tree/main/oci-deployment-examples/oci-devops-deploy-instances-with-blue-green-model
