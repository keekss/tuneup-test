FROM ghcr.io/keekss/codespaces-base:latest

# Run package installation script
COPY install-packages.sh /tmp/
RUN chmod +x /tmp/install-packages.sh && /tmp/install-packages.sh

# Set the working directory
WORKDIR /workspace