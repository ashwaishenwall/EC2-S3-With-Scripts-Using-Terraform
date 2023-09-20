#!/bin/bash

# Update the package list
sudo apt update -y
# Install Docker
echo "Installing Docker"
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER
# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo chmod 666 /var/run/docker.sock
docker-compose --version
# Install Java for Jenkins
echo "Installing Java for Jenkins"
sudo apt install openjdk-11-jre -y
# Install Jenkins
#!/bin/bash
# Install Java for Jenkins
echo "Installing Java for Jenkins"
sudo apt install openjdk-11-jre -y
# Install Jenkins
echo "Installing Jenkins"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install fontconfig openjdk-11-jre -y
sudo apt-get install jenkins -y
# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins
# Install Nginx
echo "Installing Nginx"
sudo apt install nginx -y
# Start Nginx service
sudo systemctl start nginx
# Enable Nginx to start on boot
sudo systemctl enable nginx
# Display Nginx status
sudo systemctl status nginx
echo "Docker, Jenkins, and Nginx installation completed."
