object FormClienteCadastro: TFormClienteCadastro
  Left = 613
  Top = 262
  Caption = 'Cadastro de Clientes'
  ClientHeight = 500
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object ListBox1: TListBox
    Left = 0
    Top = 280
    Width = 800
    Height = 220
    Align = alBottom
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
    ExplicitTop = 272
    ExplicitWidth = 798
  end
  object Panel2: TPanel
    Left = 0
    Top = 70
    Width = 800
    Height = 210
    Align = alClient
    TabOrder = 1
    ExplicitTop = 0
    ExplicitWidth = 798
    ExplicitHeight = 272
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ:'
    end
    object Label3: TLabel
      Left = 24
      Top = 104
      Width = 46
      Height = 13
      Caption = 'Telefone:'
    end
    object Label4: TLabel
      Left = 24
      Top = 144
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object edtNome: TEdit
      Left = 96
      Top = 21
      Width = 400
      Height = 21
      TabOrder = 0
    end
    object edtCPFCNPJ: TEdit
      Left = 96
      Top = 61
      Width = 200
      Height = 21
      TabOrder = 1
    end
    object edtTelefone: TEdit
      Left = 96
      Top = 101
      Width = 200
      Height = 21
      TabOrder = 2
    end
    object edtEmail: TEdit
      Left = 96
      Top = 141
      Width = 400
      Height = 21
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 70
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitWidth = 798
    object btnNovo: TButton
      Left = 16
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 97
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 178
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
end
