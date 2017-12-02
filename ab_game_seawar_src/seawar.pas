unit seawar;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls,ShellApi, Menus, MPlayer;

const hw=60;
      maxx=9;
      maxy=9;
      maxsheeps=9;

      emptysquare=0;
      paluba1=1;
      bomb=2;
      paluba2h=3;
      paluba2v=4;
      paluba4=5;
      bigsheep=8;
      ranil=10;
      ranilpaluba2h=11;
      ranilpaluba2v=12;
      ranilpaluba4=13;

type
  Pic = ^TImage;
  pole=array[1..maxx,1..maxy]of byte;
  TForm1 = class(TForm)

 Image1: TImage;   Image2: TImage;   Image3: TImage;   Image4: TImage;
 Image5: TImage;   Image6: TImage;   Image7: TImage;   Image8: TImage;
 Image9: TImage;   Image11: TImage;  Image12: TImage;
 Image13: TImage;  Image14: TImage;  Image15: TImage;  Image16: TImage;
 Image17: TImage;  Image18: TImage;  Image19: TImage;  Image20: TImage;
 Image21: TImage;  Image22: TImage;  Image23: TImage;  Image24: TImage;
 Image25: TImage;  Image26: TImage;  Image27: TImage;  Image28: TImage;
 Image29: TImage;  Image30: TImage;  Image31: TImage;  Image32: TImage;
 Image33: TImage;  Image34: TImage;  Image35: TImage;  Image36: TImage;
 Image37: TImage;  Image38: TImage;  Image39: TImage;  Image40: TImage;
 Image41: TImage;  Image42: TImage;  Image43: TImage;  Image44: TImage;
 Image45: TImage;  Image46: TImage;  Image47: TImage;  Image48: TImage;
 Image49: TImage;  Image50: TImage;  Image51: TImage;  Image52: TImage;
 Image53: TImage;  Image54: TImage;  Image55: TImage;  Image56: TImage;
 Image57: TImage;  Image58: TImage;  Image59: TImage;  Image60: TImage;
 Image61: TImage;  Image62: TImage;  Image63: TImage;  Image64: TImage;
 Image65: TImage;  Image66: TImage;  Image67: TImage;  Image68: TImage;
 Image69: TImage;  Image70: TImage;  Image71: TImage;  Image72: TImage;
 Image73: TImage;  Image74: TImage;  Image75: TImage;  Image76: TImage;
 Image77: TImage;  Image78: TImage;  Image79: TImage;  Image80: TImage;
 Image81: TImage;  Image82: TImage;  Image83: TImage;  Image84: TImage;
 Image85: TImage;  Image86: TImage;  Image87: TImage;  Image88: TImage;
 Image89: TImage;  Image90: TImage;  Image91: TImage;  Image92: TImage;
 Image93: TImage;  Image94: TImage;  Image95: TImage;  Image96: TImage;
 Image97: TImage;  Image98: TImage;  Image99: TImage;  Image102: TImage;
 Image103: TImage; Image104: TImage; Image105: TImage; Image106: TImage;
 Image107: TImage; Image108: TImage; Image109: TImage; Image110: TImage;
 Image111: TImage; Image112: TImage; Image113: TImage; Image114: TImage;
 Image115: TImage; Image116: TImage; Image117: TImage; Image118: TImage;
 Image119: TImage; Image120: TImage; Image121: TImage; Image122: TImage;
 Image123: TImage; Image124: TImage; Image125: TImage; Image126: TImage;
 Image127: TImage; Image128: TImage; Image10: TImage;  Image101: TImage;
 Image129: TImage; Image130: TImage; Image131: TImage; Image132: TImage;
 Image133: TImage; Image134: TImage; Image135: TImage; Image136: TImage;
 Image137: TImage; Image138: TImage; Image139: TImage; Image140: TImage;
 Image141: TImage; Image142: TImage; Image143: TImage; Image144: TImage;
 Image145: TImage; Image146: TImage; Image147: TImage; Image148: TImage;
 Image149: TImage; Image150: TImage; Image151: TImage; Image152: TImage;
 Image153: TImage; Image154: TImage; Image155: TImage; Image156: TImage;
 Image157: TImage; Image158: TImage; Image159: TImage; Image160: TImage;
 Image161: TImage; Image162: TImage; Image163: TImage; Image164: TImage;
 Image165: TImage; Image166: TImage; Image167: TImage; Image168: TImage;
 Image169: TImage; Image170: TImage; Image171: TImage; Image172: TImage;
 Image173: TImage; Image174: TImage; Image175: TImage; Image176: TImage;
 Image177: TImage; Image178: TImage; Image179: TImage; Image180: TImage;
 Image181: TImage; Image182: TImage; Image183: TImage; Image184: TImage;
 Image185: TImage; Image186: TImage; Image187: TImage; Image188: TImage;
 Image189: TImage; Image190: TImage; Image191: TImage; Image192: TImage;
 Image193: TImage; Image194: TImage; Image195: TImage; Image196: TImage;
 Image197: TImage; Image198: TImage; Image199: TImage; Image200: TImage;

    deathstar: TImage;
    p11: TImage;  p12: TImage;  p13: TImage;  p14: TImage;
    p21: TImage;  p22: TImage;
    boom: TImage;
    oops: TImage;
    back: TImage;
    bomb1: TImage;
    bomb2: TImage;
    poehali: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    email1: TMenuItem;
    MediaPlayer1: TMediaPlayer;

    procedure postavit(w,h,n,shtuk:byte);
    procedure rasstanovka;
    procedure babah;
    procedure ranili;
    procedure Igra;
    procedure prStart(Sender: TObject);
    procedure Up(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure down(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure move(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure perevorot(Sender: TObject);
    procedure poz(PS:TImage; var xx,yy:longint);
    procedure poehaliClick(Sender: TObject);
    procedure shoot(Sender: TObject);
    function ne_mesto:boolean;
    procedure N2Click(Sender: TObject);
    procedure email1Click(Sender: TObject);
    procedure empty(Sender: TObject);
  private
    Dragging: Boolean;          { Drag operation in progress flag }
    XOffset, YOffset: Integer;  { Offsets from shape upper left }
    FocusRect: TRect;           { Dotted outline while dragging }
    PS: TImage;                 { Reference to shape dragging }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
    square,msquare:array[1..maxx,1..maxy]of pic;
    nashi, nenashi:pole;
    sheeps:array [1..maxsheeps] of pic;
    i,j,k,k1,k2,z,startx,starty,rx,ry,turn:longint;
    gotovo:boolean;
    R: set of byte;
implementation
{$R *.dfm}

//------------------------------------------------------------------

function tform1.ne_mesto:boolean;
begin
ne_mesto:=false;
for i:=1 to maxsheeps do
for j:=1 to maxsheeps do
        if
        (
        (sheeps[i]<>sheeps[j]) and
        (sheeps[j].left>=square[1,1].left) and
        (sheeps[i].left>=square[1,1].left) and
        (sheeps[j].top>=square[1,1].top) and
        (sheeps[i].top>=square[1,1].top) and
        (
                (sheeps[i].left+sheeps[i].width+hw>sheeps[j].Left) and
                (sheeps[i].left<=sheeps[j].Left) or
                (sheeps[j].left+sheeps[j].width+hw>sheeps[i].Left) and
                (sheeps[j].left<=sheeps[i].Left)
        ) and
        (
                (sheeps[i].top+sheeps[i].height+hw>sheeps[j].top) and
                (sheeps[i].top<=sheeps[j].top) or
                (sheeps[j].top+sheeps[j].height+hw>sheeps[i].top) and
                (sheeps[j].top<=sheeps[i].top)
        )
        ) or
        (ps.left+ps.width>square[maxx,1].left+hw) or
        (ps.top+ps.Height>square[1,maxy].top+hw)
        then ne_mesto:=true;
end;

//------------------------------------------------------------------

procedure TForm1.empty(Sender: TObject);
begin
;
end;

//------------------------------------------------------------------

procedure TForm1.babah;
begin
        MediaPlayer1.FileName:='skins\space\boom.wav';
        MediaPlayer1.open;
        MediaPlayer1.play;
end;

//------------------------------------------------------------------

procedure TForm1.ranili;
var i,j,k:byte;
begin
for i:=1 to maxx do
for j:=1 to maxy do
case nenashi[i,j] of

      ranilpaluba2h:
        begin
        if nenashi[i+1,j]=ranil then
                begin
                for k:=7 to 8 do
                if (sheeps[k].left=square[i,j].left) and (sheeps[k].top=square[i,j].top) then
                        begin
                        sheeps[k].Show;
                        square[i-1,j].OnClick:=empty;
                        square[i-1,j+1].OnClick:=empty;
                        square[i-1,j-1].OnClick:=empty;
                        square[i,j+1].OnClick:=empty;
                        square[i,j-1].OnClick:=empty;
                        square[i+1,j+1].OnClick:=empty;
                        square[i+1,j-1].OnClick:=empty;
                        square[i+2,j].OnClick:=empty;
                        square[i+2,j+1].OnClick:=empty;
                        square[i+2,j-1].OnClick:=empty;
                        square[i-1,j].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i-1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i-1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+2,j].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+2,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+2,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                        end;
                end;
        end;

      ranilpaluba2v:
        begin
        if nenashi[i,j+1]=ranil then
                begin
                for k:=7 to 8 do
                if (sheeps[k].left=square[i,j].left) and (sheeps[k].top=square[i,j].top) then
                        begin
                        sheeps[k].Show;
                        square[i-1,j].OnClick:=empty;
                        square[i-1,j-1].OnClick:=empty;
                        square[i-1,j+1].OnClick:=empty;
                        square[i-1,j+2].OnClick:=empty;
                        square[i,j-1].OnClick:=empty;
                        square[i,j+2].OnClick:=empty;
                        square[i+1,j].OnClick:=empty;
                        square[i+1,j-1].OnClick:=empty;
                        square[i+1,j+1].OnClick:=empty;
                        square[i+1,j+2].OnClick:=empty;
                        square[i-1,j].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i-1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i-1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i-1,j+2].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i,j+2].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+1,j].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
                        square[i+1,j+2].Picture.LoadFromFile('skins\space\boom.jpg');
                        end;
                end;
        end;

      ranilpaluba4:
        begin
                if (nenashi[i,j+1]=ranil) and (nenashi[i+1,j]=ranil) and
                (nenashi[i+1,j+1]=ranil) then
                begin
                sheeps[9].Show;
                square[i-1,j].OnClick:=empty;
                square[i-1,j-1].OnClick:=empty;
                square[i-1,j+1].OnClick:=empty;
                square[i-1,j+2].OnClick:=empty;
                square[i,j-1].OnClick:=empty;
                square[i,j+2].OnClick:=empty;
                square[i+1,j-1].OnClick:=empty;
                square[i+1,j+2].OnClick:=empty;
                square[i+2,j].OnClick:=empty;
                square[i+2,j-1].OnClick:=empty;
                square[i+2,j+1].OnClick:=empty;
                square[i+2,j+2].OnClick:=empty;
                square[i-1,j].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i-1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i-1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i-1,j+2].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i,j+2].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i+1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i+1,j+2].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i+2,j].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i+2,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i+2,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
                square[i+2,j+2].Picture.LoadFromFile('skins\space\boom.jpg');

                end;
        end;
