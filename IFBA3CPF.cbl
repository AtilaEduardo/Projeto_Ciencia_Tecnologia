      *================================================================*
       IDENTIFICATION                  DIVISION.
      *================================================================*
       PROGRAM-ID. IFBA3CPF INITIAL.
       AUTHOR.     ATILA EDUARDO DA CRUZ SANTOS CARDOSO.
      *----------------------------------------------------------------*
      *    PROGRAMA............: IFBA3CPF                              *
      *    ANALISTA/PROGAMADOR: ATILA EDUARDO DA CRUZ SANTOS CARDOSO   *
      *    DATA..............: 09/2022                                 *
      *----------------------------------------------------------------*
      *    OBJETIVO....: EXEMPLO DE PROGRAMA COBOL                     *
      *================================================================*
      *                                                                *
      *----------------------------------------------------------------*
       ENVIRONMENT                     DIVISION.
      *----------------------------------------------------------------*
       CONFIGURATION                   SECTION.
      *----------------------------------------------------------------*
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       DATA                            DIVISION.
      *----------------------------------------------------------------*
      *
      *----------------------------------------------------------------*
       WORKING-STORAGE                 SECTION.
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       77  FILLER                      PIC X(055)          VALUE
           '* INICIO DA WORKING STORAGE SECTION IFBA3CPF *'.
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       77  FILLER                      PIC  X(050)         VALUE
           '* AREA PARA VARIAVEIS AUXILIARES *'.
      *----------------------------------------------------------------*
       77  WRK-UF-S                    PIC X(022)          VALUE SPACES.
       77  WRK-AUXILIAR                PIC 9(001)          VALUE ZEROS.
       01  WRK-AUX-DISPLAY             PIC ZZZ.ZZZ.Z99     VALUE SPACES.

       01  WRK-CCPF-FILIAL             PIC X(014)          VALUE SPACES.
       01  FILLER                   REDEFINES   WRK-CCPF-FILIAL.
           05  WRK-CCPF1               PIC 9(003).
           05  FILLER                  PIC X(001).
           05  WRK-CCPF2               PIC 9(003).
           05  FILLER                  PIC X(001).
           05  WRK-CCPF3               PIC 9(003).
           05  FILLER                  PIC X(001).
           05  WRK-FILIAL              PIC 9(002).
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       01  FILLER                      PIC  X(050)         VALUE
           '* AREA PARA TRATAMENTO DE ERRO *'.
      *----------------------------------------------------------------*
       77  WRK-COD-RETORNO             PIC 9(002) VALUE ZEROS.
       77  WRK-COD-ERRO                PIC 9(002) VALUE ZEROS.
       77  WRK-DES-MENSAGEM            PIC X(020) VALUE SPACES.

       01  WRK-MENSAGEM-ERRO.
           05 WRK-MSG01                PIC  X(020)         VALUE
           'DADOS INVALIDOS'.
      *----------------------------------------------------------------*
       77  FILLER                      PIC X(055)          VALUE
           '* FIM DA WORKING STORAGE SECTION IFBA3CPF *'.
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       PROCEDURE                       DIVISION.
      *----------------------------------------------------------------*
      *    ROTINA PRINCIPAL DO PROGRAMA.                               *
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       0000-PRINCIPAL                  SECTION.
      *----------------------------------------------------------------*
           PERFORM  1000-INICIALIZAR.
      *
           PERFORM  2000-PROCESSAR.
      *
           PERFORM  3000-FINALIZAR.
      *----------------------------------------------------------------*
       0000-99-FIM.                    EXIT.
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       1000-INICIALIZAR                  SECTION.
      *----------------------------------------------------------------*
           PERFORM  1100-CONSISTIR-DADOS-ENTRADA.
      *----------------------------------------------------------------*
       1000-99-FIM.                    EXIT.
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       1100-CONSISTIR-DADOS-ENTRADA    SECTION.
      *----------------------------------------------------------------*
           DISPLAY 'INFORME UM CPF (EX: 999.999.999-99): '
           ACCEPT WRK-CCPF-FILIAL

           IF  WRK-CCPF-FILIAL         EQUAL ZEROS OR
               WRK-CCPF-FILIAL         EQUAL SPACES
      *
               MOVE 08                 TO WRK-COD-RETORNO
               MOVE 0010               TO WRK-COD-ERRO
               MOVE WRK-MSG01          TO WRK-DES-MENSAGEM
      *
               PERFORM 1150-IMPRIMIR-ERRO
               PERFORM 3000-FINALIZAR
           END-IF.
      *----------------------------------------------------------------*
       1100-99-FIM.                    EXIT.
      *----------------------------------------------------------------*
      *
      *----------------------------------------------------------------*
       1150-IMPRIMIR-ERRO              SECTION.
      *----------------------------------------------------------------*
           DISPLAY
           '***********************************************************'
           '**********************'

           DISPLAY
           '**                    ESTATISTICAS DE PROCESSAMENTO        '
           '                    **'

           DISPLAY
           '** --------------------------------------------------------'
           '------------------- **'

           DISPLAY
           '**                         PROGRAMA IFBA3CPF               '
           '                    **'

           DISPLAY
           '** -------- | --- | -------------------------------- | ----'
           '------------------- **'

           DISPLAY
           '**  DDNAME  | I/O |     DESCRICAO DO PROGRAMA        |     '
           '         ERRO       **'

           DISPLAY
           '** -------- | --- | -------------------------------- | ----'
           '------------------- **'

           MOVE WRK-COD-RETORNO     TO WRK-AUX-DISPLAY
           DISPLAY
           '** IFBA3CPF |  O  | CODIGO DE RETORNO                |     '
           WRK-AUX-DISPLAY '         **'

           DISPLAY
           '** -------- | --- | -------------------------------- | ----'
           '------------------- **'

           MOVE WRK-COD-ERRO     TO WRK-AUX-DISPLAY
           DISPLAY
           '** IFBA3CPF |  O  | CODIGO DO ERRO                   |     '
           WRK-AUX-DISPLAY '         **'

           DISPLAY
           '** -------- | --- | -------------------------------- | ----'
           '------------------- **'

           DISPLAY
           '** IFBA3CPF |  O  | DESCRICAO MENSAGEM               |    '
           WRK-DES-MENSAGEM' **'

           DISPLAY
           '** -------- | --- | -------------------------------- | ----'
           '------------------- **'

           DISPLAY
           '**                         PROGRAMA IFBA3CPF               '
           '                    **'

           DISPLAY
           '** --------------------------------------------------------'
           '------------------- **'

           DISPLAY
           '**                    ESTATISTICAS DE PROCESSAMENTO        '
           '                    **'

           DISPLAY
           '***********************************************************'
           '**********************'
           .
      *----------------------------------------------------------------*
       1150-99-FIM.                    EXIT.
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       2000-PROCESSAR                  SECTION.
      *----------------------------------------------------------------*
           MOVE WRK-CCPF3(3:1)          TO WRK-AUXILIAR
      *
           EVALUATE WRK-AUXILIAR
             WHEN 1
               MOVE 'DF||GO||MT||MS||TO'
                                       TO WRK-UF-S
             WHEN 2
               MOVE 'AC||AM||AP||PA||RO||RR'
                                       TO WRK-UF-S
             WHEN 3
               MOVE 'CE||MA||PI'
                                       TO WRK-UF-S
             WHEN 4
               MOVE 'AL||PB||PE||RN'
                                       TO WRK-UF-S
             WHEN 5
               MOVE 'BA||SE'
                                       TO WRK-UF-S
             WHEN 6
               MOVE 'MG'
                                       TO WRK-UF-S
             WHEN 7
               MOVE 'ES||RJ'
                                       TO WRK-UF-S
             WHEN 8
               MOVE 'SP'
                                       TO WRK-UF-S
             WHEN 9
               MOVE 'PR||SC'
                                       TO WRK-UF-S
             WHEN OTHER
               MOVE  'RS'              TO WRK-UF-S
           END-EVALUATE.

           DISPLAY
           '** IFBA3CPF | O | CPF:' WRK-CCPF-FILIAL
           ' CORRESPONDENTE AO(AOS) ESTADO(S) DE: ' WRK-UF-S ' **'
           .
      *----------------------------------------------------------------*
       2000-99-FIM.                    EXIT.
      *----------------------------------------------------------------*
      *                                                                *
      *----------------------------------------------------------------*
       3000-FINALIZAR                  SECTION.
      *----------------------------------------------------------------*
           STOP RUN.
           END PROGRAM IFBA3CPF.
      *----------------------------------------------------------------*
