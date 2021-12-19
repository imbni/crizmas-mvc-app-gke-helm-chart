# Values for variables used by terraform
#
# Update values with your environment
#
gcp_auth_file         = "./gcp_auth.json"          			#File with service account Key in json format 
gcp_project_id        = "mohammad-notepad-dev-1"         						#Project ID, not the name the Project Id
billing_account       = "0145F8-72407D-496865"     							#billing account tied to the project Id

gcp_region            = "us-central1"
gcp_zone              = "us-central1-a"

org				      = "mbn" 								# Student initials for instance
environment           = "dev" 								#value to be prefixed to resources names to differentiate them
bucket_name           = "tf-bucket-ycit021-new"					# Put the desired GCS Bucket name.

#Network related

network_cidr_range      =   "10.128.1.0/26"

pods_cidr_range         =   "172.20.0.0/18"
pods_cidr_name        	=   "pod-d"

services_cidr_range     =   "172.100.0.0/21"
services_cidr_name      =   "serv-d"

master_ipv4_cidr_block_range    =  "172.16.0.0/28"

initial_node_count		=	1
node_preemptible        =   true
gke_pool_machine_type   =   "e2-small"
