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
bucket_name           = "tf-bucket-ycit021-1038cd"					# Put the desired GCS Bucket name.
storage-class         = "Standard"

