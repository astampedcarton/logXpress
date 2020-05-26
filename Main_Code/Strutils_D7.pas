{*******************************************************}
{                                                       }
{         Delphi VCL Extensions (RX)                    }
{         Copyright (c) 1995, 1996 AO ROSNO             }
{         Copyright (c) 1997, 1998 Master-Bank          }
{                                                       }
{         This unit based on AlexGraf String Library    }
{         by Alexei Lukin (c) 1992                      }
{                                                       }
{         Patched by Almaz Sharipov                     }
{                                                       }
{*******************************************************}

unit Strutils_D7;

//{$I RX.INC}
{$A+,B-,E-,R-}

interface

uses SysUtils,
  StdCtrls,
  Grids,
  ExtCtrls;

type
{$IFNDEF RX_D4}
  TSysCharSet = set of Char;
{$ENDIF}
  TCharSet = TSysCharSet;

{ ** Common string handling routines ** }
//------------------------------------------------------------------------------
//Added HDP
function IsNotEmpty(const asString : AnsiString ) : Boolean; overload;
{function added to determine if the string is empty}

function IsEmpty(const asString : AnsiString ) : Boolean; overload;
{function added to determine if the string is empty}

function ReturnCode(const asString : AnsiString; cDelimiter : Char) : AnsiString;
{function added to return the first chars in a string until before the cDelimiter}

//function NextString(var asStr : Ansistring; cChar : Char) : Ansistring;
{function to get the nextstring from a CSV format}

function CSVStr(var asString : Ansistring) : Ansistring;

function TrimStrleft(sStr : String; iNrChar : integer) : string;
{function to trim the string to "move" to the next string of the csv format}

//function CountCSVDelimit(sStr : String ; cChar : Char) : integer;
{funtion to count the nr of commas in the string}

function StrToBool(const sStr : Ansistring) : Boolean;
{function to convert a string to Boolean. Make 100% sure that you use this function with Boolean values;}

function BoolToStr(const bV : Boolean) : String;
{function to convert a Boolean value to String only the 1st Char}

function BoolToWhStr(const bV : Boolean) : String;
{function to convert a Boolean value to String}

function BoolToInt(const bv : Boolean) : Integer;
{function to convert a Boolean value to Integer}

function IntToBool(const iv : Integer) : Boolean;
{function to convert a Integer value to Boolean}

function FillStrB(sStr : String; iReqSize : longint) : String;
{function will be used to add zeros to the front of a string that is to short}

function FillStrFw(sStr : String; iReqSize : longint) : String;
{function will be used to add zeors to the back of s string is to short}

function IsWeekend(dtDate : TDatetime) : boolean;
{function will check if the day is a weekend or not}

function IsSaturday(dtDate : TDatetime) : boolean;
{function will check if the day is a Saturday}

function IsSunday(dtDate : TDatetime) : boolean;
{function will check if the day is a Sunday}

function StrDayofWeek(iDay : longint) : Ansistring;
{function will return the string value of the day of week}

function IntDayOfWeek(sWord : String) : Integer;
{function will return the integer value of the day of week}

function StrMonthName(iMonth : Longint) : Ansistring;
{function returns the Months name }

function MonthStrshortName(asmnth : string) : integer;
{ returns the integer values of the short format month}

function MonthStrlongName(asmnth : string) : integer;
{ returns the integer values of the long format month}

function UnstringCombo(asStr : string) : String;
{function will return just the code on the left side of the -}

function UnstringRCombo(asStr : string) : String;
{function will return just the code on the left side of the -}

