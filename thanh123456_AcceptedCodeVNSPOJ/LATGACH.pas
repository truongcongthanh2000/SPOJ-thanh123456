const
   fin=''; fon='';
var
   i,n:longint;
   a:array [1..100] of longint;
   f:array [1..100] of ansistring;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do readln(a[i]);
   end;
function cong(a,b:ansistring):ansistring;
   var
      i,du,x,y,t:longint;
      c:ansistring;
   begin
   while length(a)>length(b) do b:='0'+b;
   while length(a)<length(b) do a:='0'+a;
   du:=0;
   c:='';
   for i:=length(a) downto 1 do
      begin
      x:=ord(a[i])-48;
      y:=ord(b[i])-48;
      t:=x+y+du;
      du:=t div 10;
      c:=chr(t mod 10+48)+c;
      end;
   if du=1 then c:='1'+c;
   exit(c);
   end;
procedure tao;
   begin
   f[1]:='1';
   f[2]:='2';
   for i:=3 to 100 do
      f[i]:=cong(f[i-1],f[i-2]);
   end;
procedure xuli;
   begin
   tao;
   for i:=1 to n do
      writeln(f[a[i]]);
   end;
begin
nhap;
xuli;
end.
