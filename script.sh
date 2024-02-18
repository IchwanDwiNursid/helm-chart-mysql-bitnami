# add repository 
helm repo add bitnami https://charts.bitnami.com/bitnami

# SIMULATION review----- create template using file.yaml 
helm template mysql-8 bitnami/mysql -f values-mysql.yaml  --namespace database 
# SIMULATION review----- specify resource using --set (command line)
helm template mysql-8 bitnami/mysql --set primary.persistence.size=10Gi  --namespace database --create namespace

# SIMULATION installation -- dry-run
helm install mysql-8 bitnami/mysql -f values-mysql.yaml --dry-run 

# install 
helm install mysql-8 bitnami/mysql -f values-mysql.yaml

# install with other namespace
helm install mysql-8 bitnami/mysql -f values-mysql.yaml --namespace database --create-namespace

# upgrade chart
helm upgrade mysql-8 bitnami/mysql -f values-mysql.yaml --version 9.19.1 

# show release show 
helm ls
helm ls -n database

# helm history release 1,2,3,4,5,6
helm history mysql-8

# release values
helm get values mysql-8

# rollback revision
helm rollback mysql-8 1

# uninstall
helm uninstall mysql-8