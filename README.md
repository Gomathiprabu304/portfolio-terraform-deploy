\# Portfolio Deployment with Terraform + Docker + AWS



This project provisions an AWS EC2 instance using Terraform and deploys a Dockerized portfolio website automatically.



\## What it does

\- Creates a security group allowing HTTP (80) and SSH (22)

\- Launches a t2.micro EC2 instance

\- Installs Docker via user\_data script

\- Pulls and runs a Docker image from Docker Hub

\- Outputs the live website URL



\## Tech stack

\- Terraform (Infrastructure as Code)

\- AWS EC2

\- Docker



\## Usage



\## CI/CD

Paired with a GitHub Actions workflow (see \[flair-frontend repo](https://github.com/Gomathiprabu304/flair-frontend)) that automatically builds, pushes, and redeploys on every code push.