end;

end;

//------------------------------------------------------------------
procedure shootpaluba1(i,j:longint; mas:pole);
begin
end;
//------------------------------------------------------------------

procedure TForm1.shoot(Sender: TObject);
begin
with sender as timage do
begin
for i:=1 to maxx do
for j:=1 to maxy do
if (square[i,j].left=left) and (square[i,j].top=top) then
case nenashi[i,j] of

      emptysquare:
        begin
        Picture.LoadFromFile('skins\space\boom.jpg');
        square[i,j].OnClick:=empty;
        babah;
        end;

      paluba1:
        begin
        for k:=1 to 4 do
        if (sheeps[k].left=left) and (sheeps[k].top=top) then
        sheeps[k].Show;
        nenashi[i,j]:=emptysquare;
        square[i,j].OnClick:=empty;
        square[i+1,j].OnClick:=empty;
        square[i-1,j].OnClick:=empty;
        square[i,j+1].OnClick:=empty;
        square[i,j-1].OnClick:=empty;
        square[i+1,j+1].OnClick:=empty;
        square[i-1,j+1].OnClick:=empty;
        square[i+1,j-1].OnClick:=empty;
        square[i-1,j-1].OnClick:=empty;
        square[i,j].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i+1,j].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i-1,j].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i+1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i-1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i+1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i-1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
        babah;
        end;

      bomb:
        begin
        for k:=5 to 6 do
        if (sheeps[k].left=left) and (sheeps[k].top=top) then
        sheeps[k].Show;
        nenashi[i,j]:=emptysquare;
        square[i,j].OnClick:=empty;
        square[i+1,j].OnClick:=empty;
        square[i-1,j].OnClick:=empty;
        square[i,j+1].OnClick:=empty;
        square[i,j-1].OnClick:=empty;
        square[i+1,j+1].OnClick:=empty;
        square[i-1,j+1].OnClick:=empty;
        square[i+1,j-1].OnClick:=empty;
        square[i-1,j-1].OnClick:=empty;
        square[i,j].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i+1,j].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i-1,j].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i+1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i-1,j+1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i+1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
        square[i-1,j-1].Picture.LoadFromFile('skins\space\boom.jpg');
        babah;
        end;

      bigsheep:
        begin
        nenashi[i,j]:=ranil;
        square[i,j].OnClick:=empty;
        square[i,j].Picture.LoadFromFile('skins\space\ranil.jpg');
        babah;
        ranili;
        end;

      paluba2h:
        begin
        nenashi[i,j]:=ranilpaluba2h;
        square[i,j].OnClick:=empty;
        square[i,j].Picture.LoadFromFile('skins\space\ranil.jpg');
        babah;
        ranili;
        end;

      paluba2v:
        begin
        nenashi[i,j]:=ranilpaluba2v;
        square[i,j].OnClick:=empty;
        square[i,j].Picture.LoadFromFile('skins\space\ranil.jpg');
        babah;
        ranili;
        end;

      paluba4:
        begin
        nenashi[i,j]:=ranilpaluba4;
        square[i,j].OnClick:=empty;
        square[i,j].Picture.LoadFromFile('skins\space\ranil.jpg');
        babah;
        ranili;
        end;
