# google-roles
## IAM roles used by Google Cloud Artifacts Registry
## https://cloud.google.com/artifact-registry/docs/access-control

Predefined Artifact Registry roles
IAM provides predefined roles that grant access to specific Google Cloud resources and prevent unauthorized access to other resources.

Use the following predefined roles for standard, virtual, and remote repositories on the pkg.dev domain:

Role	Description
Artifact Registry Reader
(roles/artifactregistry.reader)	View and get artifacts, view repository metadata.
Artifact Registry Writer
(roles/artifactregistry.writer)	Read and write artifacts.
Artifact Registry Repository Administrator
(roles/artifactregistry.repoAdmin)	Read, write, and delete artifacts.
Artifact Registry Administrator
(roles/artifactregistry.admin)	Create and manage repositories and artifacts.
The following additional predefined roles include permissions to create gcr.io repositories to host images for the gcr.io domain. The roles don't include permissions to create other repository formats in Artifact Registry on the pkg.dev domain. These roles support backwards compatibility with Container Registry, since Container Registry uses the first push of a container image to create each multi-regional registry.

Role	Description
Artifact Registry Create-on-push Writer (roles/artifactregistry.createOnPushWriter)	Read and write artifacts. Create gcr.io repositories.
Artifact Registry Create-on-push Repository Administrator (roles/artifactregistry.createOnPushRepoAdmin)	Read, write, and delete artifacts. Create gcr.io repositories.
For a full list of the individual permissions in each role, refer to Artifact Registry roles. You can also use the gcloud iam roles describe command to view a list of permissions in each role.
