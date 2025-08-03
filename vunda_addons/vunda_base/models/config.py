
from odoo import models, fields

class ResConfigSettings(models.TransientModel):
    _inherit = 'res.config.settings'

    sistema_nome = fields.Char(string="Nome do Sistema")
    sistema_serie_fiscal = fields.Char(string="Série Fiscal Padrão")
    sistema_identificacao = fields.Char(string="Identificador do Sistema Fiscal")

    def set_values(self):
        super().set_values()
        self.env['ir.config_parameter'].sudo().set_param('vunda_base.sistema_nome', self.sistema_nome)
        self.env['ir.config_parameter'].sudo().set_param('vunda_base.sistema_serie_fiscal', self.sistema_serie_fiscal)
        self.env['ir.config_parameter'].sudo().set_param('vunda_base.sistema_identificacao', self.sistema_identificacao)

    def get_values(self):
        res = super().get_values()
        params = self.env['ir.config_parameter'].sudo()
        res.update(
            sistema_nome=params.get_param('vunda_base.sistema_nome', default='Vunda ERP'),
            sistema_serie_fiscal=params.get_param('vunda_base.sistema_serie_fiscal', default='AGT2024'),
            sistema_identificacao=params.get_param('vunda_base.sistema_identificacao', default='VD-SYS-001')
        )
        return res