end;
end;
turn:=-1*turn;
end;

//------------------------------------------------------------------

procedure TForm1.prStart(Sender: TObject);
begin
turn:=1;
//[1] клетки
square[1,1]:=@image1;  square[1,2]:=@image2;  square[1,3]:=@image3;
square[1,4]:=@image4;  square[1,5]:=@image5;  square[1,6]:=@image6;
square[1,7]:=@image7;  square[1,8]:=@image8;  square[1,9]:=@image9;
square[2,1]:=@image21; square[2,2]:=@image22; square[2,3]:=@image23;
square[2,4]:=@image24; square[2,5]:=@image25; square[2,6]:=@image26;
square[2,7]:=@image27; square[2,8]:=@image28; square[2,9]:=@image29;
square[3,1]:=@image31; square[3,2]:=@image32; square[3,3]:=@image33;
square[3,4]:=@image34; square[3,5]:=@image35; square[3,6]:=@image36;
square[3,7]:=@image37; square[3,8]:=@image38; square[3,9]:=@image39;
square[4,1]:=@image41; square[4,2]:=@image42; square[4,3]:=@image43;
square[4,4]:=@image44; square[4,5]:=@image45; square[4,6]:=@image46;
square[4,7]:=@image47; square[4,8]:=@image48; square[4,9]:=@image49;
square[5,1]:=@image51; square[5,2]:=@image52; square[5,3]:=@image53;
square[5,4]:=@image54; square[5,5]:=@image55; square[5,6]:=@image56;
square[5,7]:=@image57; square[5,8]:=@image58; square[5,9]:=@image59;
square[6,1]:=@image61; square[6,2]:=@image62; square[6,3]:=@image63;
square[6,4]:=@image64; square[6,5]:=@image65; square[6,6]:=@image66;
square[6,7]:=@image67; square[6,8]:=@image68; square[6,9]:=@image69;
square[7,1]:=@image71; square[7,2]:=@image72; square[7,3]:=@image73;
square[7,4]:=@image74; square[7,5]:=@image75; square[7,6]:=@image76;
square[7,7]:=@image77; square[7,8]:=@image78; square[7,9]:=@image79;
square[8,1]:=@image81; square[8,2]:=@image82; square[8,3]:=@image83;
square[8,4]:=@image84; square[8,5]:=@image85; square[8,6]:=@image86;
square[8,7]:=@image87; square[8,8]:=@image88; square[8,9]:=@image89;
square[9,1]:=@image91; square[9,2]:=@image92; square[9,3]:=@image93;
square[9,4]:=@image94; square[9,5]:=@image95; square[9,6]:=@image96;
square[9,7]:=@image97; square[9,8]:=@image98; square[9,9]:=@image99;

