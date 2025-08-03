FROM python:3.10

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    wget \
    nodejs \
    npm \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libpq-dev \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório de trabalho
WORKDIR /odoo

# Copiar arquivos
COPY . /odoo/

# Instalar dependências Python
RUN pip install --upgrade pip && pip install -r requirements.txt

# Dar permissão ao entrypoint
RUN chmod +x entrypoint.sh

# Expor porta padrão do Odoo
EXPOSE 8069

ENTRYPOINT ["./entrypoint.sh"]
