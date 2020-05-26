object fmAbout: TfmAbout
  Left = 342
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'About Log Express Version 3.1.4.0 (05SEP2014 - Current))'
  ClientHeight = 561
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 600
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 584
    Height = 509
    Align = alClient
    Color = clWhite
    ParentColor = False
    TabOrder = 0
    object rc1: TRichEdit
      Left = 16
      Top = 22
      Width = 553
      Height = 481
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'Log Express.'
        ''
        
          'This is a small yet powerfull External Aid for SAS log files. Th' +
          'e application uses the output log file to analyse the '
        'log file to determine what is in the log file. '
        ''
        
          'The application was designed for Windows OS (XP, Win 7, Win 8, W' +
          'in 10) and written so that it has the smallest '
        
          'possible memory footprint and that it  will require the least nr' +
          ' of external components.'
        ''
        
          'The application is distributed as is and the results were checke' +
          'd as far as possible to verify that it can act as a '
        
          'replacement for the normal SAS'#174' log. Although the application ha' +
          's been around for a while, it is by no means '
        'error or bug free. '
        ''
        
          'This SOFTWARE PRODUCT is provided by the developer "as is" and "' +
          'with all faults." The developer makes no '
        
          'representations or warranties of any kind concerning the safety,' +
          ' suitability, lack of viruses, inaccuracies, '
        
          'typographical errors, or other harmful components of this SOFTWA' +
          'RE PRODUCT. There are inherent dangers in '
        
          'the use of any software, and you are solely responsible for dete' +
          'rmining whether this SOFTWARE PRODUCT is '
        
          'compatible with your equipment and other software installed on y' +
          'our equipment. You are also solely responsible '
        
          'for the protection of your equipment and backup of your data, an' +
          'd the developer will not be liable for any '
        
          'damages you may suffer in connection with using, modifying, or d' +
          'istributing this SOFTWARE PRODUCT.'
        ''
        
          'BEFORE USING THIS SOFTWARE PRODUCT ON SERVERS, ENSURE THAT APPRO' +
          'VAL IS GAINED FROM THE '
        'ADMINISTRATOR.'
        ' '
        
          'VERY IMPORTANT: This is not OPEN SOURCE. This application may no' +
          't be sold at all. '
        
          'If you are interested in selling Log Express, please contact the' +
          ' developer via below provided email address.'
        ''
        
          'The developer reserves the right to distribute Log Express eithe' +
          'r for free or at cost to whomever I see fit.'
        ''
        
          'So please report any problems, bugs or suggestions by emailing t' +
          'he developer (Hentie du Plessis) at: '
        'hentieduplessis@outlook.com'
        ''
        'Acknowledgements: '
        'Glassbutton components: http://rmklever.com/'
        'Project-JEDI: JVCL.'
        'SynEdit: Highlighting Components.'
        
          'TKWeb: TKGrid Componenets: http://www.tkweb.eu/en/delphicomp/kco' +
          'ntrols.html')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Zoom = 100
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 509
    Width = 584
    Height = 52
    Align = alBottom
    Color = clWhite
    TabOrder = 1
  end
  object bbOk: TrkGlassButton
    Left = 223
    Top = 516
    Width = 114
    Height = 38
    AltFocus = True
    AltRender = True
    Caption = 'OK'
    Color = 8404992
    ColorDown = 8404992
    ColorFocused = 12615680
    ColorFrame = 16751157
    ColorShadow = 8404992
    ColorDisabled = clWhite
    DropDownAlignment = paLeft
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Glossy = True
    GlossyLevel = 37
    GlyphPos = gpLeft
    LightHeight = 27
    TabOrder = 2
    TextAlign = taCenter
    OnClick = bbOkClick
  end
end
