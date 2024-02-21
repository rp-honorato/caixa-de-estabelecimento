*&---------------------------------------------------------------------*
*& Report ZCAIXA_A71
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcaixa_a71.

*&---------------------------------------------------------------------*
*&ENTRADA
*&---------------------------------------------------------------------*

*Definição de variáveis
DATA: descricao(30) TYPE c,
      quantidade    TYPE i.

DATA:
  preco           TYPE p DECIMALS 2,
  imposto         TYPE p DECIMALS 2,
  precofinal      TYPE p DECIMALS 2,
  desconto        TYPE p DECIMALS 2,
  data_vencimento TYPE d.

*Definição de campos na tela
PARAMETERS: p_desc TYPE c LENGTH 30,
            p_qtd  TYPE i OBLIGATORY,
            p_data TYPE sy-datum,
            p_grup TYPE matkl.


PARAMETERS:
  p_chkbox TYPE boolean AS CHECKBOX,
  p_radio1 TYPE boolean RADIOBUTTON GROUP grp1 DEFAULT 'X',
  p_radio2 TYPE boolean RADIOBUTTON GROUP grp1,
  p_radio3 TYPE boolean RADIOBUTTON GROUP grp1.

*&---------------------------------------------------------------------*
*& LÓGICA
*&---------------------------------------------------------------------*

descricao = p_desc.
quantidade = p_qtd.

preco = '3.99'.
*multiplicação
imposto = preco * '0.10'.
*soma e multiplicação (priorização)
precofinal = ( preco + imposto ) * quantidade.
*subtração
precofinal = precofinal - desconto.

*operações com datas
data_vencimento = p_data + 30.


*&---------------------------------------------------------------------*
*& SAÍDA
*&---------------------------------------------------------------------*

*Imprimir Dados
WRITE:
/ 'Descrição:', 30 descricao,
/ 'Quantidade: ', 30 p_qtd,
/ 'Data de Venda: ', 30 p_data MM/DD/YYYY.

SKIP.

WRITE:
/ 'Marca Propria', 30 p_chkbox,
/ 'Tamanho P:', 30 p_radio1,
/ 'Tamanho M:', 30 p_radio2,
/ 'Tamanho G:', 30 p_radio3.

SKIP.

WRITE:
  / 'Preço: ', 24 preco,
  / 'Imposto: ', 24 imposto,
  / 'Preço Final: ', 24 precofinal,
  / 'Desconto: ', 24 desconto,
  / 'Data Vencimento:', 24 data_vencimento MM/DD/YYYY.
