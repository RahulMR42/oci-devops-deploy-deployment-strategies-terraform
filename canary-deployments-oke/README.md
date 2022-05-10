OCI deployment over OCI OKE  using canary  deployment strategies.

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

Special instructions 

```
- In order to install Nginx we are using terraform local executor with kubectl and oci . So for manual run you must have kubectl (installed and available) and oci cli (with pre -authenticated)
- In case its not available , You can comment the all the lines including the line `resource "null_resource" "oke_nginix_setup" {` till the end and later install Nginx and namespaces manually (Refer the detailed instruction at the end)
```

Terraform instructions (for manual run)

```
$ terraform init
$ terraform plan -out plan.out
$ terraform apply
$ terraform destroy (Ensure to delete the loadbalancer created by kubernetes before doing terraform destroy)
```

How to Test and do a rollback.
----

- OCI Console > Developer Services > DevOps>Project>Project Name>Build pipeline  do click Start manual run.
- Wait untill all the build stages completed.
- Switch to the deployment pipeline and click on the deployment which is in progress.
- The pipeline will be pending for Approval stage. 
- Click on the 3 dots and validate the Control:Approval stage.
- Wait for all the steps to complete.
- In order to validate the application , we would need the ingress IP address .To fetch the same ,switch to OCI Cloud Shell and run below commands and make a note of ingress ip address.

```
for i in nscanaryprd nscanarystage; do echo " ....... NS $i ..........."; kubectl get po,ing -n $i; done
```
- Validate the deployment using the Ingress Address via curl or browser.
- To simulate a new release scenario , edit the source code - main.py and change the version to 1.0 and run the build pipeline again to test a new deployment scenario.
- Update the changed code/files back to the respective repo.
- Go back to build pipeline and do click Start manual run.
- Wait until all the build stages completed.
- Switch to the deployment pipeline and click on the deployment which is in progress.
- Wait until the completion of % Canary Shift stage (Just before the approval).
- Launch the application via Curl or Browser and you can now see 25 % of traffic is now served via Canary Namespace with new version .
- You may run below via OCI Cloud Shell and can validate the details via curl.

```
for i in $(seq 1 100); do curl -Ls -H "redirect-to-canary" --resolve -k  http://<Ingress IP> | grep "Version"; done
```

- To continue the deployment of new version to Production ,proceed with the further stages by giving Approval and wait for the completion.
- Once all the stages are completed ,the newer version will be available via the production namespace.
- Let us test a roll back now. Click on 3 dots at the Last stage and select manual roll back.
- Select a desired deployment and initiate the rollback.

- Detailed instruction is here - https://github.com/oracle-devrel/oci-devops-examples/tree/main/oci-deployment-examples/oci-devops-deploy-with-canary-model-oke
