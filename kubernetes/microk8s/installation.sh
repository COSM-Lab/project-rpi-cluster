/boot/firmware/cmdline.txt
cgroup_enable=memory cgroup_memory=1

sudo apt-get --allow-releaseinfo-change-suite update

sudo apt install snapd
sudo snap install microk8s --classic

sudo usermod -a -G microk8s pilot
sudo chown -f -R pilot ~/.kube


sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube


newgrp microk8s

sudo swapoff -a 

microk8s enable dashboard dns 

If RBAC is not enabled access the dashboard using the default token retrieved with:

token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token

In an RBAC enabled setup (microk8s enable RBAC) you need to create a user with restricted
permissions as shown in:
https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md