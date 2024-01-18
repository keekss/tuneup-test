# This Dockerfile is used to build a base image for development containers.
# It starts with the official Ubuntu base image and adds additional dependencies as needed.
FROM ubuntu:20.04

# Avoid prompts during package installation.
ARG DEBIAN_FRONTEND=noninteractive

# Run package installation script
COPY install-packages.sh /tmp/
RUN chmod +x /tmp/install-packages.sh && /tmp/install-packages.sh

# Set the working directory
WORKDIR /workspace