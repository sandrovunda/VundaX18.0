
{
    "name": "Vunda Base",
    "summary": "Configuração base e identidade visual do sistema Vunda",
    "description": "Parâmetros globais, permissões e identidade visual para o SaaS fiscal angolano.",
    "author": "Sandro Miguel Augusto",
    "version": "1.0.0",
    "depends": ["base"],
    "data": [
        "security/ir.model.access.csv",
        "views/config_view.xml",
        "data/parametros_default.xml"
    ],
    "application": True,
    "installable": True,
    "license": "AGPL-3",
}
