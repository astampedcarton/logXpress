object fmRelease: TfmRelease
  Left = 480
  Top = 154
  Caption = 'Release Notes/Road Map'
  ClientHeight = 638
  ClientWidth = 816
  Color = clBtnFace
  Constraints.MaxHeight = 800
  Constraints.MaxWidth = 850
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 568
    Width = 816
    Height = 70
    Align = alBottom
    BevelInner = bvLowered
    Color = clWhite
    TabOrder = 0
    object bbClose: TButton
      Left = 328
      Top = 6
      Width = 169
      Height = 37
      Caption = 'Close'
      Style = bsCommandLink
      TabOrder = 0
      OnClick = bbCloseClick
    end
  end
  object CategoryPanelGroup1: TCategoryPanelGroup
    Left = 0
    Top = 0
    Width = 816
    Height = 568
    VertScrollBar.Tracking = True
    Align = alClient
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 1
    object CategoryPanel3: TCategoryPanel
      Top = 400
      Caption = 'Planned Road Map'
      TabOrder = 0
      object memMap: TMemo
        Left = 0
        Top = 0
        Width = 795
        Height = 174
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
    end
    object CategoryPanel2: TCategoryPanel
      Top = 200
      Caption = 'Previous Version'
      TabOrder = 1
      object memPrev: TMemo
        Left = 0
        Top = 0
        Width = 795
        Height = 174
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'memPrev')
        ParentFont = False
        TabOrder = 0
      end
    end
    object CategoryPanel1: TCategoryPanel
      Top = 0
      Caption = 'Version 4.0.0.0 (30SEP2015 - Current)'
      TabOrder = 2
      object memCurrent: TMemo
        Left = 0
        Top = 0
        Width = 795
        Height = 174
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          '20091211'
          
            '[1] The process message will only be activated evey 250 lines. T' +
            'his helped to save some time'
          
            '[2] Changed the algorithm to be as fast as possible replace alot' +
            ' of the if'#39's with case'
          
            '      added more conditions to the exclusion list, when a line i' +
            's to be skipped. The increase in performance'
          
            '      should be seen when processing large files containing a lo' +
            't of macro code. The line is now only processed'
          '      if it starts with a [n i e w] and is not missing.'
          ''
          '20091202'
          '[1] Added All other Notes section: for W.D Format notes.'
          '[2] Added Expand and Collapse all to the Tree view.'
          
            '[3] Fixed the problem with the Tree population, that populated i' +
            'ncorrectly'
          
            '[4] Added an additional LogView Form. Using one caused problems.' +
            ' This is just a work around  '
          '[5] The Warning for SAS that expires has been supressed'
          ''
          '20090909'
          
            '[1] Fixed a problem in Logfolder where the Tree wasn'#39't populated' +
            ' correctly at certain times'
          
            '[2] Changed the way the Log file is displayed when a new log is ' +
            'read. Previously it always displayed'
          
            '     the beginning but it made more sense to display the last.  ' +
            '                                                '
          
            '[3] Made minor changes to the colors to stand out more.         ' +
            '                                                    '
          ''
          '20090804'
          
            '1)   Implemented a stop procedure usefull when reading big files' +
            '.'
          '2)   Fixed a bug where merge notes was read but not counted.'
          '3)   Made minor changes to the UI for Folder Read. '
          '4)   Removed the line formatting as it caused a long time delay.'
          
            '      This is a temp work around while a more effective method i' +
            's being'
          '      looked at.'
          
            '5)   Fixed a problem where the wrong line was set relative to wh' +
            'at was choosen.'
          
            '6)   Fixed a problem where the popup menu wasn'#39't activated when ' +
            'clicking on the NOTES.'
          '7)   Added Table notes from SQL to the DD OBS label.'
          ''
          '20090727'
          
            '1)   Made changes to the read procedure to increase speed furthe' +
            'r'
          
            '2)   Fixed a problem where not all controls were disables during' +
            ' reading. This cause the counters to reset. '
          
            '3)   Removed the lightshandle as it cause a increase in time rea' +
            'ding.'
          ''
          '20090715'
          
            '1)   Added Checks for Custom Entries. Enties must be ex: NOTE:: ' +
            'it must be followed by 2 ::.'
          
            '      Reason for this is to keep the speed at a maximum. Allowin' +
            'g to add different symbols '
          '      can have a negative effect on speed.')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
