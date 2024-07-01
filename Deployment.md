1. Log in to AWS Console
    Navigate to the AWS Management Console.
    Enter your credentials to log in.

2. Create an EC2 Instance
    Search for "EC2" in the AWS console search bar.
    Click on "Launch Instance" to start the setup process.
    Choose an Amazon Machine Image (AMI): Select the Ubuntu Server x86 image.
    Select an Instance Type: Choose t2.micro (or a larger instance if needed).
    Configure Instance: Configure settings as needed, then click "Next: Add Storage".
    Add Storage: Set up your storage, then click "Next: Add Tags".
    Add Tags: Add any tags if needed, then click "Next: Configure Security Group".
    Configure Security Group: Add a rule to allow traffic on port 3000.
        Type: Custom TCP
        Port Range: 3000
        Source: Anywhere (0.0.0.0/0)
    Review and Launch: Review your settings, then click "Launch".
    Select or create a key pair, then click "Launch Instances".

3. Connect to Your EC2 Instance
    Go to the "Instances" section of the EC2 dashboard.
    Select your instance and click "Connect".
    Follow the instructions to SSH into your instance using the key pair you selected.

4. Set Up the Instance
    Update package lists:
        sudo apt update
    Install Git:
        sudo apt install git -y

5. Clone the Repository
    Clone your project repository:
        git clone <git-repo-url>
    Change to the project's root directory:
        cd <project-root-folder>

6. Install Docker and Node.js via NVM
    Install Docker:
        sudo apt install docker.io -y
        sudo systemctl start docker
        sudo systemctl enable docker
        sudo usermod -aG docker $USER
    Install NVM (Node Version Manager):
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
        source ~/.bashrc
    Install Node.js:
        nvm install node
        nvm use node

7. Install Project Dependencies
    Install npm dependencies:
        npm install

8. Build and Run the Docker Container
    Build the Docker image:
        docker build -t <image-name> .
    Run the Docker container:
        docker run -p 3000:3000 -e OPENAI_API_KEY=<your-api-key> -e ALLOWED_RAM=<allowed-ram-value> <image-name>

9. Configure Security Group for Port 3000
    Go to the "Security Groups" section of the EC2 dashboard.
    Select the security group associated with your instance.
    Click on the "Inbound rules" tab, then click "Edit inbound rules".
    Add a rule:
        Type: Custom TCP
        Port Range: 3000
        Source: Anywhere (0.0.0.0/0)
    Save the changes.

10. Test the Deployment with Postman
    Open Postman on your local machine.
    Create a new POST request.
    Set the request URL to http://<instance-ipv4>:3000/api/execute/.
    Use the payload provided in your project's README.md.
    Send the request to verify that your application is working correctly.
    
By following these detailed steps, you will have your application up and running on an AWS EC2 instance, ready to handle requests on port 3000.