msquare[1,1]:=@image101; msquare[1,2]:=@image102; msquare[1,3]:=@image103;
msquare[1,4]:=@image104; msquare[1,5]:=@image105; msquare[1,6]:=@image106;
msquare[1,7]:=@image107; msquare[1,8]:=@image108; msquare[1,9]:=@image109;
msquare[2,1]:=@image121; msquare[2,2]:=@image122; msquare[2,3]:=@image123;
msquare[2,4]:=@image124; msquare[2,5]:=@image125; msquare[2,6]:=@image126;
msquare[2,7]:=@image127; msquare[2,8]:=@image128; msquare[2,9]:=@image129;
msquare[3,1]:=@image131; msquare[3,2]:=@image132; msquare[3,3]:=@image133;
msquare[3,4]:=@image134; msquare[3,5]:=@image135; msquare[3,6]:=@image136;
msquare[3,7]:=@image137; msquare[3,8]:=@image138; msquare[3,9]:=@image139;
msquare[4,1]:=@image141; msquare[4,2]:=@image142; msquare[4,3]:=@image143;
msquare[4,4]:=@image144; msquare[4,5]:=@image145; msquare[4,6]:=@image146;
msquare[4,7]:=@image147; msquare[4,8]:=@image148; msquare[4,9]:=@image149;
msquare[5,1]:=@image151; msquare[5,2]:=@image152; msquare[5,3]:=@image153;
msquare[5,4]:=@image154; msquare[5,5]:=@image155; msquare[5,6]:=@image156;
msquare[5,7]:=@image157; msquare[5,8]:=@image158; msquare[5,9]:=@image159;
msquare[6,1]:=@image161; msquare[6,2]:=@image162; msquare[6,3]:=@image163;
msquare[6,4]:=@image164; msquare[6,5]:=@image165; msquare[6,6]:=@image166;
msquare[6,7]:=@image167; msquare[6,8]:=@image168; msquare[6,9]:=@image169;
msquare[7,1]:=@image171; msquare[7,2]:=@image172; msquare[7,3]:=@image173;
msquare[7,4]:=@image174; msquare[7,5]:=@image175; msquare[7,6]:=@image176;
msquare[7,7]:=@image177; msquare[7,8]:=@image178; msquare[7,9]:=@image179;
msquare[8,1]:=@image181; msquare[8,2]:=@image182; msquare[8,3]:=@image183;
msquare[8,4]:=@image184; msquare[8,5]:=@image185; msquare[8,6]:=@image186;
msquare[8,7]:=@image187; msquare[8,8]:=@image188; msquare[8,9]:=@image189;
msquare[9,1]:=@image191; msquare[9,2]:=@image192; msquare[9,3]:=@image193;
msquare[9,4]:=@image194; msquare[9,5]:=@image195; msquare[9,6]:=@image196;
msquare[9,7]:=@image197; msquare[9,8]:=@image198; msquare[9,9]:=@image199;
//[1]
//[4]Ќачальные установки
for i:=1 to maxx do
for j:=1 to maxy do
begin
        square[i,j].Picture.LoadFromFile('skins\space\square.wmf');
        square[i,j].left:=hw*i+190;
        square[i,j].Top:=hw*j-40;
        nashi[i,j]:=emptysquare;
        msquare[i,j].left:=25*i-23;
        msquare[i,j].Top:=27*j+200;
