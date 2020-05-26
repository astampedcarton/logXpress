object fmUsereefrule: TfmUsereefrule
  Left = 332
  Top = 163
  Caption = 'User Defined Rules'
  ClientHeight = 657
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 610
    Width = 898
    Height = 47
    Align = alBottom
    TabOrder = 0
    object bbClose: TrkGlassButton
      Left = 753
      Top = 3
      Width = 140
      Height = 40
      ParentCustomHint = False
      AltFocus = False
      AltRender = False
      Caption = 'Close'
      Color = 16744448
      ColorDown = 12615680
      ColorFocused = 8416256
      ColorFrame = 16744448
      ColorDisabled = 16744448
      DropDownAlignment = paLeft
      Flat = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      Glossy = True
      GlossyLevel = 90
      GlyphPos = gpLeft
      ImageIndex = 3
      LightHeight = 27
      ShadowStyle = ssDrop
      TabOrder = 0
      TextAlign = taCenter
      OnClick = bbCancelClick
    end
    object rkGlassButton1: TrkGlassButton
      Left = 596
      Top = 3
      Width = 140
      Height = 40
      ParentCustomHint = False
      AltFocus = False
      AltRender = False
      Caption = 'Save Results'
      Color = 16744448
      ColorDown = 12615680
      ColorFocused = 8416256
      ColorFrame = 16744448
      ColorDisabled = 16744448
      DropDownAlignment = paLeft
      Flat = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      Glossy = True
      GlossyLevel = 90
      GlyphPos = gpLeft
      ImageIndex = 12
      LightHeight = 27
      ShadowStyle = ssDrop
      TabOrder = 1
      TextAlign = taCenter
      OnClick = bbSaveClick
    end
    object bbNewRule: TrkGlassButton
      Left = 6
      Top = 3
      Width = 107
      Height = 40
      ParentCustomHint = False
      AltFocus = False
      AltRender = False
      Caption = 'New Rule'
      Color = 16744448
      ColorDown = 12615680
      ColorFocused = 8416256
      ColorFrame = 16744448
      ColorDisabled = 16744448
      DropDownAlignment = paLeft
      Flat = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      Glossy = True
      GlossyLevel = 90
      GlyphPos = gpLeft
      ImageIndex = 12
      LightHeight = 27
      ShadowStyle = ssDrop
      TabOrder = 2
      TextAlign = taCenter
      OnClick = AddNewRule1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 898
    Height = 610
    Align = alClient
    Caption = 'User Defined Rules'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object pgUserdefrules: TPageControl
      Left = 2
      Top = 16
      Width = 894
      Height = 592
      ActivePage = tsUserrules
      Align = alClient
      TabOrder = 0
      object tsSTDRules: TTabSheet
        Caption = 'Standard Rules'
        object sgSTDRules: TKGrid
          Left = 0
          Top = 0
          Width = 886
          Height = 563
          Align = alClient
          ColCount = 3
          FixedCols = 2
          Options = [goAlwaysShowEditor, goDrawFocusSelected, goEditing, goEnterMoves, goFixedHorzLine, goFixedVertLine, goHeader, goHeaderAlignment, goHorzLine, goIndicateHiddenCells, goMouseCanHideCells, goMouseOverCells, goRangeSelect, goTabs, goThemes, goThemedCells, goVertLine]
          OptionsEx = [gxEnterAppendsRow, gxEnterWraps, gxTabWraps, gxMouseWheelScroll]
          RangeSelectStyle = rsMS_Excel
          TabOrder = 0
          OnEditorCreate = sgSTDRulesEditorCreate
          OnEditorDataFromGrid = sgSTDRulesEditorDataFromGrid
          ColWidths = (
            64
            64
            64)
          RowHeights = (
            21
            21
            25
            21
            21)
        end
      end
      object tsUserrules: TTabSheet
        Caption = 'User Rules'
        ImageIndex = 1
        object sgRules: TKGrid
          Left = 0
          Top = 0
          Width = 886
          Height = 563
          Align = alClient
          ColCount = 3
          FixedCols = 0
          Options = [goAlwaysShowEditor, goDrawFocusSelected, goEditing, goEnterMoves, goFixedHorzLine, goFixedVertLine, goHeader, goHeaderAlignment, goHorzLine, goIndicateHiddenCells, goMouseCanHideCells, goMouseOverCells, goRangeSelect, goTabs, goThemes, goThemedCells, goVertLine]
          OptionsEx = [gxEnterAppendsRow, gxEnterWraps, gxTabWraps, gxMouseWheelScroll]
          RangeSelectStyle = rsMS_Excel
          RowCount = 20
          TabOrder = 0
          OnEditorCreate = sgRulesEditorCreate
          OnEditorDataFromGrid = sgRulesEditorDataFromGrid
          ColWidths = (
            64
            64
            64)
          RowHeights = (
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21
            21)
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 16
    object AddNewRule1: TMenuItem
      Caption = 'Add New Rule'
      OnClick = AddNewRule1Click
    end
  end
end
