FROM python:3.12.1-slim

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências do sistema para compilar as libs Python
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

# Definir diretório de trabalho
WORKDIR /odoo

# Copiar projeto
COPY . /odoo/

# Atualizar pip + instalar ferramentas de build
RUN pip install --upgrade pip setuptools wheel Cython

# Instalar as dependências
RUN pip install -r requirements.txt

# Garantir permissões de execução
RUN chmod +x entrypoint.sh

# Expor a porta 8069 do Odoo
EXPOSE 8069

# Comando de entrada
ENTRYPOINT ["./entrypoint.sh"]
