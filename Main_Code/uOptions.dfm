object fmOptions: TfmOptions
  Left = 0
  Top = 0
  Caption = 'Options'
  ClientHeight = 266
  ClientWidth = 577
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 585
  Constraints.MinHeight = 300
  Constraints.MinWidth = 585
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 201
    Height = 225
    Align = alLeft
    Caption = 'Options'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 89
      Width = 132
      Height = 14
      Caption = 'Log Reading Operations'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 148
      Width = 43
      Height = 14
      Caption = 'General'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object ckColorOn: TCheckBox
      Left = 26
      Top = 108
      Width = 97
      Height = 17
      Caption = 'Color On'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = ckColorOnEnter
    end
    object ckReportOnly: TCheckBox
      Left = 26
      Top = 123
      Width = 97
      Height = 17
      Caption = 'Report Only'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = ckReportOnlyEnter
    end
    object ckClearFolHistory: TCheckBox
      Left = 26
      Top = 183
      Width = 169
      Height = 17
      Caption = 'Clear Folder Read on Exit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnEnter = ckClearFolHistoryEnter
    end
    object ckReadonStartup: TCheckBox
      Left = 26
      Top = 168
      Width = 114
      Height = 17
      Caption = 'Read On Startup'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnEnter = ckReadonStartupEnter
    end
    object RadioGroup1: TRadioGroup
      Left = 10
      Top = 18
      Width = 185
      Height = 65
      Caption = 'Menu Display Option'
      TabOrder = 4
    end
    object rbClassic: TRadioButton
      Left = 26
      Top = 39
      Width = 113
      Height = 17
      Caption = 'Classic Menu'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = rbClassicClick
      OnEnter = rbClassicEnter
    end
    object rbAlternative: TRadioButton
      Left = 26
      Top = 56
      Width = 113
      Height = 17
      Caption = 'Alternative Menu'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnEnter = rbAlternativeEnter
    end
    object ckClearFileHist: TCheckBox
      Left = 26
      Top = 199
      Width = 169
      Height = 17
      Caption = 'Clear File History on Exit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Visible = False
      OnEnter = ckClearFileHistEnter
    end
  end
  object GroupBox2: TGroupBox
    Left = 201
    Top = 0
    Width = 376
    Height = 225
    Align = alClient
    Caption = 'Option Details Description'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      376
      225)
    object Label4: TLabel
      Left = 6
      Top = 18
      Width = 85
      Height = 14
      Caption = 'Full Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object memFulldesc: TMemo
      Left = 6
      Top = 38
      Width = 362
      Height = 181
      Anchors = [akLeft, akTop, akRight, akBottom]
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'Memo2')
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 225
    Width = 577
    Height = 41
    Align = alBottom
    TabOrder = 2
    object bbClose: TBitBtn
      Left = 449
      Top = 6
      Width = 115
      Height = 25
      Caption = 'Close'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000000000000000000000000000000000007F7FFFFFFFFF
        BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF7F7FFF7F7FFF7F7FFF0000FFBFBFFF7F7FFFBF7F7F80000080000080000080
        00008000008000008000000000FF7F7FFF0000FF7F7FFF7F7FFF0000FF3F3FFF
        BFBFFFBF7F7F8000008000008000008000008000008000008000000000FF7F7F
        FF0000FF0000FFFFFFFF3F3FFF7F7FFF7F7FFFBF7F7F80000080000080000080
        00008000008000008000000000FF7F7FFF0000FFFFFFFFFFFFFF3F3FFF7F7FFF
        7F7FFFBF7F7F8000008000008000008000008000008000008000000000FF7F7F
        FF0000FF7F7FFF7F7FFF7F7FFF7F7FFFBFBFFFBF7F7F80000080000080000080
        00008000008000008000000000FF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF
        BFBFFFBF7F7F8000008000008000008000008000008000008000000000FF7F7F
        FF7F7FFF7F7FFFFFFFFF3F3FFF7F7FFF7F7FFFBF7F7F80000080000080000080
        0000800000603F3F603F3F0000FF7F7FFF7F7FFF7F7FFFFFFFFF7F7FFFFFFFFF
        7F7FFFBF7F7F800000800000800000800000800000603F3F603F3F0000FF7F7F
        FF7F7FFF7F7FFFFFFFFF3F3FFF7F7FFF7F7FFFBF7F7F80000080000080000080
        00008000008000008000000000FF7F7FFF7F7FFF7F7FFFFFFFFF7F7FFF7F7FFF
        BFBFFFBF7F7F800000407F7F407F7F407F7F407F7F603F3F8000000000FF7F7F
        FFBFBFFFBFBFFFFFFFFF7F7FFF7F7FFFBFBFFFBF7F7F80000000FFFF00FFFF00
        FFFF00FFFF407F7F8000000000FF7F7FFFFFFFFFFFFFFFFFFFFF7F7FFF3F3FFF
        7F7FFFBF7F7F800000407F7F407F7F407F7F407F7F603F3F8000000000FF7F7F
        FF7F7FFF7F7FFFFFFFFF7F7FFF3F3FFF7F7FFFBF7F7F80000080000080000080
        00008000008000008000000000FF7F7FFF7F7FFF7F7FFFFFFFFF7F7FFFFFFFFF
        FFFFFF9F7FBF40007F40007F40007F40007F40007F40007F40007F0000FF7F7F
        FF7F7FFF7F7FFFFFFFFF0000FF0000FF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF0000FF0000FF7F7FFF}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = bbCloseClick
    end
    object bbSave: TBitBtn
      Left = 328
      Top = 6
      Width = 115
      Height = 25
      Caption = 'Save && Close'
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF003232320032323200323232003232320032323200323232003232
        3200323232003232320032323200FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF003232320086868600B6B6B600C2C2C200CECECE00CECECE00CECECE00CECE
        CE00CECECE00DADADA0032323200FF00FF00FF00FF00FF00FF00FF00FF003232
        3200F2F2F2004A4A4A00B6B6B600E6E6E600DADADA00DADADA00DADADA00E6E6
        E600E6E6E600CECECE0032323200FF00FF00FF00FF00FF00FF00323232008686
        86004A4A4A0062626200E6E6E600E6E6E600CECECE00DADADA00DADADA00DADA
        DA00E6E6E600CECECE0032323200FF00FF00FF00FF00FF00FF0032323200CECE
        CE00CECECE00CECECE00CECECE00E6E6E600DADADA00CECECE00DADADA00DADA
        DA00DADADA00DADADA0032323200FF00FF00FF00FF00FF00FF0032323200CECE
        CE00CECECE00CECECE00CECECE00CECECE00CECECE00DADADA00CECECE00CECE
        CE00DADADA00DADADA0032323200FF00FF00FF00FF00FF00FF0032323200E6E6
        E600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00DADA
        DA00CECECE00DADADA0032323200FF00FF00FF00FF00FF00FF0032323200E6E6
        E600C2C2C200CECECE00C2C2C200CECECE00CECECE00C2C2C200C2C2C200C2C2
        C200C2C2C200C2C2C20050320000FF00FF00FF00FF00FF00FF0032323200E6E6
        E600CECECE00C2C2C200CECECE00CECECE00C2C2C200C2C2C200AAAAAA00AAAA
        AA00AAAAAA00AAAAAA005032000050320000FF00FF00FF00FF0032323200E6E6
        E600B6B6B600CECECE00AAAAAA009E9E9E00AAAAAA007A7A7A00AAAAAA005032
        0000734A0000734A000096620000B97A000050320000FF00FF0032323200F2F2
        F200B6B6B6006E6E6E00AAAAAA0056565600AAAAAA001A1A1A00AAAAAA005032
        0000DC920000DC920000DC920000DC920000B97A00005032000032323200F2F2
        F200C2C2C20092929200C2C2C2007A7A7A00C2C2C2004A4A4A00AAAAAA005032
        0000FFAA0000FFAA0000DC920000DC920000FFAA00005032000032323200F2F2
        F200B6B6B600C2C2C200C2C2C2009E9E9E00C2C2C2007A7A7A00CECECE005032
        00005032000050320000B97A0000FFAA000050320000FF00FF0032323200F2F2
        F200B6B6B600B6B6B600C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200CECE
        CE00CECECE00DADADA005032000050320000FF00FF00FF00FF0032323200F2F2
        F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200E6E6E600E6E6
        E600E6E6E600E6E6E60050320000FF00FF00FF00FF00FF00FF00323232003232
        3200323232003232320032323200323232003232320032323200323232003232
        3200323232003232320032323200FF00FF00FF00FF00FF00FF00}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = bbSaveClick
    end
  end
end
