# Base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && apt-get clean

# Create non-root user (important for Jenkins/K8s)
RUN useradd -m -s /bin/bash jenkinsuser

# Switch to new user
USER jenkinsuser

# Default working directory
WORKDIR /home/jenkinsuser

# Default command (container start test)
CMD ["whoami"]
