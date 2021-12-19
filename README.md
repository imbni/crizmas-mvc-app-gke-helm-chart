# gke-infrastructure

Contains terraform files used to build GKE infrastructure

Template for VPC and Kubernetes Cluster using remote modules

Helm chart to run **[crizmas-mvc](https://github.com/raulsebastianmihaila/crizmas-mvc)**

------------

### Prerequisites

- [ ] Google Cloud Platform (GCP).
- [ ] Google Cloud Account and login.
- [ ] Project created and valid billing account.
- [ ] In GCP, IAM, create service account and a token in JSON format. (save the file and keep in mind the name and location)
- [ ] Enable  Kubernetes Engine API from Main Menu, Kubernetes Engine → Configuration
- [ ] Enable Google Cloud Storage API
- [ ] **Google Cloud Storage (GCS)** bucket. bucket folder has terraform files to create the bucket do appropiate changes. 
- [ ] Terraform Cloud token file saved in your working directory.
- [ ] The name of the file must be: **.terraformrc**

**When running Terraform from the CLI, you must configure credentials in a .terraformrc or terraform.rc file**

## 1. Build terraform image using the Docker file

Run the following command to create the image. 

    docker build -t terraformers:v1 .

## 2. Create Google service account and authorisation file

Create a service account and generate a key in JSON format.

Save the file as "gcp_auth.json" and place the file in these folders:
- run-modules\create-gke
- run-modules\create-bucket

## 3. Create Google Cloud Storage 

1. Navigate to the folder 'run-modules\create-bucket'
2. Edit the file **terraform.tfvars** and change the values to the variables to match your environment like,
   
   - Project Id
   - The billing account associated to the project
   - Bucket name
   - Path to your authorisation file (gcp_auth_file)
   
3. Place the json file to the path specify in the variable file 

   _Hint_: Place the file in the working folder along with the other terraform files.
  
4. Run the terraform commands init, plan, apply 

**_You can also use the alias defined in the .terraformers_functions file under the "dotfiles" repository._**

- Init
```shell
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 init
```
- Plan
```shell
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 plan
```
- Apply
```shell
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-auto-approve"
```

 _Remove the "auto-approve" flag if you want to manually confirm your choice._
 
Once the code applied, the bucket will be created according to the parameters defined.

## 4. Build infrastructure using Remote modules

- This method uses Remote modules loaded in Terraform Cloud Registry 

**Note:** When using remote modules from Terraform Cloud (TFC), you will need to save your TFC token in the working folder where terraform files run.
- Use the terraform login command to generate the token  

**Steps**
1. Navigate to the folder 'run-modules\create-gke'
2. Edit the file **terraform.tfvars** and change the values to the variables to match your environment like,
   - Project Id
   - The billing account associated to the project
   - Bucket name (same as the bucket name that you used in step 3)
   - Path to your authorisation file 
3. Make sure you have your json authorisation file in your working directory or location specified in the tfvars files
4. Place the Terraform Cloud token under the working directory  (see next section)
 **Name the file as: .terraformrc**
6. Run the terraform commands init, plan, apply. 
7. Run terraform command destroy if needed. (Run this command when doing testings to avoid unnecessary or accidental **fees** :heavy_dollar_sign: :heavy_dollar_sign:)

   Terraform commands

- Init
```shell
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 init
```
- Plan
```shell
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 plan
```
- Apply
```shell
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-auto-approve"
```
## 5. Using Helm Chart to run **[crizmas-mvc](https://github.com/raulsebastianmihaila/crizmas-mvc)**
- Enable APIs
```shell
gcloud container clusters get-credentials gke-mbn-tformers-default-dev --region us-central1 
```
- Helm command
```shell
helm install --generate-name ./ --set replicaCount=2,image.tag=1.1.0 
```

