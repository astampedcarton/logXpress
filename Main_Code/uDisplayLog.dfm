object fmLogDisplay: TfmLogDisplay
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'SAS Log Add On'
  ClientHeight = 44
  ClientWidth = 1141
  Color = clWhite
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ParentBiDiMode = False
  PopupMode = pmAuto
  Position = poDefault
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    1141
    44)
  PixelsPerInch = 96
  TextHeight = 13
  object lbstats: TLabel
    Left = 957
    Top = 0
    Width = 333
    Height = 11
    Hint = 'Right click for menu options'
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'lbstats lbstats lbstats lbstats lbstats lbstats '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    WordWrap = True
    OnMouseMove = lbstatsMouseMove
    OnMouseUp = memEditorMouseUp
  end
  object lbWarn: TLabel
    Left = 109
    Top = 0
    Width = 48
    Height = 11
    Hint = 
      'These are things that needs to be checked and can cause problems' +
      '.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Warnings'
    Color = 13395456
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
    OnClick = lbWarnClick
    OnMouseUp = memEditorMouseUp
  end
  object lbCntWarn: TLabel
    Left = 155
    Top = 0
    Width = 32
    Height = 11
    Hint = 
      'These are things that needs to be checked and can cause problems' +
      '.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'lbCntWarn'
    Color = 13395456
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
    OnClick = lbWarnClick
    OnMouseUp = memEditorMouseUp
  end
  object lbInfo: TLabel
    Left = 188
    Top = 0
    Width = 21
    Height = 11
    Hint = 
      'If values changed after merge statements you might concider chec' +
      'king for problem here first.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Info'
    Color = 13395456
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
    OnClick = lbInfoClick
  end
  object lbCntInfo: TLabel
    Left = 209
    Top = 0
    Width = 27
    Height = 11
    Hint = 
      'If values changed after merge statements you might concider chec' +
      'king for problem here first.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'StaticText3'
    Color = 13395456
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
    OnClick = lbInfoClick
  end
  object lbConvNotes: TLabel
    Left = 237
    Top = 0
    Width = 56
    Height = 11
    Hint = 
      'Any conversions from Numeric to Character of Character to Numeri' +
      'c you might want to inspect.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Conversion'
    Color = 13395456
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
    OnClick = lbConvNotesClick
    OnMouseUp = memEditorMouseUp
  end
  object lbCntConvNotes: TLabel
    Left = 293
    Top = 0
    Width = 26
    Height = 11
    Hint = 
      'Any conversions from Numeric to Character of Character to Numeri' +
      'c you might want to inspect.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'StaticText3'
    Color = 13395456
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
    OnClick = lbConvNotesClick
    OnMouseUp = memEditorMouseUp
  end
  object lbError: TLabel
    Left = 321
    Top = 0
    Width = 34
    Height = 11
    Hint = 
      'These are things that will cause problems, they need to be sorte' +
      'd out, before you can continue.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Errors'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbErrorClick
    OnMouseUp = memEditorMouseUp
  end
  object lbCntErr: TLabel
    Left = 352
    Top = 0
    Width = 28
    Height = 11
    Hint = 
      'These are things that will cause problems, they need to be sorte' +
      'd out, before you can continue.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'StaticText3'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbErrorClick
    OnMouseUp = memEditorMouseUp
  end
  object lbMerge: TLabel
    Left = 381
    Top = 0
    Width = 32
    Height = 11
    Hint = 
      'With Derived datasets you need to sort these errors out first. Y' +
      'ou might encounter invalid data.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Merge'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbMergeClick
    OnMouseUp = memEditorMouseUp
  end
  object lbCntMerge: TLabel
    Left = 413
    Top = 0
    Width = 28
    Height = 11
    Hint = 
      'With Derived datasets you need to sort these errors out first. Y' +
      'ou might encounter invalid data.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'StaticText3'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbMergeClick
    OnMouseUp = memEditorMouseUp
  end
  object lbInvalid: TLabel
    Left = 442
    Top = 0
    Width = 35
    Height = 11
    Hint = 
      'With certain function a parameter may be invalid. You will need ' +
      'to check these'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Invalid'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbInvalidClick
    OnMouseUp = memEditorMouseUp
  end
  object lbcntInvalid: TLabel
    Left = 477
    Top = 0
    Width = 27
    Height = 11
    Hint = 
      'With certain function a parameter may be invalid. You will need ' +
      'to check these'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'StaticText3'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbInvalidClick
    OnMouseUp = memEditorMouseUp
  end
  object lbDivs: TLabel
    Left = 505
    Top = 0
    Width = 41
    Height = 11
    Hint = 'Any divisions by zero needs to be clarified.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Division'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbDivsClick
    OnMouseUp = memEditorMouseUp
  end
  object lbDivzero: TLabel
    Left = 546
    Top = 0
    Width = 28
    Height = 11
    Hint = 'Any divisions by zero needs to be clarified.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'StaticText3'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbDivsClick
    OnMouseUp = memEditorMouseUp
  end
  object lbuninit: TLabel
    Left = 575
    Top = 0
    Width = 35
    Height = 11
    Hint = 
      'Uninitialized notes can indicate on variables that doesn'#39't exist' +
      ' in the dataset. You will have to check these entries.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Uninit.'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbuninitClick
    OnMouseUp = memEditorMouseUp
  end
  object lbuninitcnt: TLabel
    Left = 609
    Top = 0
    Width = 27
    Height = 11
    Hint = 
      'Uninitialized notes can indicate on variables that doesn'#39't exist' +
      ' in the dataset. You will have to check these entries.'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'StaticText3'
    Color = 12076945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbuninitClick
    OnMouseUp = memEditorMouseUp
  end
  object lbNotes: TLabel
    Left = 45
    Top = 0
    Width = 29
    Height = 11
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Notes'
    Color = 13395456
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    GlowSize = 5
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
    OnClick = lbNotesClick
    OnMouseUp = memEditorMouseUp
  end
  object lbcntnote: TLabel
    Left = 73
    Top = 0
    Width = 35
    Height = 11
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'lbNotes'
    Color = 13395456
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    GlowSize = 5
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
    OnClick = lbNotesClick
    OnMouseUp = memEditorMouseUp
  end
  object lbCustom: TLabel
    Left = 707
    Top = 0
    Width = 41
    Height = 11
    Hint = 'Custom defined notes'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Custom'
    Color = 8404992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbCustomClick
    OnMouseUp = memEditorMouseUp
  end
  object lbCustcnt: TLabel
    Left = 747
    Top = 0
    Width = 27
    Height = 11
    Hint = 'Custom defined notes'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'StaticText3'
    Color = 8404992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbCustomClick
    OnMouseUp = memEditorMouseUp
  end
  object lbOtherlb: TLabel
    Left = 639
    Top = 0
    Width = 41
    Height = 11
    Hint = 'All other notes'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Other'
    Color = 8404992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbOtherlbClick
    OnMouseUp = memEditorMouseUp
  end
  object lbAlloth: TLabel
    Left = 679
    Top = 0
    Width = 27
    Height = 11
    Hint = 'All other notes'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'lbAlloth'
    Color = 8404992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lbAllothClick
    OnMouseUp = memEditorMouseUp
  end
  object spbMenu: TSpeedButton
    Left = 2
    Top = 0
    Width = 42
    Height = 11
    Caption = 'Menu'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 12
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    OnClick = btnMenuClick
  end
  object lblastdd: TLabel
    Left = 778
    Top = 0
    Width = 171
    Height = 11
    Hint = 'Custom defined notes'
    AutoSize = False
    BiDiMode = bdLeftToRight
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
    OnClick = lblastddClick
    OnMouseUp = memEditorMouseUp
  end
  object pnloff: TPanel
    Left = 955
    Top = 17
    Width = 11
    Height = 11
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    Color = clRed
    TabOrder = 0
    Visible = False
  end
  object pnlOn: TPanel
    Left = 990
    Top = 0
    Width = 11
    Height = 11
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    Color = clLime
    TabOrder = 1
  end
  object pnlIndicate: TPanel
    Left = 955
    Top = 0
    Width = 11
    Height = 11
    Hint = 'Indicates that there is something that requires your attention.'
    BevelOuter = bvNone
    Color = 136
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = False
  end
  object pgBar: TProgressBar
    Left = 955
    Top = 0
    Width = 171
    Height = 10
    BarColor = 12937777
    TabOrder = 3
    Visible = False
  end
  object ppMenu: TPopupMenu
    Left = 175
    Top = 12
    object mnuAlwaysonTop1: TMenuItem
      Caption = 'Always on Top'
      Visible = False
      OnClick = mnuAlwaysonTop1Click
    end
    object StopReading1: TMenuItem
      Caption = 'Stop Reading'
      OnClick = StopReading1Click
    end
    object Minimize1: TMenuItem
      Caption = 'Minimize'
      OnClick = Minimize1Click
    end
    object Restore1: TMenuItem
      Caption = 'Restore'
      Visible = False
      OnClick = Restore1Click
    end
    object mnuColorsOff: TMenuItem
      Caption = 'Colors off'
      Visible = False
      OnClick = mnuColorsOffClick
    end
    object ApplyFormattoLogFile: TMenuItem
      Caption = 'Apply Format to Log File'
      Visible = False
      OnClick = ApplyFormattoLogFileClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ReadFileFromLocation1: TMenuItem
      Caption = 'Read File From Location...'
      OnClick = ReadFileFromLocation1Click
    end
    object CreateRules2: TMenuItem
      Caption = 'Create Rules'
      Visible = False
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mnuForceReadofLogFile: TMenuItem
      Caption = 'Force Read of Log File'
      OnClick = mnuForceReadofLogFileClick
    end
    object mnuActive: TMenuItem
      Caption = 'Activate for Reading'
      Enabled = False
      Visible = False
      OnClick = mnuActiveClick
    end
    object DeactivateforReading: TMenuItem
      Caption = 'Deactivate for Reading'
      Visible = False
      OnClick = DeactivateforReadingClick
    end
    object ClearCounters1: TMenuItem
      Caption = 'Clear Counters'
      OnClick = ClearCounters1Click
    end
    object mnuReportOnly1: TMenuItem
      Caption = 'Report Only'
      Visible = False
      OnClick = mnuReportOnly1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object About1: TMenuItem
      Caption = 'About...'
      OnClick = About1Click
    end
    object Release1: TMenuItem
      Caption = 'Release'
      OnClick = ReleaseNotes1Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object Close1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 227
    Top = 12
  end
  object ppMainMenu: TPopupMenu
    Left = 142
    Top = 12
    object AlternativeMenu1: TMenuItem
      Caption = 'Alternative View'
      OnClick = AlternativeMenu1Click
    end
    object ChangeDefaultView1: TMenuItem
      Caption = 'Change Default View'
      OnClick = ChangeDefaultView1Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object ReadFileFromLocation2: TMenuItem
      Caption = 'Read File From Location...'
      OnClick = ReadFileFromLocation1Click
    end
    object ForceReadofLogFile1: TMenuItem
      Caption = 'Force Read of Log File'
      OnClick = mnuForceReadofLogFileClick
    end
    object ClearCounters2: TMenuItem
      Caption = 'Clear Counters'
      OnClick = ClearCounters1Click
    end
    object mnuCountOnly: TMenuItem
      Caption = 'Count Only'
      Visible = False
      OnClick = mnuCountOnlyClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object CreateRules1: TMenuItem
      Caption = 'Create Rules'
      Visible = False
    end
    object DeleteLogFolderHistory1: TMenuItem
      Caption = 'Delete Log Folder History'
      Visible = False
      OnClick = DeleteLogFolderHistory1Click
    end
    object mnuQuickNote: TMenuItem
      Caption = 'Quick Note'
      Visible = False
      OnClick = mnuQuickNoteClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Logfile1: TMenuItem
      Caption = 'Log file'
      OnClick = Logfile1Click
    end
    object mnuReadLogFolder: TMenuItem
      Caption = 'Read Log Folder'
      OnClick = mnuReadLogFolderClick
    end
    object mnuLogDetails: TMenuItem
      Caption = 'Log Details'
      Visible = False
    end
    object mnuTimingDetails: TMenuItem
      Caption = 'Timing Details'
      Visible = False
    end
    object mnuHideDetails: TMenuItem
      Caption = 'Hide Details'
      Visible = False
      OnClick = mnuHideDetailsClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuOptions: TMenuItem
      Caption = 'Options'
      OnClick = mnuOptionsClick
    end
    object ReleaseNotes1: TMenuItem
      Caption = 'Release Notes'
      OnClick = ReleaseNotes1Click
    end
    object About2: TMenuItem
      Caption = 'About...'
      OnClick = About2Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object mnuClose: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
  object trayIcon: TTrayIcon
    Animate = True
    BalloonHint = 'Right click for menu options'
    BalloonTitle = 'SAS Log Add on'
    BalloonFlags = bfInfo
    PopupMenu = ppMenu
    Visible = True
    OnClick = trayIconClick
    OnDblClick = trayIconDblClick
    OnMouseUp = trayIconMouseUp
    Left = 40
    Top = 12
  end
  object Timer2: TTimer
    Interval = 100
    OnTimer = Timer2Timer
    Left = 258
    Top = 12
  end
  object XPManifest1: TXPManifest
    Left = 160
    Top = 288
  end
end
