*&---------------------------------------------------------------------*
*& Report ZCAIXA_A71
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCAIXA_A71.

*Definição de variáveis
Data: descricao(30) type c,
      quantidade type i.
*Definição de campos na tela
PARAMETERS: p_desc type c LENGTH 30,
            p_qtd type i obligatory,
            p_data type sy-datum.

parameters:
p_chkbox type boolean as CHECKBOX,
p_radio1 type boolean radiobutton group grp1 default 'X',
p_radio2 type boolean radiobutton group grp1,
p_radio3 type boolean radiobutton group grp1.


descricao = p_desc.

*Imprimir Dados
write:
/ 'Descrição:', 30 descricao,
/ 'Quantidade: ', 30 p_qtd,
/ 'Data de Venda: ', 30 p_data MM/DD/YYYY.

SKIP.

wRITE:
/ 'Marca Propria', 30 p_chkbox,
/ 'Tamanho P:', 30 p_radio1,
/ 'Tamanho M:', 30 p_radio2,
/ 'Tamanho G:', 30 p_radio3.