end;
//[4]
//[2] орабли
sheeps[1]:=@p11;        sheeps[2]:=@p12;        sheeps[3]:=@p13;
sheeps[4]:=@p14;        sheeps[5]:=@bomb1;      sheeps[6]:=@bomb2;
sheeps[7]:=@p21;        sheeps[8]:=@p22;        sheeps[9]:=@deathstar;

for i:=1 to 4 do
begin
sheeps[i].Picture.LoadFromFile('skins\space\p1.jpg');
sheeps[i].top:=20; sheeps[i].Left:=5+hw*(i-1);
end;

for i:=1 to 2 do
begin
sheeps[i+4].Picture.LoadFromFile('skins\space\bomb.jpg');
sheeps[i+4].top:=90+hw*(i-1); sheeps[i+4].Left:=5;
sheeps[i+6].Picture.LoadFromFile('skins\space\p2h.jpg');
sheeps[i+6].top:=220; sheeps[i+6].Left:=5+hw*2*(i-1);
end;

sheeps[9].Picture.LoadFromFile('skins\space\deathstar.jpg');
sheeps[9].top:=90; sheeps[9].Left:=105;
//[2]

//[3] карта
back.Picture.LoadFromFile('skins\space\background1.jpg');
poehali.Picture.LoadFromFile('skins\space\poehali.wmf');
poehali.top:=360;
poehali.left:=90;
R:=[1..maxx*maxy]
//[3]
end;

