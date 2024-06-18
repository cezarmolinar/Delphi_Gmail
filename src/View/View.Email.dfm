object ViewEmail: TViewEmail
  Left = 0
  Top = 0
  Caption = 'Envio de email - Padr'#227'o'
  ClientHeight = 579
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object btnEnviar: TButton
    Left = 259
    Top = 546
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 0
    OnClick = btnEnviarClick
  end
  object btnSair: TButton
    Left = 340
    Top = 546
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Sair'
    TabOrder = 1
    OnClick = btnSairClick
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 428
    Height = 150
    Align = alTop
    Caption = '     Conta Gmail     '
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    ExplicitWidth = 498
    object Label5: TLabel
      Left = 16
      Top = 15
      Width = 29
      Height = 13
      Caption = 'Conta'
    end
    object Label7: TLabel
      Left = 16
      Top = 55
      Width = 72
      Height = 13
      Caption = 'Nome da conta'
    end
    object Label6: TLabel
      Left = 16
      Top = 100
      Width = 51
      Height = 13
      Caption = 'Chave API'
    end
    object EdtConta: TEdit
      Left = 16
      Top = 30
      Width = 400
      Height = 21
      TabOrder = 0
      Text = 'remetente@gmail.com'
    end
    object EdtContaNome: TEdit
      Left = 16
      Top = 73
      Width = 400
      Height = 21
      TabOrder = 1
      Text = 'Nome da conta'
    end
    object EdtChaveAPI: TEdit
      Left = 16
      Top = 115
      Width = 400
      Height = 21
      TabOrder = 2
      Text = 'chave API'
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 176
    Width = 428
    Height = 347
    Margins.Top = 20
    Align = alTop
    Caption = '     Mensagem     '
    Color = clSkyBlue
    Ctl3D = True
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 3
    ExplicitWidth = 498
    object Label1: TLabel
      Left = 16
      Top = 62
      Width = 58
      Height = 13
      Caption = 'Destinat'#225'rio'
    end
    object Label2: TLabel
      Left = 16
      Top = 107
      Width = 39
      Height = 13
      Caption = 'Assunto'
    end
    object Label3: TLabel
      Left = 16
      Top = 151
      Width = 51
      Height = 13
      Caption = 'Mensagem'
    end
    object Label4: TLabel
      Left = 16
      Top = 288
      Width = 70
      Height = 13
      Caption = 'Arquivo anexo'
    end
    object Label8: TLabel
      Left = 16
      Top = 20
      Width = 77
      Height = 13
      Caption = 'Responder para'
    end
    object edtDestinatario: TEdit
      Left = 16
      Top = 77
      Width = 400
      Height = 21
      TabOrder = 0
      Text = 'destinat'#225'rio@hotmail.com'
    end
    object edtAssunto: TEdit
      Left = 16
      Top = 122
      Width = 400
      Height = 21
      TabOrder = 1
      Text = 'T'#237'tulo do email'
    end
    object memMensagem: TMemo
      Left = 16
      Top = 165
      Width = 400
      Height = 116
      Lines.Strings = (
        '<body><font color=#ff0000><strong>Teste</strong></font> '
        'formatado</body>')
      TabOrder = 2
    end
    object edtArquivoAnexo: TEdit
      Left = 16
      Top = 307
      Width = 400
      Height = 21
      TabOrder = 3
      Text = 'C:\Users\cezar\Desktop\fontex.pdf'
    end
    object EdtResponder: TEdit
      Left = 16
      Top = 35
      Width = 400
      Height = 21
      TabOrder = 4
      Text = 'responder@hotmail.com'
    end
  end
end
