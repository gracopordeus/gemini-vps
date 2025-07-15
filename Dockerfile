# Use uma imagem oficial do Python 3 como imagem base.
# python:3.12-slim-bookworm é uma boa escolha por ser leve.
FROM python:3.12-slim-bookworm

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Evite prompts interativos durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Instale o Git e as dependências necessárias para adicionar o repositório do Node.js
RUN apt-get update && \
    apt-get install -y git curl && \
    # Adicione o repositório do NodeSource para o Node.js 20
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    # Instale o Node.js
    apt-get install -y nodejs && \
    # Limpe o cache do apt para reduzir o tamanho da imagem
    rm -rf /var/lib/apt/lists/*

# Verifique as versões instaladas (opcional, mas recomendado)
RUN python --version && \
    node --version && \
    npm --version && \
git --version
