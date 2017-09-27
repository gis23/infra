## Different concepts of infrastructure management

## Directory stucture 

* packer/ templates and scripts to build preconfigured images with `Packer` from HashiCorp  
* terraform / Infrastructure as a Code practice with `Terraform`.
.sh scripts for manual deployment with hands via ssh session

### Quick start

- Manual app deploymen
- Build image with Packer
- Terrform scenario 
- Ansible scenario


#### Manual installation using bash scripts

Steps:
- Create computing instance on GCP (or any other provider or you can use bare metal server)
- SSH to created instance and use command below
ssh to host that will runs app and run this commands:
```
git clone https://github.com/gis23/infra.git
chmod +x infra/ -R && cd infra/
. ./install_ruby.sh && ./install_mongodb.sh && ./deploy.sh
```

Application will be avalable at http://yourinstanceip:9292/


#### startup script for GCP
Yor can use `startup.sh` as startup-script for creation google cloude compute instance on GCP.
for example:
```
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata startup-script='wget -O - https://raw.githubusercontent.com/gis23/infra/config-scripts/startup.sh | bash' reddit-app
```

### Build image with Packer
#### Packer templates for GCP

To see template variables use command 

```
$ packer inspect <template file>
```

Lets buil app image using `packer\ubuntu16.json` template and `packer\vars.json` as varfile
You can use `packer\vars.json.example` as example for your `vars.json` file

```
$ packer build -var-file vars.json ubuntu16.json
```

### Terraform provisioning
Terraform deploys the infrastructure by setting up network, spinning up servers with an images build by Packer.
before you begin work with terraform you have to build app and db images using `Packer`
After that go to terraform folder and config `variables.tf` file.
According you situation you might want to customize:

* project: Your GCP project id
* region: GCP region
* app_disk_image: app image name (build by packer)
* db_disk_image: db image name (build by packer)
* public_key_path: path to ssh public key (this key will be allowed to ssh into the servers)  

```
$ cd terraform
```
run command below to load modules
```
$ terraform get
``` 
then run 
```
terraform apply
```

### Ansible
Directory `ansible` contains playbooks to deploy app and db instance via ansible provisioners