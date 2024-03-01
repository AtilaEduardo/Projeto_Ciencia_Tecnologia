# Projeto_Ciencia_Tecnologia

Favor ler o arquivo README.md pela visão CODE

Repositório COBOL Destinado a Semana de Ciência e Tecnologia - IFBA

O PGM adicionados há este repositorio são referentes a semana de ciência e tecnologia do IFBA campus Camaçari;

Objetivo do projeto:
- O objetivo principal deste projeto é ensinar aos alunos do IFBA os conceitos base do COBOL e suas funcionalidades através de um analisador de CPF.

Objetivo do programa:
- Inicialmente o programa IFBA3CPF - IFBA (Centro de Custo fictício), 3 (Código referente ao programa funcional), CPF (Complemento referente a aplicação do projeto),
  recebera via teclado dados de CPF para analisar o 9º digito e listar o seu estado correspondente.

    1: 'DF||GO||MT||MS||TO',
    2: 'AC||AM||AP||PA||RO||RR',
    3: 'CE||MA||PI',
    4: 'AL||PB||PE||RN',
    5: 'BA||SE',
    6: 'MG',
    7: 'ES||RJ',
    8: 'SP',
    9: PR||SC',
    0: 'RS'
  
- A segunda parte do Projeto consiste na implementação de transações com arquivos, onde será feita a leitura dos CFPs via txt e será gerado um arquivo de saída com as informações referentes a cada CPF.

  Exemplo de saída Ok:
  -  ** IFBA3CPF | O | CPF:999.999.999-99 CORRESPONDENTE AO(AOS) ESTADO(S) DE: PR||SC
  Exemplo de saída NOK:
*********************************************************************************
**                    ESTATISTICAS DE PROCESSAMENTO                            **
** --------------------------------------------------------------------------- **
**                         PROGRAMA IFBA3CPF                                   **
** -------- | --- | -------------------------------- | ----------------------- **
**  DDNAME  | I/O |     DESCRICAO DO PROGRAMA        |              ERRO       **
** -------- | --- | -------------------------------- | ----------------------- **
** IFBA3CPF |  O  | CODIGO DE RETORNO                |              08         **
** -------- | --- | -------------------------------- | ----------------------- **
** IFBA3CPF |  O  | CODIGO DO ERRO                   |              10         **
** -------- | --- | -------------------------------- | ----------------------- **
** IFBA3CPF |  O  | DESCRICAO MENSAGEM               |    DADOS INVALIDOS      **
** -------- | --- | -------------------------------- | ----------------------- **
**                         PROGRAMA IFBA3CPF                                   **
** --------------------------------------------------------------------------- **
**                    ESTATISTICAS DE PROCESSAMENTO                            **
*********************************************************************************
