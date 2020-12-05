FROM golang:1.15
RUN apt-get update && apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    zip
RUN cd /opt && \
    wget -qO terraform.zip https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip && \
    unzip terraform.zip && \
    chmod +x terraform && \
    mv terraform /usr/local/bin/terraform && \
    rm terraform.zip && \
    terraform -v
RUN cd /opt && \
    wget -qO terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.26.7/terragrunt_linux_amd64 && \
    chmod +x terragrunt && \
    mv terragrunt /usr/local/bin/terragrunt && \
    terragrunt -v
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && apt-get install -yq azure-cli && \
    az -v
