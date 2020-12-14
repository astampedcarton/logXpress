object fmLogFolder: TfmLogFolder
  Left = 36
  Top = 85
  Caption = 'Log Folders'
  ClientHeight = 737
  ClientWidth = 1174
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Enabled = True
  OldCreateOrder = False
  Position = poDesigned
  ScreenSnap = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 24
    Top = 30
    Width = 52
    Height = 14
    Caption = 'File Mask'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbFInfo: TStatusBar
    Left = 0
    Top = 720
    Width = 1174
    Height = 17
    Panels = <
      item
        Width = 900
      end
      item
        Width = 200
      end>
  end
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 1174
    Height = 720
    Align = alClient
    Caption = 'pnlBase'
    TabOrder = 1
    DesignSize = (
      1174
      720)
    object Panel3: TPanel
      Left = 40
      Top = 1
      Width = 1131
      Height = 198
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        1131
        198)
      object Label6: TLabel
        Left = 3
        Top = 3
        Width = 721
        Height = 14
        Caption = 
          'Add File locations that you want to read the log files from. Eit' +
          'her Copy and paste them  into the Grid, or Use the Add Directory' +
          ' button.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object sgLocations: TStringGrid
        Left = 3
        Top = 20
        Width = 935
        Height = 176
        Hint = 
          'Click Add Row to well Add a new row.'#13#10'Click Clear Row to Clear t' +
          'he Selected Row.'
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 1
        DefaultColWidth = 850
        DefaultRowHeight = 20
        DoubleBuffered = True
        FixedColor = clGradientInactiveCaption
        FixedCols = 0
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        OnClick = sgLocationsClick
        OnDblClick = sgLocationsDblClick
        OnKeyUp = sgLocationsKeyUp
        OnMouseUp = sgLocationsMouseUp
        OnSelectCell = sgLocationsSelectCell
        ColWidths = (
          850)
        RowHeights = (
          20
          20)
      end
    end
    object Panel4: TPanel
      Left = 44
      Top = 199
      Width = 182
      Height = 517
      Anchors = [akLeft, akTop, akBottom]
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object grp3: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 177
        Height = 509
        Align = alLeft
        BiDiMode = bdLeftToRight
        Caption = 'Summary'
        DoubleBuffered = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Unicode MS'
        Font.Style = []
        ParentBackground = False
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        object lbstats: TLabel
          Left = 2
          Top = 445
          Width = 173
          Height = 17
          Align = alTop
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExplicitLeft = -2
          ExplicitTop = 460
        end
        object lbFilesRead: TLabel
          Left = 2
          Top = 403
          Width = 173
          Height = 14
          Hint = 'Nr of Files Read'
          Align = alTop
          AutoSize = False
          Caption = 'Files Read : '
          Color = clWindow
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearType
          GlowSize = 5
          ParentColor = False
          ParentFont = False
          Transparent = True
          ExplicitLeft = 4
          ExplicitTop = 410
        end
        object lbFilesel: TLabel
          Left = 2
          Top = 417
          Width = 173
          Height = 14
          Align = alTop
          AutoSize = False
          Caption = 'Files selected  : '
          Color = clWindow
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearType
          GlowSize = 5
          ParentColor = False
          ParentFont = False
          Transparent = True
          ExplicitLeft = 4
          ExplicitTop = 424
        end
        object lbFilters: TLabel
          Left = 2
          Top = 431
          Width = 173
          Height = 14
          Align = alTop
          AutoSize = False
          Caption = 'No Filtering'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearType
          GlowSize = 5
          ParentFont = False
          Transparent = True
          ExplicitLeft = 4
          ExplicitTop = 455
        end
        object grp4: TGroupBox
          Left = 2
          Top = 18
          Width = 173
          Height = 53
          Align = alTop
          Caption = 'No filtering '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lbNotes: TLabel
            Left = 4
            Top = 15
            Width = 155
            Height = 14
            AutoSize = False
            Caption = 'Notes'
            Color = clWindow
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            Font.Quality = fqClearType
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object lbInfo: TLabel
            Left = 4
            Top = 31
            Width = 155
            Height = 14
            AutoSize = False
            Caption = 'Notes'
            Color = clWindow
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            Font.Quality = fqClearType
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
        end
        object grp5: TGroupBox
          Left = 2
          Top = 71
          Width = 173
          Height = 332
          Align = alTop
          Caption = 'Filter for'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object sgToCheck: TStringGrid
            Left = 2
            Top = 16
            Width = 169
            Height = 314
            Align = alClient
            ColCount = 2
            DefaultRowHeight = 16
            DrawingStyle = gdsGradient
            FixedCols = 0
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial Unicode MS'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goTabs, goRowSelect]
            ParentFont = False
            TabOrder = 0
            OnDblClick = sgToCheckDblClick
            OnDrawCell = sgToCheckDrawCell
            OnKeyUp = sgToCheckKeyUp
            OnSelectCell = sgToCheckSelectCell
            ExplicitLeft = 6
            ExplicitTop = 71
            ColWidths = (
              64
              64)
            RowHeights = (
              16
              16
              16
              16
              16)
          end
        end
        object pgRead: TProgressBar
          Left = 2
          Top = 462
          Width = 173
          Height = 17
          Align = alTop
          TabOrder = 2
        end
      end
    end
    object grp1: TGroupBox
      Left = 231
      Top = 199
      Width = 940
      Height = 521
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'File Reading'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object pnl2: TPanel
        Left = 2
        Top = 19
        Width = 936
        Height = 500
        Align = alClient
        Caption = 'pnl2'
        Color = clWhite
        TabOrder = 0
        object pgReadFiles: TPageControl
          Left = 1
          Top = 1
          Width = 934
          Height = 498
          ActivePage = tsReadall
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = pgReadFilesChange
          object tsReadall: TTabSheet
            Caption = 'Files Read from Locations'
            object grpFiles: TGroupBox
              Left = 0
              Top = 0
              Width = 926
              Height = 464
              Align = alClient
              Caption = 'List of Files that'#39's been read '
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              object ckfilelist: TCheckListBox
                Left = 2
                Top = 16
                Width = 922
                Height = 446
                Align = alClient
                AllowGrayed = True
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = 'Arial Unicode MS'
                Font.Style = []
                Font.Quality = fqClearTypeNatural
                ItemHeight = 18
                ParentFont = False
                ParentShowHint = False
                ScrollWidth = 10
                ShowHint = True
                Style = lbOwnerDrawVariable
                TabOrder = 0
                OnClick = ckfilelistClick
                OnDrawItem = ckfilelistDrawItem
                ExplicitLeft = -198
                ExplicitTop = 41
              end
            end
          end
          object tsReadSelective: TTabSheet
            Caption = 'Read Selective Files in Location'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial Unicode MS'
            Font.Style = []
            ImageIndex = 1
            ParentFont = False
            object grp2: TGroupBox
              Left = 0
              Top = 41
              Width = 926
              Height = 423
              Align = alClient
              Caption = 'File List'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              object ckReadselect: TCheckListBox
                Left = 2
                Top = 16
                Width = 922
                Height = 405
                Hint = 'Right Click to Load a Read list or Save a Read list'
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = 'Arial Unicode MS'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ScrollWidth = 10
                ShowHint = True
                Sorted = True
                TabOrder = 0
                OnKeyPress = ckReadselectKeyPress
                OnKeyUp = ckReadselectKeyUp
                OnMouseUp = ckReadselectMouseUp
              end
            end
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 926
              Height = 41
              Align = alTop
              TabOrder = 1
              object Label1: TLabel
                Left = 3
                Top = 3
                Width = 339
                Height = 15
                Caption = 
                  'Select from the list below what you want to read and then Click ' +
                  'Read...'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial Unicode MS'
                Font.Style = []
                ParentFont = False
              end
              object Label2: TLabel
                Left = 3
                Top = 18
                Width = 240
                Height = 15
                Caption = 'Right Click to Load a Read list or Save a Read list'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial Unicode MS'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object tsDetail: TTabSheet
            Caption = 'Logs Read Details'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ImageIndex = 2
            ParentFont = False
            object pgcpgresults: TPageControl
              Left = 296
              Top = 80
              Width = 693
              Height = 361
              ActivePage = tsDetails
              MultiLine = True
              TabOrder = 0
              object tsDetails: TTabSheet
                Caption = '             Details              '
              end
              object tsSummary: TTabSheet
                Caption = 'Summary'
                ImageIndex = 1
              end
            end
            object tvView: TTreeView
              Left = 0
              Top = 0
              Width = 926
              Height = 464
              Align = alClient
              BevelOuter = bvRaised
              BevelKind = bkFlat
              BorderStyle = bsNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Arial Unicode MS'
              Font.Style = []
              Indent = 19
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 1
              OnCollapsed = tvViewCollapsed
              OnCollapsing = tvViewCollapsing
              OnExpanding = tvViewExpanding
              OnExpanded = tvViewExpanded
              OnGetSelectedIndex = tvViewGetSelectedIndex
              OnMouseEnter = tvViewMouseEnter
              OnMouseUp = tvViewMouseUp
            end
          end
        end
      end
    end
    object splView: TSplitView
      Left = 1
      Top = 1
      Width = 40
      Height = 718
      AnimationDelay = 5
      AnimationStep = 80
      BevelInner = bvRaised
      CloseStyle = svcCompact
      Color = clHighlight
      CompactWidth = 40
      DockSite = True
      Opened = False
      OpenedWidth = 260
      Padding.Left = 5
      ParentShowHint = False
      Placement = svpLeft
      ShowHint = True
      TabOrder = 3
      OnMouseEnter = splViewMouseEnter
      OnMouseLeave = splViewMouseLeave
      OnMouseMove = splViewMouseMove
      object imgMenu: TImage
        Left = 5
        Top = 10
        Width = 32
        Height = 32
        Cursor = crHandPoint
        IncrementalDisplay = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF40000002B744558744372656174696F6E2054696D65
          0053756E20322041756720323031352031373A30353A3430202D30363030AB9D
          78EE0000000774494D4507DF0802160936B3167602000000097048597300002E
          2300002E230178A53F760000000467414D410000B18F0BFC61050000003B4944
          415478DAEDD3310100200C0341EA5F3454020BA1C3BD81DC925A9F2B00809180
          DD3D19EB00AE00C9000066BE00201900C0CC1700240300003859BE2421B37CDF
          370000000049454E44AE426082}
        Proportional = True
        Stretch = True
        OnClick = imgMenuClick
        OnMouseMove = bbMNUMouseMove
      end
      object bbRun: TButton
        Left = 55
        Top = 159
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Read'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 0
        OnClick = bbRunClick
        OnMouseMove = bbRunMouseMove
      end
      object bbStop: TButton
        Left = 55
        Top = 195
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Stop'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 1
        OnClick = bbStopClick
        OnMouseMove = bbStopMouseMove
      end
      object bbShowall: TButton
        Left = 55
        Top = 231
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Show All'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 2
        OnClick = spShowallClick
        OnMouseMove = bbShowallMouseMove
      end
      object bbSave: TButton
        Left = 55
        Top = 267
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Save Results'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 3
        OnClick = bbSaveClick
        OnMouseMove = bbSaveMouseMove
      end
      object ckDisplay: TCheckBox
        Left = 55
        Top = 438
        Width = 120
        Height = 28
        Caption = 'Display File Names only'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = False
        WordWrap = True
        OnClick = ckDisplayClick
        OnMouseMove = ckDisplayMouseMove
      end
      object ckBuilddetailafterread: TCheckBox
        Left = 53
        Top = 472
        Width = 120
        Height = 34
        Caption = 'Build Log Result Tree after Reading'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
        WordWrap = True
        OnMouseMove = ckBuilddetailafterreadMouseMove
      end
      object bbReset: TButton
        Left = 55
        Top = 7
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Reset'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 6
        OnClick = spbResetClick
        OnMouseMove = bbResetMouseMove
      end
      object bbAddrow: TButton
        Left = 55
        Top = 43
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Insert Row'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 7
        OnClick = btnAddClick
        OnMouseMove = bbAddrowMouseMove
      end
      object bbClearRow: TButton
        Left = 55
        Top = 79
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Clear Row'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 8
        OnClick = btnDelRowClick
        OnMouseMove = bbClearRowMouseMove
      end
      object bbAddDir: TButton
        Left = 55
        Top = 115
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Add Directory'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 9
        OnClick = bbAddDirClick
        OnMouseMove = bbAddDirMouseMove
      end
      object bbClose: TButton
        Left = 55
        Top = 393
        Width = 120
        Height = 30
        ParentCustomHint = False
        Caption = 'Close'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 10
        OnClick = spbCloseClick
        OnMouseMove = bbCloseMouseMove
      end
      object Panel2: TPanel
        Left = 55
        Top = 151
        Width = 120
        Height = 2
        TabOrder = 11
        StyleElements = [seFont]
        OnMouseMove = Panel2MouseMove
      end
      object Panel6: TPanel
        Left = 55
        Top = 430
        Width = 120
        Height = 2
        TabOrder = 12
        StyleElements = [seFont]
        OnMouseMove = Panel6MouseMove
      end
      object bbRefresh: TButton
        Left = 55
        Top = 349
        Width = 120
        Height = 30
        Hint = 'Click to Build a List based on the file paths'
        ParentCustomHint = False
        Caption = 'Refresh List'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 13
        OnClick = btnBuildflistClick
        OnMouseMove = bbRefreshMouseMove
      end
      object bbBuild: TButton
        Left = 55
        Top = 313
        Width = 120
        Height = 30
        Hint = 'Click to Build a List based on the file paths'
        ParentCustomHint = False
        Caption = 'Build List'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 14
        OnClick = bbBuildClick
        OnMouseMove = bbBuildMouseMove
      end
      object Panel7: TPanel
        Left = 55
        Top = 305
        Width = 120
        Height = 2
        TabOrder = 15
        StyleElements = [seFont]
        OnMouseMove = Panel6MouseMove
      end
      object Panel8: TPanel
        Left = 55
        Top = 385
        Width = 120
        Height = 2
        TabOrder = 16
        StyleElements = [seFont]
        OnMouseMove = Panel6MouseMove
      end
    end
  end
  object pnlSave: TPanel
    Left = 266
    Top = 305
    Width = 657
    Height = 104
    BevelInner = bvRaised
    BevelKind = bkFlat
    BevelOuter = bvLowered
    BevelWidth = 3
    TabOrder = 2
    Visible = False
    object bbSavetoo: TButton
      Left = 536
      Top = 52
      Width = 102
      Height = 40
      ParentCustomHint = False
      Caption = 'Save'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      TabOrder = 1
      OnClick = bbSavetooClick
      OnMouseMove = bbCloseMouseMove
    end
    object bbFileloc: TButton
      Left = 605
      Top = 16
      Width = 31
      Height = 27
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnMouseEnter = bbMNUMouseEnter
      OnMouseMove = bbMNUMouseMove
    end
    object edSavetoo: TEdit
      Left = 24
      Top = 16
      Width = 537
      Height = 21
      TabOrder = 2
    end
  end
  object gpFilter: TGroupBox
    Left = 984
    Top = 13
    Width = 182
    Height = 180
    Caption = 'Folder Filtering'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label3: TLabel
      Left = 7
      Top = 46
      Width = 52
      Height = 14
      Caption = 'File Mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 7
      Top = 95
      Width = 24
      Height = 14
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 119
      Top = 95
      Width = 49
      Height = 14
      Caption = 'Direction'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edFileMask: TEdit
      Left = 7
      Top = 60
      Width = 166
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edFilDate: TMaskEdit
      Left = 7
      Top = 113
      Width = 81
      Height = 23
      EditMask = '!0000/99/99;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '    /  /  '
    end
    object cbDirection: TComboBox
      Left = 119
      Top = 113
      Width = 51
      Height = 23
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'All'
      Items.Strings = (
        'All'
        '='
        '<='
        '>=')
    end
    object ckEnableFilter: TCheckBox
      Left = 10
      Top = 19
      Width = 97
      Height = 17
      Caption = 'Enable Filtering'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
      OnClick = ckEnableFilterClick
    end
    object bbApply: TButton
      Left = 90
      Top = 142
      Width = 80
      Height = 27
      Caption = 'Apply'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = bbApplyClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 632
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 672
    Top = 64
    object ExpandAll1: TMenuItem
      Caption = 'Expand All'
      OnClick = ExpandAll1Click
    end
    object CollapseAll1: TMenuItem
      Caption = 'Collapse All'
      OnClick = CollapseAll1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object SaveOutput1: TMenuItem
      Caption = 'Save Output'
      OnClick = SaveOutput1Click
    end
  end
  object ppChkedit: TPopupMenu
    Left = 376
    Top = 24
    object OpenReadlist1: TMenuItem
      Caption = 'Open Read list'
      OnClick = OpenReadlist1Click
    end
    object SaveReadlist1: TMenuItem
      Caption = 'Save Read list'
      OnClick = SaveReadlist1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SelectAll1: TMenuItem
      Caption = 'Select All'
      OnClick = SelectAll1Click
    end
    object Unselectall1: TMenuItem
      Caption = 'Unselect all'
      OnClick = Unselectall1Click
    end
  end
  object dlgOpenrdlst: TOpenDialog
    OnClose = dlgOpenrdlstClose
    Filter = '*.rdlt'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Open Read List'
    Left = 464
    Top = 80
  end
  object dlgSaverdlst: TSaveDialog
    DefaultExt = 'rdlt'
    Filter = '*.rdlt'
    Title = 'Save Read list'
    Left = 392
    Top = 80
  end
  object openReadfold: TOpenDialog
    Filter = '*.log'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Select any log file'
    Left = 264
    Top = 16
  end
  object svOutput: TSaveDialog
    Options = [ofHideReadOnly, ofNoReadOnlyReturn, ofEnableSizing]
    Title = 'Save Output'
    Left = 584
    Top = 64
  end
  object il1: TImageList
    Left = 328
    Top = 24
    Bitmap = {
      494C01010E001200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005F00000040000000400000002000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AF3030009F000000800000008000000020000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000800000808000C0C0C000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0606000CF9090009F0000008000000080000000200000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000808000C0C0C00000808000C0C0C0000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0606000C0C0C000AF6F6F00DFDFDF00DFDFDF00400000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000C0C0C000000000000000000000808000C0C0C00000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0606000C0C0C000AF6F6F00DFDFDF00DFDFDF00400000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000080
      80000000000000000000000000000000000000808000C0C0C000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000A0606000C0C0C000AF6F6F00DFDFDF00DFDFDF00400000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000FFFF00000000000000000000808000008080000080
      8000000080000000800000000000000000000000000000000000000000000000
      000000000000A0606000C0C0C000AF6F6F00DFDFDF00DFDFDF00400000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000808080000000000000000000808080000000
      0000008080000080800000008000000080000000000000000000000000000000
      000000000000A0606000C0C0C000AF6F6F00DFDFDF00DFDFDF00400000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000080000080800000000000C0C0
      C000C0C0C0000000000000000000008080000000000000000000000000000000
      000000FFFF00000000000080800000808000000000009F000000800000008000
      00008000000090303000C0C0C000AF6F6F00DFDFDF00DFDFDF00800000008000
      0000600000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000000000000000008080
      800080808000C0C0C00000000000000000000080800080000000000000000000
      0000000000000000000000FFFF0080808000000000003F0000009F0000008000
      0000800000008000000090303000AF6F6F00DFDFDF00DFDFDF00800000008000
      0000800000006000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000C0C0C0008080
      8000C0C0C0008080800000FFFF008080800000FFFF00FF000000800000000000
      000000FFFF0000000000808080000000000000000000000000003F0000009F00
      0000AF6F6F00AF6F6F00AF6F6F00BF9F9F00DFDFDF00DFDFDF00AF6F6F00AF6F
      6F00AF6F6F009030300020000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000808080000000000080808000C0C0C0000000000000000000FF0000008000
      0000000000008080800000000000000000000000000000000000000000003F00
      0000AF303000DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00BF9F9F002000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      00000000000080808000C0C0C0000000000000FFFF000000000000000000FF00
      0000800000000000000000000000000000000000000000000000000000000000
      00003F000000AF303000DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00BF9F
      9F00200000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800080808000808080008080800000000000000000000000000000FFFF008080
      8000FF0000008000000000000000000000000000000000000000000000000000
      0000000000003F000000AF303000DFDFDF00DFDFDF00DFDFDF00BF9F9F002000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000808080000000
      000000000000FF00000080000000000000000000000000000000000000000000
      000000000000000000003F000000AF303000DFDFDF00BF9F9F00200000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      00000000000000000000FF000000800000000000000000000000000000000000
      00000000000000000000000000003F000000AF30300020000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202020004040400000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000020202000808080008080800060606000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008000000090303000DFDFDF00DFDFDF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002020200080808000808080008080800080808000606060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000090303000DFDFDF00DFDFDF00DFDFDF00200000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000090909000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0009090900080808000808080008080800080808000B0B0B000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000909090000000000000000000000000000000
      0000000000003F000000DFDFDF00DFDFDF00DFDFDF00DFDFDF00BF9F9F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000090909000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000909090008080800080808000B0B0B000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00090909000000000000000000000000000000000000000
      00000000000000000000A0606000C0C0C000DFDFDF00DFDFDF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000000000000090909000C0C0
      C000C0C0C000C0C0C00090909000606060006060600060606000606060006060
      6000606060006060600060606000404040005050500060606000606060006060
      6000606060006060600060606000606060006060600090909000C0C0C000C0C0
      C000C0C0C0009090900000000000000000000000000000000000000000000000
      00000000000000000000A0606000C0C0C000DFDFDF00DFDFDF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000009090
      9000C0C0C000C0C0C00060606000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000060606000C0C0C000C0C0
      C000909090000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F0000004000000040000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000090909000C0C0C00060606000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000060606000C0C0C0009090
      9000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009090900060606000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000060606000909090000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000030303000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000030303000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004040400060606000808080008080800080808000606060004040
      4000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000005F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006F6F6F0060606000606060006060600060606000202020000000
      0000000000000000000000000000000000000000000000000000000000003232
      3200323232003232320032323200323232003232320032323200323232003232
      3200323232000000000000000000000000000000000000000000000000002020
      20002020600020209F000000BF000000BF000000BF0020209F00404080008080
      8000606060002020200000000000000000000000000000000000000000000000
      00000000000000007F000000FF000000BF000000800020002000000000000000
      0000000000000000000000000000000000000000000000000000000000006060
      6000C0C0C000DFDFDF00C0C0C000C0C0C000C0C0C000C0C0C000404040008080
      8000404040000000000000000000000000000000000000000000323232008686
      8600B6B6B600C2C2C200CECECE00CECECE00CECECE00CECECE00CECECE00DADA
      DA00323232000000000000000000000000000000000000000000000020002020
      9F000000FF000000FF000000FF000000FF000000FF000000FF000000FF002020
      9F00606080008080800020202000000000000000000000000000000000000000
      7F000000FF000000FF0040407F00BFBF0000404040007F007F00800080000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000EFEFEF00DFDFDF00DFDFDF00DFDFDF00DFDFDF005F5F5F008080
      8000808080000000000000000000000000000000000032323200F2F2F2004A4A
      4A00B6B6B600E6E6E600DADADA00DADADA00DADADA00E6E6E600E6E6E600CECE
      CE003232320000000000000000000000000000000000000020000000DF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DF006060800060606000000000000000000000007F000000FF000000
      FF0040007F00BF000000BFBF0000FFFF0000808000007F007F00800080000000
      000000000000000000000000000000000000000000000000000000000000DFDF
      DF00DFDFDF00C0C0C00080808000606060006060600080808000C0C0C0006060
      60004040400000000000000000000000000032323200868686004A4A4A006262
      6200E6E6E600E6E6E600CECECE00DADADA00DADADA00DADADA00E6E6E600CECE
      CE00323232000000000000000000000000000000000000007F000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF0020209F0080808000404040000000BF000000FF000000FF009F00
      0000FF000000FF000000BFBF0000DFDF0000808000007F007F00800080000000
      0000000000000000000000000000000000000000000000000000000000006060
      6000C0C0C0008080800070707000A0A0A000A0A0A0004040400080808000C0C0
      C0006060600000000000000000000000000032323200CECECE00CECECE00CECE
      CE00CECECE00E6E6E600DADADA00CECECE00DADADA00DADADA00DADADA00DADA
      DA0032323200000000000000000000000000000040000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0040408000606060000000BF000000FF000000FF00BF00
      0000FF000000FF00000080600000DFDF0000BFBF0000BF00BF00800080000000
      0000404000007F7F00007F7F00003F3F00000000000000000000000000000000
      0000000000005050500070707000A0A0A000A0A0A00040404000505050000000
      00000000000000000000000000000000000032323200CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00DADADA00CECECE00CECECE00DADADA00DADA
      DA003232320000000000000000000000000000007F000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0020209F00808080000000BF000000FF000000FF00BF00
      0000BF3F00003FBF0000008000005F203F00FF00FF00DF00DF00800080000000
      0000202000008080000080800000808020000000000000000000000000000000
      0000000000002020200030303000505050004040400040404000000000000000
      00000000000000000000000000000000000032323200E6E6E600CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00DADADA00CECECE00DADA
      DA00323232000000000000000000000000000000BF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000BF00808080000000BF000000FF000000FF00209F
      000000FF000000FF0000008000005F005F00BF00BF00DF00DF00BF00BF000000
      0000303030000000000000000000000000000000000000000000000000000000
      000060606000DFDFDF00C0C0C000C0C0C000C0C0C000C0C0C000404040004040
      40000000000000000000000000000000000032323200E6E6E600C2C2C200CECE
      CE00C2C2C200CECECE00CECECE00C2C2C200C2C2C200C2C2C200C2C2C200C2C2
      C200503200000000000000000000000000000000BF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000BF00808080000000BF000000FF000000FF0000BF
      000000FF000000DF0000008000003F205F00BF00BF004000400000000000308F
      300060806000303030000000000000000000000000000000000000000000C0C0
      C000C0C0C000DFDFDF00C0C0C000C0C0C000C0C0C000C0C0C000404040008080
      80008080800000000000000000000000000032323200E6E6E600CECECE00C2C2
      C200CECECE00CECECE00C2C2C200C2C2C200AAAAAA00AAAAAA00AAAAAA00AAAA
      AA00503200005032000000000000000000000000BF000000FF007F7FFF007F7F
      FF007F7FFF007F7FFF007F7FFF007F7FFF007F7FFF007F7FFF007F7FFF007F7F
      FF007F7FFF000000FF000000BF00606060000000BF000000FF000000FF00009F
      00003FBF3F003FDF3F0000BF0000006060000000000000000000009F00007FBF
      7F0060806000000000000000000000000000000000000000000000000000C0C0
      C000DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF009F9F9F004040
      40008080800000000000000000000000000032323200E6E6E600B6B6B600CECE
      CE00AAAAAA009E9E9E00AAAAAA007A7A7A00AAAAAA0050320000734A0000734A
      000096620000B97A0000503200000000000000007F000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0020209F00404040000000BF000000FF000000FF003F7F
      7F0000BF0000007F3F0000FFFF000080800000000000007F00007FBF7F006080
      600000000000000000000000000000000000000000000000000000000000DFDF
      DF00C0C0C000B0B0B0004040400040404000404040006060600090909000C0C0
      C0006060600000000000000000000000000032323200F2F2F200B6B6B6006E6E
      6E00AAAAAA0056565600AAAAAA001A1A1A00AAAAAA0050320000DC920000DC92
      0000DC920000DC920000B97A000050320000000040000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0020206000000000000000BF000000FF000000FF000000
      DF0000008000007F7F0000FFFF00008080000000000000200000305030000000
      0000000000003030300060606000000000000000000000000000000000000000
      0000606060008080800070707000A0A0A000A0A0A00040404000808080006060
      60000000000000000000000000000000000032323200F2F2F200C2C2C2009292
      9200C2C2C2007A7A7A00C2C2C2004A4A4A00AAAAAA0050320000FFAA0000FFAA
      0000DC920000DC920000FFAA0000503200000000000000007F000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF0020209F0020202000000000000000BF000000DF003F00BF003F00
      DF0000009F0000BFBF0000DFDF00008080000000000000000000000000000000
      0000303030006F306F0080608000503050000000000000000000000000000000
      0000000000002020200070707000A0A0A000A0A0A00040404000202020000000
      00000000000000000000000000000000000032323200F2F2F200B6B6B600C2C2
      C200C2C2C2009E9E9E00C2C2C2007A7A7A00CECECE0050320000503200005032
      0000B97A0000FFAA0000503200000000000000000000000020000000DF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DF000000200000000000000000003F009F003F00DF000000BF00205F
      9F0000DFDF003FBFBF003FDFDF00409F9F000000000000000000000000003030
      30006F306F00BF3FBF007F3F7F00000000000000000000000000000000000000
      0000000000002020200040404000808080006060600020202000202020000000
      00000000000000000000000000000000000032323200F2F2F200B6B6B600B6B6
      B600C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200CECECE00CECECE00DADA
      DA00503200005032000000000000000000000000000000000000000020000000
      7F000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      7F00000020000000000000000000000000000000200000004000000000007F9F
      9F003FDFDF0040BFBF0040404000000000000000000000000000000000006F30
      6F00BF3FBF007F3F7F0000000000000000000000000000000000000000000000
      0000000000000000000080808000A0A0A000A0A0A00060606000000000000000
      00000000000000000000000000000000000032323200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200E6E6E600E6E6E600E6E6E600E6E6
      E600503200000000000000000000000000000000000000000000000000000000
      00000000400000007F000000BF000000BF000000BF0000007F00000040000000
      0000000000000000000000000000000000000000000000000000000000002020
      2000404040000000000000000000000000000000000000000000000000006000
      60007F3F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003232320032323200323232003232
      3200323232003232320032323200323232003232320032323200323232003232
      320032323200000000000000000000000000000000000000000000000000EBEB
      EB16E0E0E025EFEFEF1200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000200000007F3F
      00003F0000000000000000000000000000000000000000000000000000000000
      0000000000004040400060606000808080008080800080808000606060004040
      4000000000000000000000000000000000000000000000000000EDEDEE41ADA0
      A1FFCBBEBEFFCCBDBEFF9A9191D49B9B9B68F3F3F30C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005050
      5000606060006060600060606000606060006060600050303000DF3F0000FFBF
      00007F0000006060600060606000000000000000000000000000000000002020
      20002020600020209F000000BF000000BF000000BF0020209F00404080008080
      8000606060002020200000000000000000000000000000000000E2C1A66AE3C7
      BAFFE7C1AAFFD6C2BEFFCFC3C8FFA89897FF8484847BDCDCDC23FAF9F907FDFD
      FD020000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000DFBFBF00DF3F0000FFBF0000BF00
      00007F7F7F0000000000DFDFDF00000000000000000000000000000020002020
      9F000000FF000000FF000000FF000000FF000000FF000000FF000000FF002020
      9F006060800080808000202020000000000000000000F2E6DD54D77A2EFFFFCA
      86FFFFDA98FFFAA75CFFBD7F4FFDBCADAFFF7D7776B29592926D9892906FA39C
      9966B8B2AF50E7E2E01F000000000000000000000000FFFFFF00800000008000
      0000FFFFFF0080000000800000008000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000BFBF
      BF0000000000DFDFDF00DFDFDF00CFAFAF00DF3F0000FFBF0000BF0000007070
      7000EFEFEF0000000000DFDFDF000000000000000000000020000000DF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DF0060608000606060000000000000000000AA6B39DACC864AFFE2A3
      6CFFE4A470FFDD9A61FFB2621FFF907766C9A39696F8B4A7A25DBFAD9F60C2AE
      A05FB3A1946BB1A7A05FF4F2F10E0000000000000000FFFFFF00800000008000
      0000FFFFFF008000000080000000800000008000000080000000800000008000
      0000FFFFFF00FFFFFF000000000000000000000000000000000000000000BFBF
      BF0000000000DFDFDF00CFCFCF00DF3F0000FFBF0000BF00000070707000DFDF
      DF00EFEFEF0000000000DFDFDF00000000000000000000007F000000FF000000
      FF003F3FFF000000FF000000FF000000FF000000FF000000FF003F3FFF000000
      FF000000FF0020209F008080800040404000000000007C3E09F6935725FFA16A
      3BFFA26B3DFF9B6130FF8B4B15FF9E8E8189BCADB0FFB8A3958BE8DED827E3D7
      CD32E4D8D02FD6D1CD32F9F8F8070000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000005F5F
      5F007F7F7F009F9F9F00BFBFBF00CFCF8F00BF00000070707000DFDFDF00DFDF
      DF00EFEFEF0000000000DFDFDF0000000000000040000000FF000000FF003F3F
      FF0000000000BFBFFF000000FF000000FF000000FF00BFBFFF00000000003F3F
      FF000000FF000000FF00404080006060600000000000AA8568B7996A43FFAB81
      5EFFAC8361FF9A6A42FF672400FFF2EDE95EB8A9A9FFB1A5A7FFE4D9D232FDFC
      FC03FCFBFB04FEFEFE01000000000000000000000000FFFFFF00800000008000
      0000FFFFFF008000000080000000800000008000000080000000800000008000
      0000FFFFFF00FFFFFF00000000000000000000000000505050008F8F3000AFAF
      3000AFAF30007F7F0000505030006060600070707000DFDFDF00DFDFDF00DFDF
      DF00EFEFEF0000000000DFDFDF000000000000007F000000FF000000FF000000
      FF00BFBFFF0000000000BFBFFF000000FF00BFBFFF0000000000BFBFFF000000
      FF000000FF000000FF0020209F008080800000000000FDFCFB18AC896CF1CEBA
      A7FFD3BEAEFF94643DFFBEA38DA4D8D0D3E4BEAEADFFAF9E9DFFCCC0C2ECFDFD
      FD040000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000040404000EFEF6F00DFDF9F00DFDF
      6000BFBF8000AFAF70009F9F000040404000DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00EFEFEF0000000000DFDFDF00000000000000BF000000FF000000FF000000
      FF000000FF00BFBFFF00000000000000000000000000BFBFFF000000FF000000
      FF000000FF000000FF000000BF00808080000000000000000000FEFEFE02DACE
      C584A48772D0AB9286D9D4C9CCFCCCBEBDFFBBACABFFAD9D9BFFA39391FFB9AA
      A9D7FEFEFE0100000000000000000000000000000000FFFFFF00800000008000
      0000FFFFFF00800000008000000080000000800000008000000080000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000BFBF7F00FFFF7F00DFDF9F00DFDF
      6000BFBF8000AFAF7000AFAF700040400000AFAFAF00DFDFDF00DFDFDF00DFDF
      DF00EFEFEF0000000000DFDFDF00000000000000BF000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000BF0080808000000000000000000000000000CAC1
      C3E9D9D1D3FFE2DAD9FFD1C4C5FFC3B5B4FFB1A3A5FFA49497FF9D8D8EFF9B8C
      8BFF9D8F8DDEF2F1F119000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000BFBF7F00FFFF7F00DFDFDF00DFDF
      6000BFBF8000AFAF7000AFAF700040400000AFAFAF00DFDFDF00DFDFDF00DFDF
      DF00EFEFEF0000000000DFDFDF00000000000000BF000000FF000000FF000000
      FF000000FF00BFBFFF00000000000000000000000000BFBFFF000000FF000000
      FF000000FF000000FF000000BF0060606000000000000000000000000000E8E0
      E0BDD7CBCBFFCFC2C3FFBFB1B0FFB4A3A1FFC79A7BFFE0B992FFD8B793FFB595
      82FF93868AFF756967FFF1F0F02F000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000007F7F4000FFFF7F00DFDFDF00DFDF
      6000DFDF6000DFDF6000DFDF600040402000CFCFCF0000000000000000000000
      00000000000000000000DFDFDF000000000000007F000000FF000000FF000000
      FF00BFBFFF0000000000BFBFFF000000FF00BFBFFF0000000000BFBFFF000000
      FF000000FF000000FF0020209F0040404000000000000000000000000000FEFE
      FE17CFC3C2DAB3A1A1FFEAE8EB84994F0FF1CA8347FFDC9B64FFDD9D67FFD790
      55FFA76530FF8D7B79FFC0BBBBA70000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000020202000DFDF9F00DFDF9F00FFFF
      7F00DFDF6000DFDF60007070300070707000DFDFDF00DFDFDF00000000000000
      00000000000000000000DFDFDF0000000000000040000000FF000000FF003F3F
      FF0000000000BFBFFF000000FF000000FF000000FF00BFBFFF00000000003F3F
      FF000000FF000000FF0020206000000000000000000000000000000000000000
      000000000000FDFCFC20000000006E2800FF915625FFA06A3CFFA0693CFF965C
      2CFF83420CFF7A5A44FEC1BABAB50000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000002020200070707000BFBF
      7F00BFBF7F005F5F5F008F8F8F0000000000000000000000000000000000BFBF
      BF007F7F7F006F6F6F0020202000000000000000000000007F000000FF000000
      FF003F3FFF000000FF000000FF000000FF000000FF000000FF003F3FFF000000
      FF000000FF0020209F0020202000000000000000000000000000000000000000
      0000000000000000000000000000A98465B9A37956FFAD8665FFAF8868FF9B6C
      45FF692600FF7F706EFFCEC7C7A1000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00EFEFEF0070707000000000000000000000000000000020000000DF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DF000000200000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFAF912BA9D86E4D1BEAEFFCFBAA9FF824A
      1DFFE1D4C95EC3BDBDC6FEFEFE160000000080808000FFFFFF0000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      000000000000FFFFFF000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00707070000000000000000000000000000000000000000000000020000000
      7F000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      7F00000020000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2ECE742EDE6E054FCFA
      F90F000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000009F9F
      9F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF009F9F
      9F00000000000000000000000000000000000000000000000000000000000000
      00000000400000007F000000BF000000BF000000BF0000007F00000040000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00F9FFF87F00000000F0FFF83F00000000
      E07FF81F00000000E03FF81F00000000C60FF81F000000008F03F81F00000000
      9D80F81F000000003CD0F81F000000002634800700000000631C800300000000
      4005C00100000000B4C3E00300000000D963F00700000000E1C1F80F00000000
      FE58FC1F00000000FFBCFE3F00000000FFFFFFFFFFFFFFFFFFFFFDFFFFBFFFFF
      FC3FF9FFFF9FFFFFF00FF1FFFF8FFFFFE007E1FFFF87FFFFE007C0000003FFFF
      C00380000001FC3FC00300000000FC1FC00300000000F81FC00380000001FC3F
      C003C0000003FC3FE007E1FFFF87FE3FE007F1FFFF8FFFFFF00FF9FFFF9FFFFF
      FC3FFDFFFFBFFFFFFFFFFFFFFFFFFFFFF80FFC7FF00FE007E003F01FC003C007
      C001C00FC00380078001000FC00300078000000FC003000700000000F00F0007
      00000000F81F00073FF80007E00700073FF80003C003000300000007C0030001
      0000000FC003000000010019E007000080010070F81F000180030061F81F0003
      C00721E3F81F0007F01FE7E7FC3F0007E3FFFFFFFFC7F80FC07F0001E000E003
      C00F0001EF04C00180030001E804800180010001E804800080010001C0040820
      8003000180040440800F000100040380C007000100040380E003000100040380
      E0010001007C0440E0010001003C0821FA01000181E08001FE010001EFE18003
      FE010001EFE3C007FF8F0001E007F01F00000000000000000000000000000000
      000000000000}
  end
  object ppmenRead: TPopupMenu
    Left = 288
    Top = 88
    object ReadAll1: TMenuItem
      Caption = 'Read All Files'
      OnClick = ReadAll1Click
    end
    object ReadSelectiveFiles1: TMenuItem
      Caption = 'Read Selective Files'
      OnClick = ReadSelectiveFiles1Click
    end
  end
  object ppGrid: TPopupMenu
    Left = 512
    Top = 128
    object mnuReset: TMenuItem
      Caption = 'Reset'
      OnClick = mnuResetClick
    end
    object mnuInsert: TMenuItem
      Caption = 'Insert Row'
      OnClick = mnuInsertClick
    end
    object mnuClearRow: TMenuItem
      Caption = 'Clear Row'
      OnClick = mnuClearRowClick
    end
    object mnuAddDirectory: TMenuItem
      Caption = 'Add Directory'
      OnClick = mnuAddDirectoryClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 488
    Top = 464
  end
  object dlgOpendir: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPathMustExist]
    Left = 464
    Top = 128
  end
end
