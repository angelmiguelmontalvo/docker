#!/bin/sh
# Sonarqube pre-requisites
sudo sysctl -w vm.max_map_count=524288
sudo sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
echo "Setting for sonarqube"

# Create volumes and network
sudo docker volume create --name pgdata
sudo docker volume create --name data
sudo docker volume create --name extensions
sudo docker volume create --name logs
sudo docker volume create --name jenkins
sudo docker volume create --name nexus-data
sudo docker volume create --name portainer_data
sudo docker volume create --name docker_sock
echo "Volumes created"

sudo docker network create task1
echo "Network task1 created"

# default port 5432 for postgres

# Postgres
sudo docker run --name postgres -v \
        pgdata:/var/lib/postgresql/data -e \
        POSTGRES_USER=sonar -e \
        POSTGRES_PASSWORD=sonar -d \
        --net task1 postgres
echo "docker container postgres created"

# Sonarqube
sudo docker run --name sonarqube \
    -p 9000:9000 \
	-v data:/opt/sonarqube/data \
	-v extensions:/opt/sonarqube/extensions \
	-v logs:/opt/sonarqube/logs \
	-e SONARQUBE_JDBC_USERNAME=sonar \
	-e SONARQUBE_JDBS_PASSWORD=sonar \
	-d --net task1 sonarqube:5.6
echo "docker container sonarqube created"

# Jenkins
sudo docker run --name jenkins \
    -p 8080:8080 \
	-v jenkins:/var/lib/jenkins \
	-d --net task1 jenkins/jenkins
echo "docker container jenkins created"

# Nexus
sudo docker run -p 8081:8081 \
    --name nexus -v nexus-data:/nexus-data \
	-e INSTALL4J_ADD_VM_PARAMS="-Xms2703m -Xmx2703m -XX:MaxDirectMemorySize=2703m" \
	-d --net task1 sonatype/nexus3:3.18.1
echo "docker container nexus created"

# Portainer
docker run -d -p 8800:8000 -p 9900:9000 \
    --name=portainer --restart=always \
	-v docker_sock:/var/run/docker.sock \
	-v portainer_data:/data portainer/portainer-ce
	portainer
echo "docker container portainer created"
