object fmViewselect: TfmViewselect
  Left = 206
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Select your Default View'
  ClientHeight = 128
  ClientWidth = 254
  Color = clBtnFace
  Constraints.MaxHeight = 160
  Constraints.MaxWidth = 260
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 254
    Height = 128
    Align = alClient
    Caption = 'Select your default view'
    TabOrder = 0
    OnClick = GroupBox1Click
    object bbClassic: TBitBtn
      Left = 24
      Top = 24
      Width = 80
      Height = 80
      Caption = 'Classic'
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000606060404040
        4040404040404040404040406060606060606060605050504040404040404040
        40404040404040606060404040FFFFFFFFFFFF000000202020C0C0C0B0B0B0C0
        C0C0C0C0C0C0C0C0505050303030000000FFFFFFFFFFFF404040404040FFFFFF
        303030808080808080707070606060A0A0A0A0A0A06060609090907070709090
        90000000FFFFFF40404040404000000090909080808060606080808090909060
        6060606060909090808080707070B0B0B0404040FFFFFF404040404040000000
        909090606060606060C0C0C0909090606060606060909090C0C0C04040409090
        90707070000000404040404040000000606060404040505050C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0202020808080909090202020404040404040202020
        404040505050909090C0C0C0A0A0A0404040707070A0A0A0C0C0C06060602020
        20606060404040404040404040404040303030C0C0C0C0C0C0C0C0C0B0B0B0C0
        C0C0A0A0A0C0C0C0609F9FC0C0C0202020202020707070404040404040404040
        C0C0C0C0C0C0606060B0B0B0B0B0B0B0B0B040BFBF306F6F00BFBF209F9F40BF
        BF0000003030304040404040405F5F2090909080808040404020202040404090
        909000BFBF306F6F7F7F7F305F5F009F9F209F9F3030304040404040407F7F7F
        707070404040505050303030C0C0C0A0A0A0508F8F209F9F205F5F002F2F007F
        7F5050505F5F20404040404040505050B0B0B0B0B0B0C0C0C0C0C0C0B0B0B0C0
        C0C0C0C0C070707000BFBF609F9FB0B0B06060606F6F6F4040404040407F7F3F
        909090C0C0C0C0C0C0B0B0B0C0C0C0909090303030A0A0A040BFBFC0C0C0B0B0
        B03F3F005F5F5F404040404040AFAFAF303030C0C0C0C0C0C0C0C0C0C0C0C07F
        7F7FDFDF9F606060909090C0C0C06060609F9F9F303030404040404040000000
        CFCFCF303030606060606060606060BFBF7FCFCFCF7F7F406060606060602020
        20DFDF9F0000004040406060604040404040406F6F6F5F5F205050506F6F6F50
        50506F6F6F6F6F305050505F5F20505050404040404040606060}
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = bbClassicClick
    end
    object bbExtended: TBitBtn
      Left = 160
      Top = 24
      Width = 80
      Height = 80
      Caption = 'Extended'
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000000080000060
        3F3F5F3FBFBFFFFFFF0F6F7F0F2F3F10507F10507F9F9F9FFFFFFFBFBFBF3FBF
        BF3FBFBF7FBFBF3F7F7F0000200000003F7F7F7F7F7F3FBFBF0F2F3F10507F1F
        7FBF20AFFF10507FEFEFEFFFFFFFBFBFBF3F7F7F007F7F000060FFFFFFFFFFFF
        0000003FBFBF1F7FBF10507F10507F10507F20AFFF20AFFF7F7F7FFFFFFFFFFF
        FFFFFFFF7F7F7F000040FFFFFFFFFFFFFFFFFF00000010507F0000FF302F7F90
        80BF1F7FBF20AFFF3F5F6FFFFFFFFFFFFF9F9F9F7F7F7F7F7F7FFFFFFFFFFFFF
        FFFFFFFFFFFF10507F00007F605F7F9080BF605F7F20AFFF10507FFFFFFFFFFF
        FF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF00000010507F0000BF30
        2F7F302F7F10507F10507FEFEFEFFFFFFF6F6F6F7F7F7F000000FFFFFFFFFFFF
        FFFFFFFFFFFF0F2F3F0F2F7F0000FF0000FF0000FF00007F20AFFF7F7F7FFFFF
        FF202020000000FFFFFF0F2F3F0F2F3F00000000000010507F10507F10507F0F
        2F7F00007F0000FF10507F3F5F6FFFFFFF0000000000000000000000000F2F3F
        10507F10507F10507F10507F20AFFF20AFFF20AFFF10507F10507F10507F9F9F
        9F000000000020000000FFFFFFFFFFFFFFFFFFFFFFFF0F2F3F10507F10507F1F
        7FBF1F7FBF10507F10507F1F7FBF0F2F3F000000000040000000FFFFFFFFFFFF
        FFFFFFFFFFFF0000000000007F7F7F3F3F3F7F7F7F0000005F5F5F4F6F7F4F6F
        7F000020000020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000EFEFEF7F
        7F7F7F7F7F6F6F6FDFDFDF000040000060000040000020FFFFFFFFFFFF000000
        000000FFFFFFFFFFFF3F3F3F7F7F7FBFBFBF7F7F7F7F7F7F7F7F7F0000400000
        40000080000020FFFFFF0000000000BF00003FFFFFFFFFFFFF0000007F7F7F00
        007F3F3F7F7F7F7F000040000040000040000000FFFFFFFFFFFF00003F0000BF
        0000FF00007F00007F0000FF0000FF00005F0000600000000000003030503030
        50000000FFFFFFFFFFFF00003F0000FF0000FF0000FF0000FF0000FF0000BF00
        0000000000FFFFFF000000000040000020FFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = bbExtendedClick
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 120
    Top = 48
  end
  object BalloonHint1: TBalloonHint
    HideAfter = 2
    Left = 544
    Top = 192
  end
end
