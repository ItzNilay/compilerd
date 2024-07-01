# Deployment and steps of testing

1. Log in to AWS Console<br />
    •Navigate to the AWS Management Console. <br />
    •Enter your credentials to log in. <br />
<br />
2. Create an EC2 Instance<br />
    •Search for "EC2" in the AWS console search bar. <br />
    •Click on "Launch Instance" to start the setup process.<br />
    •Choose an Amazon Machine Image (AMI): Select the Ubuntu Server x86 image.<br />
    •Select an Instance Type: Choose t2.micro (or a larger instance if needed).<br />
    •Configure Instance: Configure settings as needed, then click "Next: Add Storage".<br />
    •Add Storage: Set up your storage, then click "Next: Add Tags".<br />
    •Add Tags: Add any tags if needed, then click "Next: Configure Security Group".<br />
    •Configure Security Group: Add a rule to allow traffic on port 3000.<br />
        •Type: Custom TCP<br />
        •Port Range: 3000<br />
        •Source: Anywhere (0.0.0.0/0)<br />
    •Review and Launch: Review your settings, then click "Launch".<br />
    •Select or create a key pair, then click "Launch Instances".<br />
<br />
3. Connect to Your EC2 Instance<br />
    •Go to the "Instances" section of the EC2 dashboard.<br />
    •Select your instance and click "Connect".<br />
    •Follow the instructions to SSH into your instance using the key pair you selected.<br />
<br />
4. Set Up the Instance<br />
    •Update package lists:<br />
        sudo apt update<br />
    •Install Git:<br />
        sudo apt install git -y<br />
<br />
5. Clone the Repository<br />
    •Clone your project repository:<br />
        git clone <git-repo-url><br />
    •Change to the project's root directory:<br />
        cd <project-root-folder><br />
<br />
6. Install Docker and Node.js via NVM<br />
    •Install Docker:<br />
        sudo apt install docker.io -y<br />
        sudo systemctl start docker<br />
        sudo systemctl enable docker<br />
        sudo usermod -aG docker $USER<br />
    •Install NVM (Node Version Manager):<br />
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash<br />
        source ~/.bashrc<br />
    •Install Node.js:<br />
        nvm install node<br />
        nvm use node<br />
<br />
7. Install Project Dependencies<br />
    •Install npm dependencies:<br />
        npm install<br />
<br />
8. Build and Run the Docker Container<br />
    •Build the Docker image:<br />
        docker build -t <image-name> .<br />
    •Run the Docker container:<br />
        docker run -p 3000:3000 -e OPENAI_API_KEY=<your-api-key> -e ALLOWED_RAM=<allowed-ram-value> <image-name><br />
<br />
9. Configure Security Group for Port 3000<br />
    •Go to the "Security Groups" section of the EC2 dashboard.<br />
    •Select the security group associated with your instance.<br />
    •Click on the "Inbound rules" tab, then click "Edit inbound rules".<br />
    •Add a rule:<br />
        Type: Custom TCP<br />
        Port Range: 3000<br />
        Source: Anywhere (0.0.0.0/0)<br />
    •Save the changes.<br />
<br />
10. Test the Deployment with Postman<br />
    •Open Postman on your local machine.<br />
    •Create a new POST request.<br />
    •Set the request URL to http://<instance-ipv4>:3000/api/execute/.<br />
    •Use the payload provided in your project's README.md.<br />
    •Send the request to verify that your application is working correctly.<br />
    <br />
By following these detailed steps, you will have your application up and running on an AWS EC2 instance, ready to handle requests on port 3000.<br />
