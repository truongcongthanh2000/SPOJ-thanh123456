const
   fin='';fon='';
var
   a,b:qword;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(a,b);
   end;
function cong(a,b:ansistring):ansistring;
   var
      i,du,x,y,t:longint;
      c:ansistring;
   begin
   while length(a)>length(b) do b:='0'+b;
   while length(a)<length(b) do a:='0'+a;
   c:='';
   du:=0;
   for i:=length(a) downto 1 do
      begin
      x:=ord(a[i])-48;
      y:=ord(b[i])-48;
      t:=x+y+du;
      du:=t div 10;
      c:=chr(t mod 10+48)+c;
      end;
   if du>0 then c:='1'+c;
   exit(c);
   end;
procedure xuli;
   begin
   writeln(a+b);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.
