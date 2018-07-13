Uses crt{, crtplus};

Const Matrix: Array[1..120] of char =
      (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',
       '0','1','2','3','4','5','6','7','8','9','','''',
       '"','+','!','%','/','=','(',')','\','|','ˆ','û',
       '$','·','œ',';','.','*','?',',',':','_','-','[',
       ']','à','ù','<','>','#','&','@','{','}',' ',' ',
       'q','w','e','r','t','z','u','i','o','p','a','s',
       'd','f','g','h','j','k','l','y','x','c','v','b',
       'n','m',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',
       ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',
       ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ');

Var i, j: integer;
    s: string;
    c, b: char;
    x, y, ex: byte;
    sc, sc2: array[0..40, 1..25] of byte;

Procedure InitScr;
 Var ve, ho: integer;
  Begin
    for ve:=1 to 25 do
      for ho:=0 to 40 do
        begin
          sc[ho, ve] :=ord(Matrix[random(120)+1]);
          sc2[ho, ve]:=random(2)+1;
        end;
  End;

Procedure DrawScr;
 var ve, ho: Integer;
  Begin
    for ve:=1 to 25 do
     begin
      for ho:=1 to 40 do
        begin
          sc[1, 1] :=ord(Matrix[random(120)+1]);
          sc2[1, 1] :=random(2)+1;
          if sc2[ho, ve]=1 then
            begin
              textcolor(2);
              gotoxy(ho*2-1, ve);
              write(char(sc[ho, ve]));
            end;
          if sc2[ho, ve]=2 then
            begin
              textcolor(10);
              gotoxy(ho*2-1, ve);
              write(char(sc[ho, ve]));
            end;
        end;
     end;
  End;

Procedure ParseScr;
 var ve, ho: Integer;
  Begin
    for ve:=25 downto 1 do
      for ho:=1 to 40 do
        begin
          sc[ho, ve]:=sc[ho, ve-1];
        end;
{    for ve:=25 downto 1 do
      for ho:=1 to 40 do
        begin
          sc2[ho, ve]:=sc2[ho, ve-1];
        end;}
  End;

BEGIN
clrscr;
randomize;
{cursoroff;}
 InitScr;
 Repeat
   ParseScr;
   Delay(1100);
   DrawScr;
 Until KeyPressed;
END.