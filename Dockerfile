FROM python:3.10

# Evita prompts do Debian
ENV DEBIAN_FRONTEND=noninteractive

# Instalar pacotes do sistema
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libjpeg-dev \
    zlib1g-dev \
    libpq-dev \
    build-essential \
    libffi-dev \
    python3-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório de trabalho
WORKDIR /odoo

# Copiar todos os arquivos do projeto
COPY . /odoo/

# Instalar dependências do Python
RUN pip install --upgrade pip && pip install -r requirements.txt

# Permissões de execução
RUN chmod +x entrypoint.sh

# Expor a porta do Odoo
EXPOSE 8069

# Comando de inicialização
ENTRYPOINT ["./entrypoint.sh"]
