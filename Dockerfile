FROM python:3.12.1-slim-buster

ENV DEBIAN_FRONTEND=noninteractive

# Instalar bibliotecas do sistema necessárias para Odoo
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libffi-dev \
    libjpeg-dev \
    zlib1g-dev \
    libssl-dev \
    libjpeg62-turbo-dev \
    nodejs \
    npm \
    git \
    curl \
    wget \
    python3-dev \
    && apt-get clean

# Criar diretório de trabalho
WORKDIR /odoo

# Copiar o projeto
COPY . /odoo/

# Atualizar pip e instalar dependências
RUN pip install --upgrade pip setuptools wheel Cython
RUN pip install -r requirements.txt

# Tornar o entrypoint executável
RUN chmod +x entrypoint.sh

# Expor porta
EXPOSE 8069

# Entrypoint
ENTRYPOINT ["./entrypoint.sh"]