//------------------------------------------------------------------

//Ќахождение клетки, в которую перетащили корабль
procedure TForm1.poz(PS:TImage; var xx,yy:longint);
var minx,miny,x,y:longint;
begin
minx:=abs(square[1,1].left-PS.left); x:=1;
miny:=abs(square[1,1].top-PS.top);   y:=1;

for i:=1 to maxx do
for j:=1 to maxy do
begin
  if (abs(square[i,j].left-PS.left)<=minx) then
  begin
   minx:=abs(square[i,j].left-PS.left);    x:=i;
  end;
  if (abs(square[i,j].top-PS.top)<=miny) then
  begin
   miny:=abs(square[i,j].top-PS.top);      y:=j;
  end;
end;
xx:=square[x,y].Left;
yy:=square[x,y].Top;
end;

//------------------------------------------------------------------

procedure TForm1.Up(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var xx,yy:longint;
begin
  if Dragging then
  begin
   Dragging:=False;
   PS:= Sender as TImage;
   ps.Left:=(ps.Left+X)-XOffset;
   ps.Top:=(ps.Top+Y)-YOffset;
  end;

poz(PS,xx,yy);
PS.Left:=xx;
PS.Top:=yy;
if ne_mesto then
        begin
                ps.left:=startx;
                ps.top:=starty;
        end;
end;

//------------------------------------------------------------------

procedure TForm1.down(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var pozminx,pozminy:longint;
begin
  Dragging:=True;
  XOffset:=X;
  YOffset:=Y;
  PS:=Sender as TImage;
  startx:=PS.Left;
  starty:=PS.top;
end;

//------------------------------------------------------------------

procedure TForm1.move(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Dragging then begin
    with Sender as TImage do
    begin
      Left:=(PS.Left+X)-XOffset;
      Top:=(PS.Top+Y)-YOffset;
    end;
  end;
end;

//------------------------------------------------------------------

//ѕереворот двухпалубного корабл€
procedure TForm1.perevorot(Sender: TObject);
begin
PS:=Sender as TImage;
if PS.Picture.Width > PS.Picture.Height then
PS.Picture.LoadFromFile('skins\space\p2v.jpg')
else
PS.Picture.LoadFromFile('skins\space\p2h.jpg');
if ne_mesto then perevorot(Sender)
end;

//------------------------------------------------------------------

procedure tform1.postavit(w,h,n,shtuk:byte);
var gotovo:boolean;
    iter:longint;
begin
iter:=0;
for i:=1 to shtuk do
        begin
        gotovo:=false;
        repeat
                rx:=random(maxx)+1;
                ry:=random(maxy)+1;

if (nenashi[rx,ry]=0) and
((ry-1>0) and (nenashi[rx,ry-1]=0) or (ry=1)) and
((rx-1>0) and (nenashi[rx-1,ry]=0) or (rx=1)) and
((rx-1>0) and (ry-1>0) and (nenashi[rx-1,ry-1]=0) or (rx=1) and (ry=1)) and
((rx-1>0) and (ry+1<=maxy) and (nenashi[rx-1,ry+1]=0) or (rx=1) and (ry=maxy)) and
((rx+w<=maxx) and (nenashi[rx+w,ry]=0) or (rx+w=maxx)) and
((rx+w<=maxx) and (ry-1>0) and (nenashi[rx+w,ry-1]=0) or (rx+w=maxx) and (ry=1)) and
((rx+w<=maxx) and (ry+1<=maxy) and (nenashi[rx+w,ry+1]=0) or (rx+w=maxx) and (ry+1=maxy)) and
((rx+w<=maxx) and (ry+h<=maxy) and (nenashi[rx+w,ry+h]=0) or (rx+w=maxx)and (ry+h=maxy)) and
((ry+h<=maxy) and (nenashi[rx,ry+h]=0) or (ry+h=maxy)) and
((ry+h<=maxy) and (rx-1>0) and (nenashi[rx-1,ry+h]=0) or (ry+h=maxy) and (rx=1)) and
((ry+h<=maxy) and (rx+1<=maxx) and (nenashi[rx+1,ry+h]=0) or (ry+h=maxy) and (rx+1=maxx)) and
((rx+1<=maxx) and (nenashi[rx+1,ry]=0) or (rx=maxx)) and
((ry+1<=maxy) and (nenashi[rx,ry+1]=0) or (ry=maxy)) and
((rx+1<=maxx) and (ry+1<=maxy) and (nenashi[rx+1,ry+1]=0) or (rx=maxx) and (ry=maxy)) and
((rx+1<=maxx) and (ry-1>0) and (nenashi[rx+1,ry-1]=0) or (rx=maxx) and (ry=1))
                then
                        begin
                        nenashi[rx,ry]:=n;

                        if n=paluba2h then nenashi[rx+1,ry]:=bigsheep;
                        if n=paluba2v then nenashi[rx,ry+1]:=bigsheep;
                        if n=paluba4 then
                        begin
                                nenashi[rx+1,ry]:=bigsheep;
                                nenashi[rx,ry+1]:=bigsheep;
                                nenashi[rx+1,ry+1]:=bigsheep;
                        end;
                        gotovo:=true;
                        end;
        inc(iter);
        if iter>10000 then rasstanovka;
        until gotovo=true;
        end;
end;

//------------------------------------------------------------------

procedure tform1.igra;
begin
end;

//------------------------------------------------------------------

procedure tform1.rasstanovka;
begin
//расстановка кораблей противника postavit(w,h,n,shtuk:byte);

for i:=1 to maxx do
for j:=1 to maxy do
        nenashi[i,j]:=emptysquare;


randomize;
postavit(2,2,paluba4,1);
if random(2)>0 then postavit(2,1,paluba2h,1) else postavit(1,2,paluba2v,1);
if random(2)>0 then postavit(2,1,paluba2h,1) else postavit(1,2,paluba2v,1);
postavit(1,1,paluba1,4);
postavit(1,1,bomb,2);

k:=0;
k1:=0;
k2:=0;
 for i:=1 to maxx do
 for j:=1 to maxy do
 case nenashi[i,j] of
 paluba1://однопалубный  1-4
        begin
        sheeps[1+k].left:=square[i,j].Left;
        sheeps[1+k].top:=square[i,j].top;
        inc(k);
        end;
 bomb://мина 5-6
        begin
        sheeps[5+k1].left:=square[i,j].Left;
        sheeps[5+k1].top:=square[i,j].top;
        inc(k1);
        end;
 paluba2h://двухпалубный 7-8
        begin
        sheeps[7+k2].left:=square[i,j].Left;
        sheeps[7+k2].top:=square[i,j].top;
        sheeps[7+k2].Picture.LoadFromFile('skins\space\p2h.jpg');
        inc(k2);
        end;
 paluba2v://двухпалубный 7-8
        begin
        sheeps[7+k2].left:=square[i,j].Left;
        sheeps[7+k2].top:=square[i,j].top;
        sheeps[7+k2].Picture.LoadFromFile('skins\space\p2v.jpg');
        inc(k2);
        end;
 paluba4://звезда смерти 9
        begin
        sheeps[9].left:=square[i,j].Left;
        sheeps[9].top:=square[i,j].top;
        end;
 end;
end;

//------------------------------------------------------------------

procedure TForm1.poehaliClick(Sender: TObject);
begin
gotovo:=true;
for i:=1 to maxsheeps do
        if sheeps[i].left<square[1,1].left then gotovo:=false;
if gotovo then
begin
        poehali.Hide;
        for i:=1 to maxx do
        for j:=1 to maxy do
begin
        msquare[i,j].Picture.LoadFromFile('skins\space\squares.wmf');
        square[i,j].OnClick:=shoot;

        for k:=1 to maxsheeps do
        begin
        sheeps[k].hide;

        if (square[i,j].left=sheeps[k].left) and (square[i,j].top=sheeps[k].top)
                then
                  begin
                  case k of
                  1..4://однопалубный
                  begin
                    nashi[i,j]:=paluba1;
                    msquare[i,j].Picture.LoadFromFile('skins\space\p1s.jpg');
                  end;
                  5,6://мина
                  begin
                    nashi[i,j]:=bomb;
                    msquare[i,j].Picture.LoadFromFile('skins\space\bombs.jpg');
                  end;
                  7,8://двупалубный
                  if (sheeps[k].Picture.Width>sheeps[k].Picture.Height) then
                  begin
                    nashi[i,j]:=paluba2h; nashi[i+1,j]:=paluba2h;
                    msquare[i,j].Picture.LoadFromFile('skins\space\p2hs.jpg');
                    msquare[i+1,j].hide;
                  end
                  else
                  begin
                    nashi[i,j]:=paluba2v; nashi[i,j+1]:=paluba2v;
                    msquare[i,j].Picture.LoadFromFile('skins\space\p2vs.jpg');
                    msquare[i,j+1].hide;
                  end;
                  9://звезда смерти
                  begin
                    nashi[i,j]:=paluba4; nashi[i,j+1]:=paluba4;
                    nashi[i+1,j]:=paluba4; nashi[i+1,j+1]:=paluba4;
                    msquare[i,j].Picture.LoadFromFile('skins\space\deathstars.jpg');
                    msquare[i,j+1].hide;
                    msquare[i+1,j].hide;
                    msquare[i+1,j+1].hide;
                  end; end;
                  end; end;
end;
end;
rasstanovka;
end;

//------------------------------------------------------------------

procedure TForm1.N2Click(Sender: TObject);
begin
ShellExecute(Self.Handle,'open','html\game\ab_game.htm','','',SW_SHOW)
end;

//------------------------------------------------------------------

procedure TForm1.email1Click(Sender: TObject);
begin
ShellExecute(Self.Handle,'open','mailto:abutko@mail.ru?subject=seawar','','',SW_SHOW)
end;
end.
