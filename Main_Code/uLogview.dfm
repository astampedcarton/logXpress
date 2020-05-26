object fmlogview: Tfmlogview
  Left = 0
  Top = 0
  ClientHeight = 500
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rcLines1: TRichEdit
    Left = 0
    Top = 0
    Width = 975
    Height = 441
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'rcLines')
    ParentFont = False
    TabOrder = 0
  end
  object stinfo: TStatusBar
    Left = 0
    Top = 481
    Width = 975
    Height = 19
    Panels = <>
    ExplicitLeft = 8
    ExplicitTop = 489
  end
  object rcLoglines1: TRichEdit
    Left = 0
    Top = 0
    Width = 975
    Height = 441
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'rcLoglines')
    ParentFont = False
    TabOrder = 1
  end
  object rclogLines: TAdvMemo
    Left = 0
    Top = 0
    Width = 975
    Height = 441
    Cursor = crIBeam
    AcceptFiles = True
    ActiveLineSettings.ShowActiveLine = True
    ActiveLineSettings.ShowActiveLineIndicator = False
    ActiveLineSettings.ActiveLineAtCursor = True
    Align = alClient
    AutoCompletion.Font.Charset = DEFAULT_CHARSET
    AutoCompletion.Font.Color = clWindowText
    AutoCompletion.Font.Height = -11
    AutoCompletion.Font.Name = 'Tahoma'
    AutoCompletion.Font.Style = []
    AutoCorrect.Active = True
    AutoHintParameterPosition = hpBelowCode
    BorderStyle = bsSingle
    CodeFolding.Enabled = True
    CodeFolding.LineColor = clGray
    Ctl3D = False
    DelErase = True
    EnhancedHomeKey = True
    Gutter.DigitCount = 7
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.BorderColor = clNavy
    Gutter.GutterWidth = 50
    Gutter.GutterMargin = 55
    Gutter.GutterColor = clWhite
    Gutter.GutterColorTo = 8404992
    Gutter.ShowModified = True
    Gutter.ShowLeadingZeros = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -10
    Font.Name = 'Courier New'
    Font.Style = []
    HiddenCaret = False
    HideSelection = False
    Lines.Strings = (
      '')
    MarkerList.UseDefaultMarkerImageIndex = False
    MarkerList.DefaultMarkerImageIndex = -1
    MarkerList.ImageTransparentColor = 33554432
    PrintOptions.MarginLeft = 0
    PrintOptions.MarginRight = 0
    PrintOptions.MarginTop = 0
    PrintOptions.MarginBottom = 0
    PrintOptions.PageNr = False
    PrintOptions.PrintLineNumbers = False
    RightMarginColor = 14869218
    ScrollHint = False
    SelColor = clWhite
    SelBkColor = clNavy
    ShowRightMargin = True
    SmartTabs = False
    SyntaxStyles = AdvBasicMemoStyler1
    TabOrder = 3
    TabSize = 4
    TabStop = True
    TrimTrailingSpaces = False
    UndoLimit = 100
    UrlStyle.TextColor = clBlue
    UrlStyle.BkColor = clWhite
    UrlStyle.Style = [fsUnderline]
    UseStyler = True
    Version = '2.2.5.1'
    WordWrap = wwNone
  end
  object pnlProgress: TPanel
    Left = 0
    Top = 441
    Width = 975
    Height = 40
    Align = alBottom
    Color = clWhite
    TabOrder = 4
    ExplicitTop = 460
    object spbGoline: TSpeedButton
      Left = 312
      Top = 6
      Width = 86
      Height = 23
      AllowAllUp = True
      Caption = 'Go to Line'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2000007F3F003F00
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50505060606060606060606060
        6060606060503030DF3F00FFBF007F0000606060606060000000FFFFFFFFFFFF
        FFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFDFBFBFDF3F00FFBF00BF00007F7F
        7FFFFFFFDFDFDF000000FFFFFFFFFFFFFFFFFFBFBFBFFFFFFFDFDFDFDFDFDFCF
        AFAFDF3F00FFBF00BF0000707070EFEFEFFFFFFFDFDFDF000000FFFFFFFFFFFF
        FFFFFFBFBFBFFFFFFFDFDFDFCFCFCFDF3F00FFBF00BF0000707070DFDFDFEFEF
        EFFFFFFFDFDFDF000000FFFFFFFFFFFF0000005F5F5F7F7F7F9F9F9FBFBFBFCF
        CF8FBF0000707070DFDFDFDFDFDFEFEFEFFFFFFFDFDFDF000000FFFFFF505050
        8F8F30AFAF30AFAF307F7F00505030606060707070DFDFDFDFDFDFDFDFDFEFEF
        EFFFFFFFDFDFDF000000404040EFEF6FDFDF9FDFDF60BFBF80AFAF709F9F0040
        4040DFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFDFDFDF000000BFBF7FFFFF7F
        DFDF9FDFDF60BFBF80AFAF70AFAF70404000AFAFAFDFDFDFDFDFDFDFDFDFEFEF
        EFFFFFFFDFDFDF000000BFBF7FFFFF7FDFDFDFDFDF60BFBF80AFAF70AFAF7040
        4000AFAFAFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFDFDFDF0000007F7F40FFFF7F
        DFDFDFDFDF60DFDF60DFDF60DFDF60404020CFCFCFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFDFDFDF000000202020DFDF9FDFDF9FFFFF7FDFDF60DFDF6070703070
        7070DFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF000000FFFFFF202020
        707070BFBF7FBFBF7F5F5F5F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF7F7F
        7F6F6F6F202020000000FFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFBFBFBFEFEFEF707070000000FFFFFFFFFFFFFFFFFF
        FFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF7070
        70000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBF9F9F9F000000FFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object lb1: TLabel
      Left = 124
      Top = 6
      Width = 35
      Height = 12
      Caption = 'Line &Nr'
      FocusControl = edLine
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlowSize = 20
      ParentFont = False
    end
    object edLine: TEdit
      Left = 165
      Top = 6
      Width = 52
      Height = 20
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Arial'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnKeyUp = edLineKeyUp
    end
    object pgBar: TProgressBar
      Left = 420
      Top = 6
      Width = 86
      Height = 17
      TabOrder = 1
      Visible = False
    end
    object chkLineson: TCheckBox
      Left = 569
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Lines Enabled'
      TabOrder = 2
      Visible = False
    end
    object bbFind: TrkGlassButton
      Left = 8
      Top = 6
      Width = 97
      Height = 27
      AltFocus = False
      AltRender = False
      Caption = '&Find'
      Color = 16744448
      ColorDown = 16744448
      ColorFocused = clNavy
      ColorFrame = 16744448
      ColorDisabled = 16744448
      DropDownAlignment = paLeft
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glossy = True
      GlossyLevel = 37
      ImageIdx = 0
      ImageOffset = 5
      LightHeight = 27
      TabOrder = 3
      TextAlign = taCenter
      OnClick = spbFind1Click
      SingleBorder = True
    end
    object bbClose: TrkGlassButton
      Left = 863
      Top = 6
      Width = 97
      Height = 27
      AltFocus = False
      AltRender = False
      Caption = '&Close'
      Color = 16744448
      ColorDown = 16744448
      ColorFocused = clNavy
      ColorFrame = 16744448
      ColorDisabled = 16744448
      DropDownAlignment = paLeft
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glossy = True
      GlossyLevel = 37
      ImageIdx = 1
      ImageOffset = 5
      LightHeight = 27
      TabOrder = 4
      TextAlign = taCenter
      OnClick = bbCloseClick
      SingleBorder = True
    end
  end
  object ppMenu: TPopupMenu
    Left = 168
    Top = 160
    object Find1: TMenuItem
      Caption = 'Find'
      ShortCut = 16454
    end
  end
  object FindDialog: TFindDialog
    OnFind = FindDialogFind
    Left = 200
    Top = 160
  end
  object AdvBasicMemoStyler1: TAdvBasicMemoStyler
    BlockStart = 'data'#13#10'%macro'#13#10'proc'#13#10
    BlockEnd = 'run;'#13#10'quit;'#13#10'%mend;'
    LineComment = '*'
    MultiCommentLeft = '/*'
    MultiCommentRight = '*/'
    CommentStyle.TextColor = clNavy
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clFuchsia
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          'alias'
          'all'
          'and'
          'as'
          'attach'
          'auto'
          'autox'
          'call'
          'case'
          'cfunction'
          'clear'
          'dcomplex'
          'dec'
          'declare'
          'default'
          'dim'
          'do'
          'double'
          'each'
          'else'
          'elseif'
          'end'
          'endif'
          'error'
          'exit'
          'explicit'
          'export'
          'external'
          'false'
          'finally'
          'for'
          'for next'
          'funcaddr'
          'function'
          'giant'
          'goaddr'
          'gosub'
          'goto'
          'if'
          'iff'
          'ift'
          'ifz'
          'import'
          'in'
          'inc'
          'internal'
          'is'
          'librarys'
          'loop'
          'mod'
          'module'
          'new'
          'next'
          'not'
          'nothing'
          'off'
          'on'
          'option'
          'or'
          'print'
          'program'
          'protected'
          'public'
          'quit'
          'read'
          'redim'
          'return'
          'sbyte'
          'scomplex'
          'select'
          'sfunction'
          'shared'
          'shared'
          'single'
          'slong'
          'sshort'
          'static'
          'step'
          'stop'
          'string'
          'sub'
          'subaddr'
          'swap'
          'then'
          'to'
          'true'
          'try'
          'type'
          'typeof'
          'ubyte'
          'ulong'
          'union'
          'until'
          'ushort'
          'version'
          'void'
          'when'
          'while'
          'write'
          'xlong'
          'xor')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'Basic Standard Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Info = 'Simple Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = '"'
        BracketEnd = '"'
        Info = 'Double Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' ,;:.(){}[]=-*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end
      item
        KeyWords.Strings = (
          'note')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clNavy
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'NOTE'
      end
      item
        KeyWords.Strings = (
          'error')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clMaroon
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'ERROR'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clGreen
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'WARNING'
      end
      item
        KeyWords.Strings = (
          'info')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clYellow
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'INFO'
      end
      item
        KeyWords.Strings = (
          'data'
          'data'
          'merge'
          'merge'
          'nobs'
          'nobs'
          'set'
          'set')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'General'
      end>
    HexIdentifier = '0x'
    AutoCompletion.Strings = (
      'ShowMessage'
      'MessageDlg')
    HintParameter.TextColor = clBlack
    HintParameter.BkColor = clInfoBk
    HintParameter.HintCharStart = '('
    HintParameter.HintCharEnd = ')'
    HintParameter.HintCharDelimiter = ';'
    HintParameter.HintCharWriteDelimiter = ','
    HintParameter.Parameters.Strings = (
      'ShowMessage(string Msg)'
      
        'MessageDlg(string Msg; TMsgDlgType DlgType; TMsgDlgButtons Butto' +
        'ns; LongInt: HelpCtx)')
    Description = 'SAS'
    Filter = 'SAS Program Files (*.sas)|*.sas'
    DefaultExtension = '.sas'
    StylerName = 'SAS'
    Extensions = 'sas'
    Left = 352
    Top = 216
  end
  object AdvMemoStylerManager1: TAdvMemoStylerManager
    Items = <>
    Left = 360
    Top = 272
  end
end
