### Infrastructure repo

#### installation
```
git clone https://github.com/gis23/infra.git
chmod +x infra/ -R && cd infra/
. ./install_ruby.sh && ./install_mongodb.sh && ./deploy.sh
```


#### startup script for GCP

```
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata startup-script='wget -O - https://raw.githubusercontent.com/gis23/infra/config-scripts/startup.sh | bash' reddit-app
```
