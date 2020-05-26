unit uRelease;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   rkGlassButton, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfmRelease = class(TForm)
    Panel1: TPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    memCurrent: TMemo;
    CategoryPanel2: TCategoryPanel;
    memPrev: TMemo;
    CategoryPanel3: TCategoryPanel;
    memMap: TMemo;
    bbClose: TButton;
    procedure bbCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRelease: TfmRelease;

implementation

{$R *.dfm}

procedure TfmRelease.bbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRelease.FormCreate(Sender: TObject);
begin
  memPrev.Lines.Clear;
  memPrev.ReadOnly := true;
  memPrev.ScrollBars := ssBoth;

//  gpbCurrent.Caption := 'Version 4.0.0.0 (30SEP2015 - Current)';

  with memCurrent do begin
    Lines.Clear;
    Lines.Clear;
    lines.Add('30SEP2015 - [C] Major updates and porting code to XE10.');
    lines.Add('             Split log reading and Read compares. Read compares will form part of a larger project.');
    lines.Add('             Removed all old redundant code.');
    lines.Add('             Redesigned the Read Log Folder functionality.');
    lines.Add('             Added the batch parameter to allow a person to run it from the command prompt,');
    lines.Add('             the results of the reading via batch is saved in the directory of the log file.');
    lines.Add('             The problem is that the reading process can be so fast that it appears that nothing has happened.');
    lines.Add('             Added User Rules that will enable a user to add his own rules. STD rules are still in place and these cannot change.');
    lines.Add('             Redesigned the Read log folder layout to give it a more modern look and feel.');
    lines.Add('             Made minor performance improvements for the reading of the log files,');
    lines.Add('             the test file containing 377418 lines now takes 2sec to complete.');
    lines.Add('             You can now save select results for a single file. This is done on the main menu.');
    lines.Add('             Added GridSort capabilities to The Details Windows. Implemented TKGrid to accomplish this.');
    lines.Add('             The export of the Log results is now done to an XML file that is readable with Excel 2007 and up.');
    lines.Add('             Including various bug fixes');
    lines.Add('             Including various bug fixes');
    lines.Add('30SEP2015 - [C] Major updates and porting code to XE10.');
    lines.Add('                Split log reading and Read compares. Read compares will form part');
    lines.Add('                of a larger project.');
    lines.Add('                Removed all old redundant code.');
    lines.Add('                Redesigned the Read Log Folder functionality.');
    lines.Add('                Added the batch parameter to allow a person to run it from the command prompt.');
    lines.Add('                Added User Rules that will enable a user to add his own rules. STD rules are still in place.');
    lines.Add('                Added GridSort capabilities to The Details Windows. Implemented TKGrid to accomplish this.');
    lines.Add('                You can now save select results for a single file. This is done on the main menu');
    lines.Add('                Added export of the Log results is now done to an XML file that is readable with Excel 2007 and up.');
    lines.Add('                The note Numeric variables in the input data set will be converted to character in the output data set was');
    lines.Add('                not reported it is added and falls under conversion.');
    lines.Add('                      NOTE: Numeric variables in the input data set will be converted to character in the output data set.');
    lines.Add('                The previous Read from folder has been significantly enhanced and now houses the compact view.');
    lines.Add('                Compact view is a significant trim down version combining the Read single file and read folder functionality.');
    lines.Add('                As it is a trimmed down version there are certain things that is not avaliable.');
    lines.Add('                Redesigned the Release Form. Nothing major.');
    lines.Add('           [C1] Move the refreshing code for the counters as a default after the operation is completed to ensure that');
    lines.Add('                no information is left out.');
    lines.Add('13NOV2016 -  Ported the Code to newer Delphi version.');
    lines.Add('             Removed the Jedi Components');
    lines.Add('25MAR2017 - [D1] Fixed a memory leak.');
    lines.Add('            [D2] Added Monitor Files.');

  end;

  with memMap do begin
    Lines.Clear;
    Lines.Clear;
    lines.Add('14FEB2016 - Folder File monitor. A folder is indentified to Read the log files.');
    lines.Add('            As the files change they are read. Current Status: Investigating.');
    lines.Add('          - Move all code to objects to make future updates easier. Current status: Ongoing');
    lines.Add('          - Enhance reporting. Current status: Not started.');
    lines.Add(' ');
  end;


  with memprev do begin
    Lines.Clear;
    lines.Add('19SEP2014 - [B 40] Fixed a bug where Exceptions was generated when simply closing the save dialog');
    lines.Add('            [B 41] Fixed a bug where the dialog was hidding behind the LogFolder form');
    lines.Add('            [B 42] Added Coloring to the Checklist for the Readlog Folders. If a log file is clean the');
    lines.Add('                   Color will be Green. If there are issue is till be Red.');
    lines.Add('            Updated the fonts to enhance readability.');
    lines.Add('05SEP2014 - [B 38] Added functionality to view a selected files information only.');
    lines.Add('            [B 39] Fixed a bug where the combined record did not get populated');
    lines.Add('                   for the compare readings.' );
    lines.Add('             The compare Read received some minor updates ingeneral and should be more stable' );
    lines.Add('03JAN2013 - [B 36] Fixed a nasty bug where the lables during Folder reading did not update correctly.');
    lines.Add('                     It only effected the Folder reading.');
    lines.Add('            [B 37] Fixed a problem with the Clear Row.');
    lines.Add('05DEC2012 - [B 35] Fixed a bug where you are allowed to select another filter while the other operation was on going');
    lines.Add('26SEP2012 - [B 34] Fixed bug where the Read Select Section did not refresh its counter.');
    lines.Add('20SEP2012 - [B 29] Made small adjustments to the ReadLog function to increase speed by a few ms per read');
    lines.Add('                   Made code adjustments to the ReadLogfolder to increase the speed when reading a folder');
    lines.Add('            [B 30] Removed the lbstatus label on the log folder. The increase in speed made this irrelevant');
    lines.Add('                   plus the removing of this also increased the speed even further.');
    lines.Add('                   Moved the Progress update inside the mod code and it resulted in an increase in overall speed as well.');
    lines.Add('                 All changed resulted in 929 files being read in 14s, prev it was 28s');
    lines.Add('            [B 31] Added Annotation Notes to the ERROR section');
    lines.Add('            [B 32] Added Printchecks to print a list of what the program has scanned for');
    lines.Add('            [B 33] Updated the logic for the LogFolder Grid. when a stop was requested instead of it saying that');
    lines.Add('                   it was done reading it will now say reading stopped to be more accurate with what as happened.');
    lines.Add('08SEP2012 - [B 19] Added new functionality to customize the log output even more.                               ');
    lines.Add('                    You can specify the location and add more details                                           ');
    lines.Add('            [B 20] Changed the display units from sec to msec when the sec count is = 0.                        ');
    lines.Add('            [B 21] Fixed the display width of the descr that was too small.                                     ');
    lines.Add('            [B 22] Implemented the Close code for the log file                                                  ');
    lines.Add('            [B 23] Fixed the closed event to ensure the form is returned to the correct reset state.            ');
    lines.Add('            [B 24] Made improvements to the compare output.                                                     ');
    lines.Add('            [B 25] Send the application to the task bar and tray.                                               ');
    lines.Add('            [B 26] Fixed a bug in the uDatetime to make sure that different date formats are handle correctly.  ');
    lines.Add('            [B 27] Added Stop function to the Read Compares.                                                    ');
    lines.Add('            [B 28] Added work around code for the MainTaskbar=True that caused the secondary forms to be hidden.');
    lines.Add('05SEP2012 - [B 18] Fixed the problem where the initial loading of Read select took a very long time to load.    ');
    lines.Add('09AUG2012 - [B 13] Made small changes to the Build Tree section that took a rather long time to build');
    lines.Add('            [B 14] Fixed a bug where the StringGrid allowed multiple clicks and caused errors.');
    lines.Add('            [B 15] Read Folders: Fixed a error where an AV occurred when the Page change fire.');
    lines.Add('            [B 16] Improved the details loading section. Loading cause AVs under certain circumstances         ');
    lines.Add('            [B 17] Fixed the new entries Details Screen location - Was not implemented.                         ');
    lines.Add('20JUL2012 - [B 12] Fixed a problem with the Read Compares where it gave false readings showing');
    lines.Add('                   a file does not compare when in fact it does compare');
    lines.Add('                   Made minor adjustments to the Read Compares UI to better fit in with the');
    lines.Add('                   overall look of the program.) ');
    lines.Add('Updated certain parts of the UI to take advantage of the new themese for a better look and feel');
    lines.add('04APR2012 - [B 11] Added new functionality to enable the displaying of the Top bar like SELA you to have                       ');
    lines.add('                   This is done through form manipulation. The new side bar is still there.                                    ');
    lines.add('                   Fixed the problems that exisited when using the display information. When you clicked on it once.           ');
    lines.add('                   it was there. to view another section you had to click and click again.                                     ');
    lines.add('24MAR2012 -        Made some minor bug fixed centering around the UI and User experience.                                      ');
    lines.add('                   Log Folder (Read Selective Files) has been changed so that it automatically refreshes when you enter the tab');
    lines.add('                   - When clicking on the Result Grid nothing happened you had to navigate to the Details.                     ');
    lines.add('                   - The Locations Grid has been enhanced so that Duplicate folders are excluded.                              ');
    lines.add('                   - You can select a Grid entry and that will be used as the initial location                                 ');
    Lines.Add('01MAR2012 -        Enhanced the workings of the Grid in the Read Folders.');
    Lines.Add('                   Changed the UI a bit to make it easier to use and maximize space.');
    Lines.Add('29JAN2012 - [B 9]  Implemented new code to allow the draging of Borderless forms.');
    Lines.Add('31JAN2012 - [B 10] Fixed a bug where when multiple files are read and you filter an Error is generated.');
    Lines.Add('04JAN2012 - [B 4]  Added new Compare and Not Compare sections to make it easier to spot');
    Lines.Add('                   what compared and what did not compare.');
    Lines.Add('                   Also added Colors Green when a file compares and Red when it does not compare.');
    Lines.Add('            [B 5]  Added new reporting for the compares and not compares. All files are now');
    Lines.Add('                   exported as RTF Files.');
    Lines.Add('            [B 6]  Added new feature to allow you to open the file location directly from the program.');
    Lines.Add('05JAN2012 - [B 7]  Implemented the click events to show and hide the Details screen from one place');
    Lines.Add('            [B 8]  Fixed a bug where There were 146 observations read from the data set WORK.REFLIST. was only');
    Lines.Add('                   displayed as 46 obs.');
    Lines.Add('03JAN2012 - [B 1]  Fixed a bug where the buildlist which included the file date did not  ');
    Lines.Add('                   exclude the date when reading a file.');
    Lines.Add('            [B UI] Added Last DD read to the side bar');
    Lines.Add('            [B 2]  Fixed an irritating bug where a missing row was read.');
    Lines.Add('            [B 3]  Fixed the Bug where the Secondary menus were not on top.');
    Lines.Add('28DEC2011 - BETA');
    Lines.Add('Major Reworking.');
    Lines.Add('Migrate code to new Version. Made a lot of code changes. There has been an increase in the file size.');
    Lines.Add('Internal Code - Removed redundant code');
    Lines.Add('              - Moved certain code into classes to allow better expasion');
    Lines.Add('              - Fixed potential memory leaks causing an increase in memory usage.');
    Lines.Add('              - There were cases where Case played a role in the String Comparison. Fixed this.');
    Lines.Add('              - Added more error handling.');
    Lines.Add('General UI    - Added better buttons to give a Win7 Look');
    Lines.Add('              - Added new componenets for the Log View.');
    Lines.Add('              - Added and Replaced STD components with better looking comps. As part of the migration');
    Lines.Add('Dropped the traditional View located at the top and replaced with a more intergrated display');
    Lines.Add('New View  - Part of the form or the whole Form can be hide');
    Lines.Add('          - The top View was in a sense moved to the left the Only counts that was found is displayed.');
    Lines.Add('          - The display Grid can be activate from here as well');
    Lines.Add('Replaced the the Labels with a String Grid that was more expansion possibilities.');
    Lines.Add('          - Added better keyboard support via the String Grid');
    Lines.Add('Add BETA code for Checking of Compares');
    Lines.Add('Ini file is now stored in the User Profile to allow for better sharing on servers.');
    Lines.Add('Log Folder - Removed information Labels and replaced with a String Grid');
    Lines.Add('           - Replaced single path to allow multiple paths to be read.');
    lines.Add('           - Made changes to the UI to make it more appealing.');
    Lines.Add('           - Added new Export functionalities which is better and time stamped');
    Lines.Add('           - Added new Export functionalities which is better and time stamped');
	  Lines.Add('Version 3.0.0.1 (11APR2011 - 27DEC2011');
    Lines.Add('11APR2011');
    Lines.Add('[191] Added an additional check for the ReadLog. It will only execute if the FileExists');
    Lines.Add('[192] Moved the "WARNING: Unable to copy SASUSER registry to" to All Others. The reason');
    Lines.Add('      for this is that this WARNING is expected when there`s batching of multiple files');
    Lines.Add('      taking place.');
    Lines.Add('');

    Lines.Add('24FEB2011');
    Lines.Add('[189] Fixed a small memory leak when reading the ini file');
    Lines.Add('[190] A lot of bug fixes and implementation of better handling of errors');
    Lines.Add('      Fixed the problems with the options form.');
    Lines.Add('      Made adjustments to the View Switcher. An error was generated from time to time');
    Lines.Add('      The circumstances differed greatly, and could not always be reproduced.  ');
    Lines.Add('      Invalid Erros was incorrectly "filed" under Invalid notes. This has been fixed.');
    Lines.Add('');
    Lines.Add('6FEB2011');
    Lines.Add('[185] Added a Pin option to the Details Window so that you can at least have');
    Lines.Add('      an option to have the form on top always or not.');
    Lines.Add('      Removed the Always on top from the Log file');
    Lines.Add('[186] Fixed a bug with the RESET button on the Read Log Folder. When opening it up');
    Lines.Add('      and pressing reset it populates the previous read file. The previous file also');
    Lines.Add('      does have a purpose. Fixed the code so that this does not happen.');
    Lines.Add('      Also the RESET did not work properly, it enabled the Build List on the Read All TAB');
    Lines.Add('[187] An array that was to contain only 1 entry was initialzed, to prevent any memory leaks.');
    Lines.Add('[188] Added the Options Form so as to have a central place to keep settings.');
    Lines.Add('');

    Lines.Add('20JAN2011');
    Lines.Add('[182] Fixed the bug where when an empty file is read an Error came up.');
    Lines.Add('[183] Suspect that theres a timing issue causing certain reading opertions');
    Lines.Add('      to fail. Added a 20msec pause to try and circumvent this problem');
    Lines.Add('[184] Fixed a bug caused by the DAT File reading implementation. The application.processmessage');
    Lines.Add('      did not take into account if the process is still busy.');
    Lines.Add('');

    Lines.Add('12DEC2010');
    Lines.Add('[181] Added an option where by you can switch of the Display log');
    Lines.Add('');
    Lines.Add('8DEC2010');
    Lines.Add('[180] Made changes to the loading of the log file. It use to display directly');
    Lines.Add('      from the file it was reading, but when the file is still in use it caused');
    Lines.Add('      problems. LoadFromStream failed to display any info. Implemented a work');
    Lines.Add('      around in the mean time.');
    Lines.Add('');

    Lines.Add('26NOV2010');
    Lines.Add('[178] Added a progress bar for the populating of the file.');
    Lines.Add('[179] The Progress bar for the details did not reset to 0.');
    Lines.Add('');

    Lines.Add('16OCT2010');
    Lines.Add('      Working the whole read procedure. All clientdatasets have been dropped in favor of dat files.');
    Lines.Add('      The clientdataset files with EXTREMELY Large files 600000+ lines caused memory issues.');
    Lines.Add('      Memory was not being freed after a new smaller file was read. Memory became a very big concern');
    Lines.Add('      and it was visible that as the number of lines came to about 250000+ the reading processes started to slow down.');
    Lines.Add('      Files was split but this solved the speed degradation a bit, but it did not solve memory issues.');
    Lines.Add('      It had all the hallmarks of a memory leak but this was not the case. CDS are kept in memory to speed up processing for retrieval,');
    Lines.Add('      but with EXTREMELY large files this was a problem and since data is only used for retrieval the CDS became useless.');
    Lines.Add('      Switching to DAT files will reduce the file size and eliminate the need for the MIDAS.dll');
    Lines.Add('      since also eliminating the potential dll registration errors.');
    Lines.Add('---------------------------------------------------------------------------------------------------------------------------------------------------');

    Lines.Add('Version 2.8.0 (27MAR2010 - 15OCT2010');
    Lines.Add('[172] Added additional checking for the Read Module. There were cases if the file was');
    Lines.Add('      being created or updated the file date would be set, if the operation failed it did not');
    Lines.Add('      reset the date. This has been updated.');
    Lines.Add('[173] Made changes to the Filestream to try and enable the application to read from the log file');
    Lines.Add('      as it is been created. Initial tests shows it was successfull');
    Lines.Add('[174] Split some of the Sections (notes, Custom, All others) into there own files these tend to be');
    Lines.Add('      types that have a lot of info and also seems to be causing speed degredation as the files');
    Lines.Add('      start to fill up. The test file has 68000 lines and reading was done in 2 sec.');
    Lines.Add('      (Test PC Specs is 2.4 512MB) Should be faster on newer machines');
    Lines.Add('[175] Fixed a bug where when you select a different file to read, it does not activate. The timer was');
    Lines.Add('      switched off and never switched back on again.');
    Lines.Add('[176] The All Other was not filtering on the LogFolders.');
    Lines.Add('[177] Added a progress bar to the loading of the details. It did not look good if you click on a section');
    Lines.Add('      and you wait and wait and nothing happens. It gave the idea that the application was hanging.');
    Lines.Add('      This was especially true in cases where the log file was extremely big (31MB).');
    Lines.Add('');
    Lines.Add('05JUN2010');
    Lines.Add('[168] Added additional cvode that will hopefully solve the problem with the StayonTop of the');
    Lines.Add('      Classic View');
    Lines.Add('[169] Added a label to display the Filtering thats been applied in the ReadLogFolder');
    Lines.Add('[170] Added new functionality that aims to make the information displayed as current as possible.');
    Lines.Add('      if you have the display window open. Previously the information remained static. The information');
    Lines.Add('      is refreshed as it comes in.');
    Lines.Add('');
    Lines.Add('23MAY2010');
    Lines.Add('[165] Fixed an AV that popup when reading a log folder, initailly and is ok once you read it again.');
    Lines.Add('[166] Fixed a bug where by the in filter selection, a selected text didnt load the log file.');
    Lines.Add('      Algorithm didnt take into account the filterings layout');
    Lines.Add('[167] Implemented new Stay on top Routines for the Extended as well as the classice view');
    Lines.Add('');
    Lines.Add('16APR2010');
    Lines.Add('[1] Implemented an alternative view that can be used. The original main menu remains');
    Lines.Add('    this is only and alternative method of viewing the info.');
    Lines.Add('[2] Change the application Icon to a more relevant one.');
    Lines.Add('[3] Fixed a bug with the Read Selective where when you select a single file');
    Lines.Add('    it did not always read the file. It just skipped it.');
    Lines.Add('[4] Noticed that theres a massive speed difference on bigger files between the ReadFolder and');
    Lines.Add('    The ReadlogFile section. This is because of the info that is stored. As the file size increases the time it takes');
    Lines.Add('    To commit the changes to the file increases. ');
    Lines.Add('[5] Made some changes to the UI. Gave it a more XP look. It increased the Application size but,');
    Lines.Add('    memory usage seems to be the same. ');

    Lines.Add('');
    Lines.add('27MAR2010');
    Lines.Add('[1] Fixed a bug where the Filter did not work correctly. The first OBS was ignored');
    Lines.Add('    thus only displaying a half truth.');
    Lines.Add('    Also fixed a small bug in the tree populattion, that gave the first file by default');
    Lines.Add('    and then gave the same file again with the information');
    Lines.Add('[2] Disabled the page control and build file list button while reading is in progress');
    Lines.Add('    There was an out of memory error that might have happened as a result of this.');
    Lines.Add('[3] Fixed a problem where the log files display was a bit screwed up.');
    Lines.Add('[4] Fixed the Progress display that display both bars, when only one was needed');
    Lines.Add('[5] Replaced the RichEdit with a memo component this fixed a strange problem, where the');
    Lines.Add('    goto line for some reason did not always work correctly.');
    Lines.Add('[6] Made some additional Updates to the Reading process. The test file size had to be increased');
    Lines.Add('    from 6400 lines to 25000 lines. 25000 are now read on average in 1 sec.');
    Lines.Add('[7] Implemented Import and Export functions for Timing and Analyze functions.');
    Lines.Add('[8] Made some changes so that the functionality goes faster');

    Lines.Add('---------------------------------------------------------------------------------------------------------------------------------------------------');
    Lines.Add('Version 2.7.5.0 (02DEC2009 - 25MAR2010)');
    Lines.Add('20100311');
    Lines.Add('[1] Added the ability to save and reopen a readlist');
    Lines.Add('[2] Added Select all and Unselect all to the Checklist');
    Lines.Add('[3] Put a Fixed top position for the FolderRead to ensure that the top bar is always visible.');
    Lines.Add('[4] Change the select label to a speedbutton, to make seeing it easier. Change the caption to Menu');
    Lines.Add('');

    Lines.Add('20100310');
    Lines.Add('[1] Fixed a bug where the unintiliazided was displaying in the Drop downs');
    Lines.Add('[2] Added new functionality where by you can now select a range of files to read');
    Lines.Add('    you dont have to read a whole folder anymore you can select specific files to read.');
    Lines.Add('');

    Lines.Add('20100302');
    Lines.Add('[1] Fixed a bug where by the top node could be selected and it generated an exception.');
    Lines.Add('[2] Replaced the While loop with For. Increased performance by about 40%.');
    Lines.Add('    Test file size 6350 lines down from 6s to 4s.');
    Lines.Add('[3] An option has been added to enable you to clear the selection for the Folder Read.');
    Lines.Add('[4] Fixed a nasty bug where the icase variable was not cleared  initialized. this caused incorrect allocation.');

    Lines.Add('');
    Lines.Add('20100228');
    Lines.Add('[1] Implemented a Find Dialog for the log file.');
    Lines.Add('[2] When the Read now button was pressed very fast, the files information got buffered and the counts doubled.');
    Lines.Add('[3] Removed the OnChange event for the Tabsheets, since it caused big delayes on big log files having to reanalyse.');
    Lines.Add('    Changed it to on demand so as to avoid wasting time.');
    Lines.Add('[4] Implemented Filter of the Log folder');
    Lines.Add('[5] Added a option to Apply formatting to the Log file or not.');
    Lines.Add('[6] Made minor changes to the Readlogfile function to make it simpler');
    Lines.Add('[7] Made minor changes to the Interface of Read Log folder');
    Lines.Add('');
    Lines.Add('20100223');
    Lines.Add('[1] Changed the filtering so that you can only click on the label and the filter will get applied to te Tree');
    Lines.Add('    It is still the same as the previous selections. NOTE: It not 100% bug free.');
    Lines.Add('[2] Fixed a bug where the display log generated errors when wanting to view the entry in the log file.');
    Lines.Add('');
    Lines.Add('20100222');
    Lines.Add('[1] Changed the layout of the Floc. Added a Read Now so that you can read the log file from a specific');
    Lines.Add('    location and read that log file now.');
    Lines.Add('[2] Fixed a bug where the other label did revert back to a white color as the default when no color was selected.');
    Lines.Add('');
    Lines.Add('20091202');
    Lines.Add('[1] Added All other Notes section: for W.D Format notes.');
    Lines.Add('[2] Added Expand and Collapse all to the Tree view.');
    Lines.Add('[3] Fixed the problem with the Tree population, that populated incorrectly');
    Lines.Add('[4] Added an additional LogView Form. Using one caused problems. This is just a work around');
    Lines.Add('[5] The Warning for SAS that expires has been supressed');
    Lines.Add('');
    Lines.Add('20091211');
    Lines.Add('[1] The process message will only be activated evey 250 lines. This helped to save some time');
    Lines.Add('[2] Changed the algorithm to be as fast as possible replace alot of the if s with case');
    Lines.Add('    added more conditions to the exclusion list, when a line is to be skipped. The increase in performance');
    Lines.Add('    should be seen when processing large files containing a lot of macro code. The line is now only processed');
    Lines.Add('    if it starts with a [n i e w] and is not missing.');

    Lines.Add('Version 2.7.4.0');
    Lines.Add('20090909');
    Lines.Add('[1] Fixed a problem in Logfolder where the Tree was not populated correctly at certain times');
    Lines.Add('[2] Changed the way the Log file is displayed when a new log is read. Previously it always displayed');
    Lines.Add('    the beginning but it made more sense to display the last.');
    Lines.Add('[3] Made minor changes to the colors to stand out more.');
    Lines.Add('');
    Lines.Add('20090804');
    Lines.Add('1)   Implemented a stop procedure usefull when reading big files.');
    Lines.Add('2)   Fixed a bug where merge notes was read but not counted.');
    Lines.Add('3)   Made minor changes to the UI for Folder Read.');
    Lines.Add('4)   Removed the line formatting as it caused a long time delay.');
    Lines.Add('     This is a temp work around while a more effective method is being looked at.');
    Lines.Add('5)   Fixed a problem where the wrong line was set relative to what was choosen.');
    Lines.Add('6)   Fixed a problem where the popup menu was not activated when clicking on the NOTES.');
    Lines.Add('7)   Added Table notes from SQL to the DD OBS label.');
    Lines.Add('');
    Lines.Add('20090727');
    Lines.Add('1)   Made changes to the read procedure to increase speed further');
    Lines.Add('2)   Fixed a problem where not all controls were disables during reading. This cause the counters to reset.');
    Lines.Add('3)   Removed the lightshandle as it cause a increase in time reading.');
    Lines.Add('');
    Lines.Add('20090715');
    Lines.Add('1)   Added Checks for Custom Entries. Enties must be ex: NOTE:: it must be followed by 2 ::.');
    Lines.Add('     Reason for this is to keep the speed at a maximum. Allowing to add different symbols');
    Lines.Add('     can have a negative effect on speed.');
    Lines.Add('');
    Lines.Add('---------------------------------------------------------------------------------------------------------------------------------------------------');
    Lines.Add('Version 2.7.3.0');
    Lines.Add('20090606');
    Lines.Add('1)   Added Checks for Format Failures. Made it part of the invalid section.');
    Lines.Add('2)   Made a few changes to increase the reading process. There seems to be at least a 50% increase in speed.');
    Lines.Add('     (Orginal: 546 lines in 10s, Current: 546 lines 1s)');
    Lines.Add('3)   uDetails - Added Code to make the "popup" forms appear a bit better and to allow for better interaction.');
    Lines.Add('4)   Added and indicator to show if and when there are "stuff" that requires a users attention.');
    Lines.Add('5)   Made changes to the FormPaint code to try and prevent the Flickering when another form moves over it.');
    Lines.Add('6)   Removed the Stay On Top Menu option.');
    Lines.Add('7)   Made changes to the Resize code. Set the Constraint.MaxHeight. Application did not resizes correctly when minimizing it and then restoring it.');
    Lines.Add('8)   Made changes when a log file is formatted, when loading. Loading time decreased significantly.');
    Lines.Add('9)   Changed the label of the stats to show how many lines was read and how much time it took to read.');
    Lines.Add('10)  The Indicator will now only be flickering for 20sec.');
    lines.Add('');
    Lines.Add('---------------------------------------------------------------------------------------------------------------------------------------------------');
    Lines.Add('Version 2.7.2.0');
    Lines.Add('1)   Added additional code to solve the problem of the STAYONTOP');
    Lines.Add('2)   Made minor changes to the UI so as to attrack attention that it is busy reading the log file.');
    Lines.Add('3)   Added additonal code so as to display the last DD that was created.');
    Lines.Add('4)   Added The drop down for Data Sets.');
    Lines.Add('5)   Made changes to the GUI.');
    Lines.Add('6)   Shrank everything to size 11.');
    Lines.Add('7)   Added Log Folder Reading.');
    Lines.Add('8)   Moved certain code to universal unit.');
    Lines.Add('9)   Implemented a Progress form.');
    Lines.Add('10)  Implemented code to prevent the Display from being clicked multiple times when the log file is big causing the application to read the log file over and over. Progress bar aid in this.');
    Lines.Add('11)  Moved the copied file so that it is in the applications location.');
    Lines.Add('12)  Made changes to the UI');
    Lines.Add('13)  Implemented Major changes to the Readfolder that will allow you to go from the list of errors directly to the log file.This is done from the tree.');
    Lines.Add('14)  Made minor changes to the stayon top. Whenever setting the stay on top, first remove it and then up it back.');
    Lines.Add('15)  Removed the GRAYED from the Check box.');
    Lines.Add('16)  Enlarged the Checkbox for the files read.');
    Lines.Add('17)  The StayonTop issues seems to have been resolved - At last. (FormPaint)');
    Lines.Add('18)  Made changes to the Log Folder. Set all Dynamic Arrays = nil. It caused problems when it runned the 2nd time around.');
    Lines.Add('19)  You can now click on certain lables that might have an effect on the results in the logread to see what files contains this specfic entry.');
    Lines.Add('20)  Changed the applications name to SELA and changed the icon as well.');
    Lines.Add('21)  Changed the Colors on/off to retain the setting after application shutdown.');
    Lines.Add('22)  Fixed the Progress Bar that did not work');
    Lines.Add('23)  Removed the checkbox - Read Subfolders.');

  end;

end;

end.

