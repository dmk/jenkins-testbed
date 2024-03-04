# Jenkins-Testbed

This repository provides a Docker-Compose setup for deploying Gitea and Jenkins locally.
It's designed for developers and testers who need a local Jenkins instance to experiment
with plugins or other functionalities. The Gitea instance serves as a repository manager,
pre-populated with directories for Jenkins JobDSL configurations and Jenkinsfiles,
facilitating an out-of-the-box CI/CD environment.

## Features

- **Local Gitea and Jenkins Deployment:** Simplified setup using Docker-Compose.
- **Automated Project Setup:** Two projects each with a job that executes every 5 minutes,
    including sleep stages for testing.
- **Preconfigured with JobDSL and Jenkinsfiles:** `./gitea/repos/job-dsl` for Jenkins JobDSL
    stuff, and Jenkinsfiles in other `./gitea/repos` directories.

## Getting Started

### Prerequisites

- Docker and Docker-Compose need to be installed on your machine.

### Installation and Setup

1. Clone this repository to your local machine.
2. Navigate to the repository's root directory.
3. Run the following command to start the services in detached mode:
    ```bash
    docker-compose up -d
    ```

## Project Roadmap

- **Gitea Repository Checks:** Prevent recreation of existing repos. [WIP]
- **Automatic Jenkins Nodes Configuration:** [WIP]
- **Configuration Script:** A Python script to generate `jenkins-compose` and other configurations from a file. [Planned]
- **Plugins Specification:** Allow specifying Jenkins plugins in the configuration. [Planned]
- **Auto Configuration Generation:** For job-dsl, Jenkins jobs, and Gitea repositories. [Planned]
- **Gitea Repos Service:** Push changes to Gitea repos based on configuration. [Planned]

## Contributing

Contributions are welcome! Feel free to submit bugs, documentation, and suggestions for new features.

## License

This project is licensed under the MIT License - see the LICENSE file for details.