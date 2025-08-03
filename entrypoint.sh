#!/bin/bash
# Criar diretório de sessões e logs se não existir
mkdir -p /odoo/.local/share/Odoo/sessions
mkdir -p /odoo/log

# Rodar o Odoo
exec python3 odoo/odoo-bin -c odoo.conf
