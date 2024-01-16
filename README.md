# Event Organizer docker support

Using this project you can quickly launch all Event Organizer services in Docker.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)

## Installation

To run services you will need Docker Desktop on your local machine.  
You can download Docker for Windows from the following [link](https://docs.docker.com/desktop/install/windows-install/).

Clone the repository to your local machine.
```bash
git clone https://github.com/event-organizer-project/event-organizer-infrastructure.git
```

## Usage

Run PowerShell as administrator from the repository root folder and execute self-signed SSL certificates creation script.

```bash
.\create_certificates.ps1
```

Start services in docker containers using the docker-compose.

```bash
docker-compose up
```

Use the following command on subsequent services starts to obtain fresh images.

```bash
docker-compose pull
```