function CheckParameters(asStr : Ansistring) : Ansistring;
{function will make sure parameters passed through are correct and that it
doesn't contain any unnecessarry trailing ',' the function can be expanded}

function UnstringStr(asStr : string; sChr : String) : Ansistring;

function UnstringDate(dtdate : TDatetime) : String;

function UnstringdateTime(dtDate : TDatetime) : String; //1

//function DecodeDate(dtDate : TDatetime) : String; //1

function TrimAfterChar(asFile, asChar : AnsiString) : Ansistring;

function GenerateNr(asNr : Ansistring; iNr : Integer; iLen : integer; iIDLen : Integer) : Ansistring;
{generates a customer nr or nr that can be used as a primary key}

function DelMidSpaces(asStr : Ansistring) : Ansistring;
{deletes all spaces in a string}

function IsInt(val : String) : integer;
{Test if a value is numeric or not.}

function IsStrANumber(const S: string): Boolean;
{Check if a value is numeric or not)

function Makenum(sString : String) : String;

function StrReverse( var S: String ) : string;

function UnstringTime(sVal : String; var hr, min : Integer) : integer;

procedure Clears(grid : TStringGrid);


//------------------------------------------------------------------------------
function StrToOem(const AnsiStr: string): string;
{ StrToOem translates a string from the Windows character set into the
  OEM character set. }

function OemToAnsiStr(const OemStr: string): string;
{ OemToAnsiStr translates a string from the OEM character set into the
  Windows character set. }

function IsEmptyStr(const S: string; const EmptyChars: TCharSet): Boolean;
{ EmptyStr returns true if the given string contains only character
  from the EmptyChars. }

function ReplaceStr(const S, Srch, Replace: string): string;
{ Returns string with every occurrence of Srch string replaced with
  Replace string. }

function DelSpace(const S: string): string;
{ DelSpace return a string with all white spaces removed. }

function DelChars(const S: string; Chr: Char): string;
{ DelChars return a string with all Chr characters removed. }

function DelBSpace(const S: ansistring): ansistring;
{ DelBSpace trims leading spaces from the given string. }

function DelESpace(const S: string): string;
{ DelESpace trims trailing spaces from the given string. }

function DelRSpace(const S: string): string;
{ DelRSpace trims leading and trailing spaces from the given string. }

function DelSpace1(const S: string): string;
{ DelSpace1 return a string with all non-single white spaces removed. }

function Tab2Space(const S: string; Numb: Byte): string;
{ Tab2Space converts any tabulation character in the given string to the
  Numb spaces characters. }

function NPos(const C: string; S: string; N: Integer): Integer;
{ NPos searches for a N-th position of substring C in a given string. }

function MakeStr(C: Char; N: Integer): string;
function MS(C: Char; N: Integer): string;
{ MakeStr return a string of length N filled with character C. }

function AddChar(C: Char; const S: string; N: Integer): string;
{ AddChar return a string left-padded to length N with characters C. }

function AddCharR(C: Char; const S: string; N: Integer): string;
{ AddCharR return a string right-padded to length N with characters C. }

function LeftStr(const S: string; N: Integer): string;
{ LeftStr return a string right-padded to length N with blanks. }

function RightStr(const S: string; N: Integer): string;
{ RightStr return a string left-padded to length N with blanks. }

function CenterStr(const S: string; Len: Integer): string;
{ CenterStr centers the characters in the string based upon the
  Len specified. }

function CompStr(const S1, S2: string): Integer;
{ CompStr compares S1 to S2, with case-sensitivity. The return value is
  -1 if S1 < S2, 0 if S1 = S2, or 1 if S1 > S2. }

function CompText(const S1, S2: string): Integer;
{ CompText compares S1 to S2, without case-sensitivity. The return value
  is the same as for CompStr. }

function Copy2Symb(const S: string; Symb: Char): string;
{ Copy2Symb returns a substring of a string S from begining to first
  character Symb. }

function Copy2SymbDel(var S: string; Symb: Char): string;
{ Copy2SymbDel returns a substring of a string S from begining to first
  character Symb and removes this substring from S. }

function Copy2Space(const S: string): string;
{ Copy2Symb returns a substring of a string S from begining to first
  white space. }

function Copy2SpaceDel(var S: string): string;
{ Copy2SpaceDel returns a substring of a string S from begining to first
  white space and removes this substring from S. }

function AnsiProperCase(const S: string; const WordDelims: TCharSet): string;
{ Returns string, with the first letter of each word in uppercase,
  all other letters in lowercase. Words are delimited by WordDelims. }

function WordCount(const S: string; const WordDelims: TCharSet): Integer;
{ WordCount given a set of word delimiters, return number of words in S. }

function WordPosition(const N: Integer; const S: string;
  const WordDelims: TCharSet): Integer;
{ Given a set of word delimiters, return start position of N'th word in S. }

function ExtractWord(N: Integer; const S: string;
  const WordDelims: TCharSet): string;
function ExtractWordPos(N: Integer; const S: string;
  const WordDelims: TCharSet; var Pos: Integer): string;
function ExtractDelimited(N: Integer; const S: string;
  const Delims: TCharSet): string;
{ ExtractWord, ExtractWordPos and ExtractDelimited given a set of word
  delimiters, return the N'th word in S. }

function ExtractSubstr(const S: string; var Pos: Integer;
  const Delims: TCharSet): string;
{ ExtractSubstr given a set of word delimiters, return the substring from S,
  that started from position Pos. }

function IsWordPresent(const W, S: string; const WordDelims: TCharSet; var Position: Integer): Boolean;
{ IsWordPresent given a set of word delimiters, return True if word W is
  present in string S. }

function QuotedString(const S: string; Quote: Char): string;
{ QuotedString returns the given string as a quoted string, using the
  provided Quote character. }

function ExtractQuotedString(const S: string; Quote: Char): string;
{ ExtractQuotedString removes the Quote characters from the beginning and
  end of a quoted string, and reduces pairs of Quote characters within
  the quoted string to a single character. }

function FindPart(const HelpWilds, InputStr: string): Integer;
{ FindPart compares a string with '?' and another, returns the position of
  HelpWilds in InputStr. }

function IsWild(InputStr, Wilds: string; IgnoreCase: Boolean): Boolean;
{ IsWild compare InputString with WildCard string and return True
  if corresponds. }

{ ** Command line routines ** }

{$IFNDEF RX_D4}
function FindCmdLineSwitch(const Switch: string; SwitchChars: TCharSet;
  IgnoreCase: Boolean): Boolean;
{$ENDIF}
function GetCmdLineArg(const Switch: string; SwitchChars: TCharSet): string;

{ ** Numeric string handling routines ** }

function Numb2USA(const S: string): string;
{ Numb2USA converts numeric string S to USA-format. }

function Dec2Hex(N: Longint; A: Byte): string;
function D2H(N: Longint; A: Byte): string;
{ Dec2Hex converts the given value to a hexadecimal string representation
  with the minimum number of digits (A) specified. }

function Hex2Dec(const S: string): Longint;
function H2D(const S: string): Longint;
{ Hex2Dec converts the given hexadecimal string to the corresponding integer
  value. }

function Dec2Numb(N: Longint; A, B: Byte): string;
{ Dec2Numb converts the given value to a string representation with the
  base equal to B and with the minimum number of digits (A) specified. }

function Numb2Dec(S: string; B: Byte): Longint;
{ Numb2Dec converts the given B-based numeric string to the corresponding
  integer value. }

function IntToBin(Value: Longint; Digits, Spaces: Integer): string;
{ IntToBin converts the given value to a binary string representation
  with the minimum number of digits specified. }

function IntToRoman(Value: Longint): string;
{ IntToRoman converts the given value to a roman numeric string
  representation. }

function RomanToInt(const S: string): Longint;
{ RomanToInt converts the given string to an integer value. If the string
  doesn't contain a valid roman numeric value, the 0 value is returned. }

const
  DigitChars = ['0'..'9'];
{$IFNDEF CBUILDER}
  Brackets = ['(',')','[',']','{','}'];
  StdWordDelims = [#0..' ',',','.',';','/','\',':','''','"','`'] + Brackets;
{$ENDIF}

implementation

uses {$IFDEF WIN32} Windows {$ELSE} WinTypes, WinProcs, Str16 {$ENDIF};

//*********************************************************************************************
//Additional added
function IsNotEmpty(const asString : AnsiString ) : Boolean;
var
 asTemp : AnsiString;
begin
  asTemp := '';
  asTemp := DelBSpace(asString);
  if (length(asTemp) = 0) then begin
   result := false;
  end else begin
   result := true;
  end;
end;

function IsEmpty(const asString : AnsiString ) : Boolean; overload;
var
 asTemp : AnsiString;
begin
  asTemp := '';
  asTemp := DelBSpace(asString);
  if (length(asTemp) = 0) then begin
   result := true;
  end else begin
   result := false;
  end;
end;

function ReturnCode(const asString : AnsiString; cDelimiter : Char) : AnsiString;
var
 asReturn : AnsiString;
 iPos     : Integer;
begin
 asReturn := '';
 iPos     := 0;
 iPos     := Pos(cDelimiter, asString);
 asReturn := Copy(asString, 0, iPos-1);
 result   := asReturn;
end;

function CSVStr(var asString : Ansistring) : Ansistring;
begin
 try
//  result := NextString(asString, ',');
 except
  result := '';
 end;
end;

(*function NextString(var asStr : Ansistring; cChar : Char) : Ansistring;
var
 iLen : integer;
begin
 if asStr <> '' then begin
  if asStr[1] = cChar then begin
   NextString := '';
   asStr      := TrimStrLeft(asStr, 1);
  end else begin
   iLen := pos(cChar, asStr);
   if iLen = 0 then begin
    NextString := asStr;
    asStr      := '';
   end else begin
    NextString := copy(asStr, 1, ilen - 1);
    asStr      := copy(asStr, iLen + 1, length(asStr));
   end;
  end;
 end;
end; *)

function TrimStrleft(sStr : String; iNrChar : integer) : string;
var
 sResult : string;
begin
//  sResult := Copy(sStr, iNrChar+1, length(sStr));
  sResult := Copy(sStr, 0, iNrChar);
  result  := sResult;
end;

(*function CountCSVDelimit(sStr : String ; cChar : Char) : integer;
var
 icnt : longint;
begin
  icnt := 0;
  while sStr <> '' do begin
   NextString(sStr, ',');
   inc(icnt);
  end;
  result := icnt;
end;  *)

function StrToBool(const sStr : Ansistring) : Boolean;
var
 sTmp : string;
 ipos : longint;
begin
 if length(sStr) <= 5 then begin
  sTmp := Copy(sStr, 0, 1);
  ipos := Pos('T', sTmp);
  if iPos = 0 then begin
   ipos := Pos('t', sTmp);
  end else begin
   iPos := Pos('f', stmp);
  end;
   if iPos = 1 then begin
    result  := true;
   end else begin
    iPos := Pos('F', (sTmp));
    if iPos = 1 then begin
     result := false;
    end;
   end;
 end;
end;

function BoolToStr(const bV : Boolean) : String;
begin
  if bV then
   result := 'T'
  else
   result := 'F';
end;

function BoolToWhStr(const bV : Boolean) : String;
begin
  if bV then
   result := 'True'
  else
   result := 'False';
end;

function BoolToInt(const bv : Boolean) : Integer;
begin
  if bV then
   result := 1
  else
   result := 0;
end;

function IntToBool(const iv : Integer) : Boolean;
begin
  if iV = 1 then
   result := True
  else
   result := False;
end;

function FillStrB(sStr : String; iReqSize : longint) : String;
var
 iLen : longint;
// sTmp : String;
 iCnt : longint;
begin
 iLen := length(sStr);
 icnt := iLen;
 while icnt < iReqsize do begin
  sStr := sStr+'0';
  inc(icnt);
 end;
 result := sStr;
end;

function FillStrFw(sStr : String; iReqSize : longint) : String;
var
 iLen : longint;
// sTmp : string;
 icnt : longint;
begin
 iLen := length(sStr);
 icnt := ilen;
 while icnt < iReqsize do begin
  sStr := '0' + sStr;
  inc(icnt);
 end;
 result := sStr;
end;

function IsWeekend(dtDate : TDatetime) : boolean;
begin
 Result := DayOfWeek(dtDate) in [1, 7];
end;

function IsSaturday(dtDate : TDatetime) : boolean;
begin
 Result := DayOfWeek(dtDate) in [7];
end;

function IsSunday(dtDate : TDatetime) : boolean;
begin
 Result := DayOfWeek(dtDate) in [1];
end;

function StrDayofWeek(iDay : longint) : Ansistring;
var
 asDay : ansistring;
begin
 case iDay of
  1 : begin asDay := 'Sunday'; end;
  2 : begin asDay := 'Monday'; end;
  3 : begin asDay := 'Tuesday'; end;
  4 : begin asDay := 'Wednesday'; end;
  5 : begin asDay := 'Thursday'; end;
  6 : begin asDay := 'Friday'; end;
  7 : begin asDay := 'Saturday'; end;
 end;
 result := asDay;
end;

function IntDayOfWeek(sWord : String) : Integer;
var
 bProblem : boolean;
begin
 bproblem := false;
 if sWord = 'Sunday'    then begin result := 1; exit; end else begin bproblem := true end;
 if sWord = 'Monday'    then begin result := 2; exit; end else begin bproblem := true end;
 if sWord = 'Tuesday'   then begin result := 3; exit; end else begin bproblem := true end;
 if sWord = 'Wednesday' then begin result := 4; exit; end else begin bproblem := true end;
 if sWord = 'Thursday'  then begin result := 5; exit; end else begin bproblem := true end;
 if sWord = 'Friday'    then begin result := 6; exit; end else begin bproblem := true end;
 if sWord = 'Saturday'  then begin result := 7; exit; end else begin bproblem := true end;
 if bProblem then
  result := 8; //the result for a invalid date;
end;

function StrMonthName(iMonth : Longint) : Ansistring;
var
 asMonth : Ansistring;
begin
 case ord(imonth) of
  1 : begin asMonth := 'January';  end;
  2 : begin asMonth := 'February'; end;
  3 : begin asMonth := 'March';    end;
  4 : begin asMonth := 'April';    end;
  5 : begin asMonth := 'May';      end;
  6 : begin asMonth := 'June';     end;
  7 : begin asMonth := 'July';     end;
  8 : begin asMonth := 'August';   end;
  9 : begin asMonth := 'September';end;
  10: begin asMonth := 'October';  end;
  11: begin asMonth := 'November'; end;
  12: begin asMonth := 'December'; end;
 end;
 result := asMonth;
end;

function MonthStrshortName(asmnth : string) : integer;
var
 imonth : integer;
begin
 if uppercase(asMnth) = 'JAN' then imonth := 1
 else if uppercase(asMnth) = 'FEB' then imonth := 2
 else if uppercase(asMnth) = 'MAR' then imonth := 3
 else if uppercase(asMnth) = 'APR' then imonth := 4
 else if uppercase(asMnth) = 'MAY' then imonth := 5
 else if uppercase(asMnth) = 'JUN' then imonth := 6
 else if uppercase(asMnth) = 'JUL' then imonth := 7
 else if uppercase(asMnth) = 'AUG' then imonth := 8
 else if uppercase(asMnth) = 'SEP' then imonth := 9
 else if uppercase(asMnth) = 'OCT' then imonth := 10
 else if uppercase(asMnth) = 'NOV' then imonth := 11
 else if uppercase(asMnth) = 'DEC' then imonth := 12
 else imonth := -1;

 result := imonth;
end;

function MonthStrlongName(asmnth : string) : integer;
var
 imonth : integer;
begin
 if uppercase(asMnth) = 'JANUARY'        then imonth := 1
 else if uppercase(asMnth) = 'FEBRUARY'  then imonth := 2
 else if uppercase(asMnth) = 'MARCH'     then imonth := 3
 else if uppercase(asMnth) = 'APRIL'     then imonth := 4
 else if uppercase(asMnth) = 'MAY'       then imonth := 5
 else if uppercase(asMnth) = 'JUNE'      then imonth := 6
 else if uppercase(asMnth) = 'JULY'      then imonth := 7
 else if uppercase(asMnth) = 'AUGUST'    then imonth := 8
 else if uppercase(asMnth) = 'SEPTEMBER' then imonth := 9
 else if uppercase(asMnth) = 'OCTOBER'   then imonth := 10
 else if uppercase(asMnth) = 'NOVEMBER'  then imonth := 11
 else if uppercase(asMnth) = 'DECEMBER'  then imonth := 12
 else imonth := -1;

 result := imonth;
end;

function UnstringCombo(asStr : string) : String;
var
 iPos   : Integer;
 sStr   : String;
 icnt   : longint;
// bfound : Boolean;
begin
  icnt   := 1;
  iPos   := Pos('-', asStr);
  sStr   := Copy(asStr, 0, iPos - 1);
  sStr   := DelESpace(sStr);
  result := sStr;
end;

function UnstringRCombo(asStr : string) : String;
var
 iPos   : Integer;
 sStr   : String;
// icnt   : longint;
 bfound : Boolean;
begin
//  icnt   := 1;
  iPos   := Pos('-', asStr);
  sStr   := Copy(asStr, ipos + 1, length(asStr));
  sStr   := DelESpace(sStr);
  result := sStr;
end;

function CheckParameters(asStr : Ansistring) : Ansistring;
{function will make sure parameters passed through are correct and that it
doesn't contain any unnecessarry trailing ',' the function can be expanded}
var
// iPos : integer;
 iLen : integer;
 sStr : Ansistring;
begin
 iLen := Length(asStr);
 sStr := copy(asStr, 0, ilen - 1);
 result := sStr;
end;

function UnstringStr(asStr : string; sChr : String) : Ansistring;
var
 iPos : integer;
 iLen : integer;
 sStr : Ansistring;
begin
 if not isEmpty(asStr) then begin
  iPos   := Pos(sChr, asStr);
  sStr   := Copy(asStr, ipos + 1, length(asStr));
  sStr   := DelESpace(sStr);
  result := sStr;
 end else begin
  result := '';
 end;
end;

function UnstringDate(dtdate : TDatetime) : String;
var
 wy,
 wm,
 wd : word;
begin
 DecodeDate(dtDate, wy, wm, wd);
 result := inttostr(wy)+inttostr(wm)+inttostr(wd);
end;

function UnstringdateTime(dtDate : TDatetime) : String; //[1]
var
 wy,
 wm,
 wd : word;
 whrs,
 wmin,
 wsec,
 wmsec : Word;
begin
 DecodeDate(dtDate, wy, wm, wd);
 DecodeTime(dtDate, whrs, wmin, wsec, wmsec);
 result := inttostr(wy)+'_'+inttostr(wm)+'_'+inttostr(wd)+'_'+
 inttostr(whrs)+'_'+inttostr(wmin)+'_'+inttostr(wsec)+'_'+inttostr(wmsec);
end;

function TrimAfterChar(asFile, asChar : AnsiString) : Ansistring;
var
 iPos : integer;
begin
  iPos   := Pos(asChar, asFile);
  if iPos > 0 then begin
   asFile := Copy(asFile, 0, iPos-1);
  end else begin
   asFile := asFile;
  end;
  result := asFile;
end;

function GenerateNr(asNr : Ansistring; iNr : Integer; iLen : integer; iIDLen : Integer) : Ansistring;
var
 iPos : integer;
 asTmp : Ansistring;
begin
  asTmp  := Copy(asNr, 0, iLen);
  asTmp  := asTmp + IntToStr(iNr);
  asTmp  := FillStrFw(asTmp, iIDLen);
  result := asTmp;
end;

function DelMidSpaces(asStr : Ansistring) : Ansistring;
var
 asTmp : Ansistring;
 asTmp1: Ansistring;
 iPos  : Integer;
begin
  iPos := Pos(' ', asStr);
  asTmp:= asStr;
  while iPOS <> 0 do begin
   iPos := Pos(' ', asTmp);
   if iPos > 0 then begin
    asTmp1:= copy(asTmp, iPos+1, length(asTmp));
    asTmp := copy(asTmp, 0,iPos-1);
    asTmp := asTmp + asTmp1;
   end else begin

   end;
  end;
  result := asTMP;
end;

function IsStrANumber(const S: string): Boolean;
var
  P: PChar;
begin
  P      := PChar(S);
  Result := False;
  while P^ <> #0 do
  begin
    if not (P^ in ['0'..'9']) then Exit;
    Inc(P);
  end;
  Result := True;
end;

function IsInt(val : String) : integer;
{Test if a value is numeric or not.}
begin
  result := abs(StrToInt(val));
  if result < 0 then begin
   Result:=1;
  end;
end;

function Makenum(sString : String) : String;
var
 iPos : integer;
 ilen : integer;
 sNew : String;
begin
 iPos    := 4;
 sString := DelMidSpaces(sString);
 sNew    := Copy(sString, 0, iPos);
 result  := sNew;
end;

function StrReverse( var S: String ) : string;
var
i, j : word;
begin
   Result:=S;
   j := 1;
   for i := Length( S ) downto 1 do
      begin
      Result[j] := S[i];
      Inc( j );
      end;
   S := Result;                  { so it works like a C stdlib function }
end;

function UnstringTime(sVal : String; var hr, min : Integer) : integer;
var
  i,j : integer;
begin
  i   := Pos(':',sVal);
  hr  := strToInt(copy(sVal,0, i-1));
  min := strToInt(copy(sVal, i+1, length(sval)));
  result := 0;
end;

procedure Clears(grid : TStringGrid);
var
  I: Integer;
begin
  for I := 0 to Grid.ColCount - 1 do
    Grid.Cols[I].Clear;
end;

function NearlyEqual(a, b, epsilon: Integer): Boolean;
begin
  Result := Abs(a-b) < (epsilon / 2);
end;

//*********************************************************************************************
function StrToOem(const AnsiStr: string): string;
begin
  SetLength(Result, Length(AnsiStr));
  if Length(Result) > 0 then
{$IFDEF WIN32}
//    CharToOemBuff(PChar(AnsiStr), PChar(Result), Length(Result));
{$ELSE}
    AnsiToOemBuff(@AnsiStr[1], @Result[1], Length(Result));
{$ENDIF}
end;
//*********************************************************************************************
function OemToAnsiStr(const OemStr: string): string;
begin
  SetLength(Result, Length(OemStr));
  if Length(Result) > 0 then
{$IFDEF WIN32}
//    OemToCharBuff(PChar(OemStr), PChar(Result), Length(Result));
{$ELSE}
    OemToAnsiBuff(@OemStr[1], @Result[1], Length(Result));
{$ENDIF}
end;
//*********************************************************************************************
function IsEmptyStr(const S: string; const EmptyChars: TCharSet): Boolean;
var
  I, SLen: Integer;
begin
  SLen := Length(S);
  I := 1;
  while I <= SLen do begin
    if not (S[I] in EmptyChars) then begin
      Result := False;
      Exit;
    end
    else Inc(I);
  end;
  Result := True;
end;
//*********************************************************************************************
function ReplaceStr(const S, Srch, Replace: string): string;
var
  I: Integer;
  Source: string;
begin
  Source := S;
  Result := '';
  repeat
    I := Pos(Srch, Source);
    if I > 0 then begin
      Result := Result + Copy(Source, 1, I - 1) + Replace;
      Source := Copy(Source, I + Length(Srch), MaxInt);
    end
    else Result := Result + Source;
  until I <= 0;
end;
//*********************************************************************************************
function DelSpace(const S: String): string;
begin
  Result := DelChars(S, ' ');
end;

function DelChars(const S: string; Chr: Char): string;
var
  I: Integer;
begin
  Result := S;
  for I := Length(Result) downto 1 do begin
    if Result[I] = Chr then Delete(Result, I, 1);
  end;
end;

function DelBSpace(const S: ansistring): ansistring;
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] = ' ') do Inc(I);
  Result := Copy(S, I, MaxInt);
end;

function DelESpace(const S: string): string;
var
  I: Integer;
begin
  I := Length(S);
  while (I > 0) and (S[I] = ' ') do Dec(I);
  Result := Copy(S, 1, I);
end;

function DelRSpace(const S: string): string;
begin
  Result := DelBSpace(DelESpace(S));
end;

function DelSpace1(const S: string): string;
var
  I: Integer;
begin
  Result := S;
  for I := Length(Result) downto 2 do begin
    if (Result[I] = ' ') and (Result[I - 1] = ' ') then
      Delete(Result, I, 1);
  end;
end;

function Tab2Space(const S: string; Numb: Byte): string;
var
  I: Integer;
begin
  I := 1;
  Result := S;
  while I <= Length(Result) do begin
    if Result[I] = Chr(9) then begin
      Delete(Result, I, 1);
      Insert(MakeStr(' ', Numb), Result, I);
      Inc(I, Numb);
    end
    else Inc(I);
  end;
end;

function MakeStr(C: Char; N: Integer): string;
begin
  if N < 1 then Result := ''
  else begin
{$IFNDEF WIN32}
    if N > 255 then N := 255;
{$ENDIF WIN32}
    SetLength(Result, N);
    FillChar(Result[1], Length(Result), C);
  end;
end;

function MS(C: Char; N: Integer): string;
begin
  Result := MakeStr(C, N);
end;

function NPos(const C: string; S: string; N: Integer): Integer;
var
  I, P, K: Integer;
begin
  Result := 0;
  K := 0;
  for I := 1 to N do begin
    P := Pos(C, S);
    Inc(K, P);
    if (I = N) and (P > 0) then begin
      Result := K;
      Exit;
    end;
    if P > 0 then Delete(S, 1, P)
    else Exit;
  end;
end;

function AddChar(C: Char; const S: string; N: Integer): string;
begin
  if Length(S) < N then
    Result := MakeStr(C, N - Length(S)) + S
  else Result := S;
end;

function AddCharR(C: Char; const S: string; N: Integer): string;
begin
  if Length(S) < N then
    Result := S + MakeStr(C, N - Length(S))
  else Result := S;
end;

function LeftStr(const S: string; N: Integer): string;
begin
  Result := AddCharR(' ', S, N);
end;

function RightStr(const S: string; N: Integer): string;
begin
  Result := AddChar(' ', S, N);
end;

function CompStr(const S1, S2: string): Integer;
begin
{$IFDEF WIN32}
  Result := CompareString(GetThreadLocale, SORT_STRINGSORT, PChar(S1),
    Length(S1), PChar(S2), Length(S2)) - 2;
{$ELSE}
  Result := CompareStr(S1, S2);
{$ENDIF}
end;

function CompText(const S1, S2: string): Integer;
begin
{$IFDEF WIN32}
  Result := CompareString(GetThreadLocale, SORT_STRINGSORT or NORM_IGNORECASE,
    PChar(S1), Length(S1), PChar(S2), Length(S2)) - 2;
{$ELSE}
  Result := CompareText(S1, S2);
{$ENDIF}
end;

function Copy2Symb(const S: string; Symb: Char): string;
var
  P: Integer;
begin
  P := Pos(Symb, S);
  if P = 0 then P := Length(S) + 1;
  Result := Copy(S, 1, P - 1);
end;

function Copy2SymbDel(var S: string; Symb: Char): string;
begin
  Result := Copy2Symb(S, Symb);
  S := DelBSpace(Copy(S, Length(Result) + 1, Length(S)));
end;

function Copy2Space(const S: string): string;
begin
  Result := Copy2Symb(S, ' ');
end;

function Copy2SpaceDel(var S: string): string;
begin
  Result := Copy2SymbDel(S, ' ');
end;

function AnsiProperCase(const S: string; const WordDelims: TCharSet): string;
var
  SLen, I: Cardinal;
begin
  Result := AnsiLowerCase(S);
  I := 1;
  SLen := Length(Result);
  while I <= SLen do begin
    while (I <= SLen) and (Result[I] in WordDelims) do Inc(I);
    if I <= SLen then Result[I] := AnsiUpperCase(Result[I])[1];
    while (I <= SLen) and not (Result[I] in WordDelims) do Inc(I);
  end;
end;

function WordCount(const S: string; const WordDelims: TCharSet): Integer;
var
  SLen, I: Cardinal;
begin
  Result := 0;
  I := 1;
  SLen := Length(S);
  while I <= SLen do begin
    while (I <= SLen) and (S[I] in WordDelims) do Inc(I);
    if I <= SLen then Inc(Result);
    while (I <= SLen) and not(S[I] in WordDelims) do Inc(I);
  end;
end;

function WordPosition(const N: Integer; const S: string;
  const WordDelims: TCharSet): Integer;
var
  Count, I: Integer;
begin
  Count := 0;
  I := 1;
  Result := 0;
  while (I <= Length(S)) and (Count <> N) do begin
    { skip over delimiters }
    while (I <= Length(S)) and (S[I] in WordDelims) do Inc(I);
    { if we're not beyond end of S, we're at the start of a word }
    if I <= Length(S) then Inc(Count);
    { if not finished, find the end of the current word }
    if Count <> N then
      while (I <= Length(S)) and not (S[I] in WordDelims) do Inc(I)
    else Result := I;
  end;
end;

function ExtractWord(N: Integer; const S: string;
  const WordDelims: TCharSet): string;
var
  I: Integer;
  Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not(S[I] in WordDelims) do begin
      { add the I'th character to result }
      Inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;

function ExtractWordPos(N: Integer; const S: string;
  const WordDelims: TCharSet; var Pos: Integer): string;
var
  I, Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  Pos := I;
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not(S[I] in WordDelims) do begin
      { add the I'th character to result }
      Inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;

function ExtractDelimited(N: Integer; const S: string; const Delims: TCharSet): string;
var
  CurWord: Integer;
  I, Len, SLen: Integer;
begin
  CurWord := 0;
  I := 1;
  Len := 0;
  SLen := Length(S);
  SetLength(Result, 0);
  while (I <= SLen) and (CurWord <> N) do begin
    if S[I] in Delims then Inc(CurWord)
    else begin
      if CurWord = N - 1 then begin
        Inc(Len);
        SetLength(Result, Len);
        Result[Len] := S[I];
      end;
    end;
    Inc(I);
  end;
end;

function ExtractSubstr(const S: string; var Pos: Integer;
  const Delims: TCharSet): string;
var
  I: Integer;
begin
  I := Pos;
  while (I <= Length(S)) and not (S[I] in Delims) do Inc(I);
  Result := Copy(S, Pos, I - Pos);
  if (I <= Length(S)) and (S[I] in Delims) then Inc(I);
  Pos := I;
end;

function IsWordPresent(const W, S: string; const WordDelims: TCharSet; var Position: Integer): Boolean;
var
  Count, I: Integer;
begin
  Result := False;
  Count := WordCount(S, WordDelims);
  for I := 1 to Count do
    if ExtractWord(I, S, WordDelims) = W then begin
      Position := I;
      Result := True;
      Exit;
    end;
end;

{$IFDEF WIN32}
  {$IFNDEF VER90}
    { C++Builder or Delphi 3.0 }
    {$DEFINE MBCS}
  {$ENDIF}
{$ENDIF}

function QuotedString(const S: string; Quote: Char): string;
{$IFDEF MBCS}
begin
  Result := AnsiQuotedStr(S, Quote);
{$ELSE}
var
  I: Integer;
begin
  Result := S;
  for I := Length(Result) downto 1 do
    if Result[I] = Quote then Insert(Quote, Result, I);
  Result := Quote + Result + Quote;
{$ENDIF MBCS}
end;

function ExtractQuotedString(const S: string; Quote: Char): string;
var
{$IFDEF MBCS}
  P: PChar;
begin
  P := PChar(S);
  if P^ = Quote then Result := AnsiExtractQuotedStr(P, Quote)
  else Result := S;
{$ELSE}
  I: Integer;
begin
  Result := S;
  I := Length(Result);
  if (I > 0) and (Result[1] = Quote) and
    (Result[I] = Quote) then
  begin
    Delete(Result, I, 1);
    Delete(Result, 1, 1);
    for I := Length(Result) downto 2 do begin
      if (Result[I] = Quote) and (Result[I - 1] = Quote) then
        Delete(Result, I, 1);
    end;
  end;
{$ENDIF MBCS}
end;

function Numb2USA(const S: string): string;
var
  I, NA: Integer;
begin
  I := Length(S);
  Result := S;
  NA := 0;
  while (I > 0) do begin
    if ((Length(Result) - I + 1 - NA) mod 3 = 0) and (I <> 1) then
    begin
      Insert(',', Result, I);
      Inc(NA);
    end;
    Dec(I);
  end;
end;

function CenterStr(const S: string; Len: Integer): string;
begin
  if Length(S) < Len then begin
    Result := MakeStr(' ', (Len div 2) - (Length(S) div 2)) + S;
    Result := Result + MakeStr(' ', Len - Length(Result));
  end
  else Result := S;
end;

function Dec2Hex(N: LongInt; A: Byte): string;
begin
  Result := IntToHex(N, A);
end;

function D2H(N: LongInt; A: Byte): string;
begin
  Result := IntToHex(N, A);
end;

function Hex2Dec(const S: string): Longint;
var
  HexStr: string;
begin
  if Pos('$', S) = 0 then HexStr := '$' + S
  else HexStr := S;
  Result := StrToIntDef(HexStr, 0);
end;

function H2D(const S: string): Longint;
begin
  Result := Hex2Dec(S);
end;

function Dec2Numb(N: Longint; A, B: Byte): string;
var
  C, I: Integer;
begin
  Result := MakeStr('0', A);
  I := A;
  while N > 0 do begin
    C := N mod B;
    if C > 9 Then C := C + 55
    else C := C + 48;
    Result[I] := Chr(C);
    N := N div B;
    Dec(I);
  end;
end;

function Numb2Dec(S: string; B: Byte): Longint;
var
  I, P: Longint;
begin
  I := Length(S);
  Result := 0;
  S := UpperCase(S);
  P := 1;
  while (I >= 1) do begin
    if S[I] > '@' then Result := Result + (Ord(S[I]) - 55) * P
    else Result := Result + (Ord(S[I]) - 48) * P;
    Dec(I);
    P := P * B;
  end;
end;

function RomanToInt(const S: string): Longint;
const
  RomanChars = ['C','D','I','L','M','V','X'];
  RomanValues: array['C'..'X'] of Word =
    (100,500,0,0,0,0,1,0,0,50,1000,0,0,0,0,0,0,0,0,5,0,10);
var
  Index, Next: Char;
  I: Integer;
  Negative: Boolean;
begin
  Result := 0;
  I := 0;
  Negative := (Length(S) > 0) and (S[1] = '-');
  if Negative then Inc(I);
  while (I < Length(S)) do begin
    Inc(I);
    Index := UpCase(S[I]);
    if Index in RomanChars then begin
      if Succ(I) <= Length(S) then Next := UpCase(S[I + 1])
      else Next := #0;
      if (Next in RomanChars) and (RomanValues[Index] < RomanValues[Next]) then
      begin
        Inc(Result, RomanValues[Next]);
        Dec(Result, RomanValues[Index]);
        Inc(I);
      end
      else Inc(Result, RomanValues[Index]);
    end
    else begin
      Result := 0;
      Exit;
    end;
  end;
  if Negative then Result := -Result;
end;

function IntToRoman(Value: Longint): string;
Label
  A500, A400, A100, A90, A50, A40, A10, A9, A5, A4, A1;
begin
  Result := '';
{$IFNDEF WIN32}
  if (Value > MaxInt * 2) then Exit;
{$ENDIF}
  while Value >= 1000 do begin
    Dec(Value, 1000); Result := Result + 'M';
  end;
  if Value < 900 then goto A500
  else begin
    Dec(Value, 900); Result := Result + 'CM';
  end;
  goto A90;
A400:
  if Value < 400 then goto A100
  else begin
    Dec(Value, 400); Result := Result + 'CD';
  end;
  goto A90;
A500:
  if Value < 500 then goto A400
  else begin
    Dec(Value, 500); Result := Result + 'D';
  end;
A100:
  while Value >= 100 do begin
    Dec(Value, 100); Result := Result + 'C';
  end;
A90:
  if Value < 90 then goto A50
  else begin
    Dec(Value, 90); Result := Result + 'XC';
  end;
  goto A9;
A40:
  if Value < 40 then goto A10
  else begin
    Dec(Value, 40); Result := Result + 'XL';
  end;
  goto A9;
A50:
  if Value < 50 then goto A40
  else begin
    Dec(Value, 50); Result := Result + 'L';
  end;
A10:
  while Value >= 10 do begin
    Dec(Value, 10); Result := Result + 'X';
  end;
A9:
  if Value < 9 then goto A5
  else begin
    Result := Result + 'IX';
  end;
  Exit;
A4:
  if Value < 4 then goto A1
  else begin
    Result := Result + 'IV';
  end;
  Exit;
A5:
  if Value < 5 then goto A4
  else begin
    Dec(Value, 5); Result := Result + 'V';
  end;
  goto A1;
A1:
  while Value >= 1 do begin
    Dec(Value); Result := Result + 'I';
  end;
end;

function IntToBin(Value: Longint; Digits, Spaces: Integer): string;
begin
  Result := '';
  if Digits > 32 then Digits := 32;
  while Digits > 0 do begin
    if (Digits mod Spaces) = 0 then Result := Result + ' ';
    Dec(Digits);
    Result := Result + IntToStr((Value shr Digits) and 1);
  end;
end;

function FindPart(const HelpWilds, InputStr: string): Integer;
var
  I, J: Integer;
  Diff: Integer;
begin
  I := Pos('?', HelpWilds);
  if I = 0 then begin
    { if no '?' in HelpWilds }
    Result := Pos(HelpWilds, InputStr);
    Exit;
  end;
  { '?' in HelpWilds }
  Diff := Length(InputStr) - Length(HelpWilds);
  if Diff < 0 then begin
    Result := 0;
    Exit;
  end;
  { now move HelpWilds over InputStr }
  for I := 0 to Diff do begin
    for J := 1 to Length(HelpWilds) do begin
      if (InputStr[I + J] = HelpWilds[J]) or
        (HelpWilds[J] = '?') then
      begin
        if J = Length(HelpWilds) then begin
          Result := I + 1;
          Exit;
        end;
      end
      else Break;
    end;
  end;
  Result := 0;
end;

function IsWild(InputStr, Wilds: string; IgnoreCase: Boolean): Boolean;

 function SearchNext(var Wilds: string): Integer;
 { looking for next *, returns position and string until position }
 begin
   Result := Pos('*', Wilds);
   if Result > 0 then Wilds := Copy(Wilds, 1, Result - 1);
 end;

var
  CWild, CInputWord: Integer; { counter for positions }
  I, LenHelpWilds: Integer;
  MaxInputWord, MaxWilds: Integer; { Length of InputStr and Wilds }
  HelpWilds: string;
begin
  if Wilds = InputStr then begin
    Result := True;
    Exit;
  end;
  repeat { delete '**', because '**' = '*' }
    I := Pos('**', Wilds);
    if I > 0 then
      Wilds := Copy(Wilds, 1, I - 1) + '*' + Copy(Wilds, I + 2, MaxInt);
  until I = 0;
  if Wilds = '*' then begin { for fast end, if Wilds only '*' }
    Result := True;
    Exit;
  end;
  MaxInputWord := Length(InputStr);
  MaxWilds := Length(Wilds);
  if IgnoreCase then begin { upcase all letters }
    InputStr := AnsiUpperCase(InputStr);
    Wilds := AnsiUpperCase(Wilds);
  end;
  if (MaxWilds = 0) or (MaxInputWord = 0) then begin
    Result := False;
    Exit;
  end;
  CInputWord := 1;
  CWild := 1;
  Result := True;
  repeat
    if InputStr[CInputWord] = Wilds[CWild] then begin { equal letters }
      { goto next letter }
      Inc(CWild);
      Inc(CInputWord);
      Continue;
    end;
    if Wilds[CWild] = '?' then begin { equal to '?' }
      { goto next letter }
      Inc(CWild);
      Inc(CInputWord);
      Continue;
    end;
    if Wilds[CWild] = '*' then begin { handling of '*' }
      HelpWilds := Copy(Wilds, CWild + 1, MaxWilds);
      I := SearchNext(HelpWilds);
      LenHelpWilds := Length(HelpWilds);
      if I = 0 then begin
        { no '*' in the rest, compare the ends }
        if HelpWilds = '' then Exit; { '*' is the last letter }
        { check the rest for equal Length and no '?' }
        for I := 0 to LenHelpWilds - 1 do begin
          if (HelpWilds[LenHelpWilds - I] <> InputStr[MaxInputWord - I]) and
            (HelpWilds[LenHelpWilds - I]<> '?') then
          begin
            Result := False;
            Exit;
          end;
        end;
        Exit;
      end;
      { handle all to the next '*' }
      Inc(CWild, 1 + LenHelpWilds);
      I := FindPart(HelpWilds, Copy(InputStr, CInputWord, MaxInt));
      if I= 0 then begin
        Result := False;
        Exit;
      end;
      CInputWord := I + LenHelpWilds;
      Continue;
    end;
    Result := False;
    Exit;
  until (CInputWord > MaxInputWord) or (CWild > MaxWilds);
  { no completed evaluation }
  if CInputWord <= MaxInputWord then Result := False;
  if (CWild <= MaxWilds) and (Wilds[MaxWilds] <> '*') then Result := False;
end;
//*********************************************************************************************
{$IFNDEF RX_D4}
function FindCmdLineSwitch(const Switch: string; SwitchChars: TCharSet;
  IgnoreCase: Boolean): Boolean;
var
  I: Integer;
  S: string;
begin
  for I := 1 to ParamCount do begin
    S := ParamStr(I);
    if (SwitchChars = []) or ((S[1] in SwitchChars) and (Length(S) > 1)) then
    begin
      S := Copy(S, 2, MaxInt);
      if IgnoreCase then begin
        if (AnsiCompareText(S, Switch) = 0) then begin
          Result := True;
          Exit;
        end;
      end
      else begin
        if (AnsiCompareStr(S, Switch) = 0) then begin
          Result := True;
          Exit;
        end;
      end;
    end;
  end;
  Result := False;
end;
{$ENDIF RX_D4}
//*********************************************************************************************
function GetCmdLineArg(const Switch: string; SwitchChars: TCharSet): string;
var
  I: Integer;
  S: string;
begin
  I := 1;
  while I <= ParamCount do begin
    S := ParamStr(I);
    if (SwitchChars = []) or ((S[1] in SwitchChars) and (Length(S) > 1)) then
    begin
      if (AnsiCompareText(Copy(S, 2, MaxInt), Switch) = 0) then begin
        Inc(I);
        if I <= ParamCount then begin
          Result := ParamStr(I);
          Exit;
        end;
      end;
    end;
    Inc(I);
  end;
  Result := '';
end;
//*********************************************************************************************
end.
(*
2004/11/13
[1] - added the function unstringdatetime;



*)
