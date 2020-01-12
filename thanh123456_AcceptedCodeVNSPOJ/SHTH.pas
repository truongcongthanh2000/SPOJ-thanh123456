const
   fin='';fon='';
var
   n,k,i,j,x,y,vitri,max:longint;
   Thu,m:string;
   f:array [0..300,0..300] of string;
   c,b:array [1..1000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assigN(output,fon);rewrite(output);
   readln(n,k);
   readln(m);
   for i:=1 to k do read(b[i]);
   end;
function cong(a,b:string):string;
   var
      du,i,s:longint;
      c:string;
   begin
   while length(a)<length(b) do a:='0'+a;
   while length(a)>length(b) do b:='0'+b;
   du:=0; c:='';
   for i:=length(a) downto 1 do
      begin
      s:=ord(a[i])+ord(b[i])-2*48+du;
      du:=s div 10;
      c:=chr(s mod 10+48)+c;
      end;
   if du>0 then c:='1'+c;
   exit(c);
   end;
function tru(a,b:string):string;
   var
      i,du,s:longint;
      c:string;
   begin
   while length(a)<length(b) do a:='0'+a;
   while length(a)>length(b) do b:='0'+b;
   c:=''; du:=0;
   for i:=length(a) downto 1 do
      begin
      s:=ord(a[i])-ord(b[i])-du;
      if s<0 then
         begin
         s:=s+10;
         du:=1;
         end
      else du:=0;
      c:=chr(s+48)+c;
      end;
   while (c[1]='0') and (length(c)>1) do delete(c,1,1);
   exit(c);
   end;
function ss(a,b:string):boolean;
   begin
   while length(a)<length(b) do a:='0'+a;
   while length(a)>length(b) do b:='0'+b;
   if a>b then exit(true)
   else exit(false);
   end;
procedure QHD;
   begin
   f[0,0]:='1';   //// f[i,j] = gia tri chap i cua j
   for i:=1 to 300 do
      begin
      for j:=1 to 300 do f[i,j]:=cong(f[i,j-1],f[i-1,j-1]);
      end;
   end;
procedure xuli1;
   begin
   y:=n;      ///gia tri = n-y+1
   x:=k;      ///vi tri = n-k+1;
   for i:=1 to k do
      begin
      while ss(m,f[x,y])=true do
         begin
         m:=tru(m,f[x,y]);
         dec(y);
         end;
      c[i]:=n-y+1;
      dec(x); dec(y);
      end;
   for i:=1 to k do write(c[i],' ');
   writeln;
   end;
procedure xuli2;
   begin
   x:=k;
   y:=n;
   Thu:='1';
   for i:=1 to k do
      begin
      vitri:=n-b[i]+1;
      for j:=vitri+1 to y do thu:=cong(thu,f[x,j]);
      y:=vitri-1;
      dec(x);
      end;
   writeln(Thu);
   end;
begin
nhap;
qhd;
xuli1;
xuli2;
end.

