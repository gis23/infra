### Infrastructure repo


#### Manual installation using bash scripts

`install_ruby.sh` will install Ruby 2.4
`install_mongodb` will install MongoDB
`deploy.sh` will deploy our app `puma-server`

ssh to host that will runs app and run this commands:
```
git clone https://github.com/gis23/infra.git
chmod +x infra/ -R && cd infra/
. ./install_ruby.sh && ./install_mongodb.sh && ./deploy.sh
```


#### startup script for GCP
Yor can use `startup.sh` as startup-script for creation google cloude compute instance on GCP.
for example:
```
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata startup-script='wget -O - https://raw.githubusercontent.com/gis23/infra/config-scripts/startup.sh | bash' reddit-app
```

#### Packer template for GCP

build example:
```
packer build \
-var 'project_id=versatile-cove-178812' \
-var 'source_image=ubuntu-1604-xenial-v20170815a' \
-var 'machine_type=f1-micro' \
ubuntu16.json
```

variables you can use:
```
  "project_id": null,
  "source_image": null,
  "machine_type": "f1-micro",
  "disk_size": 10,
  "disk_type": "pd-standard",
  "network": "default",
  "tags":""
```
`project_id` and `source_image` are required variables
