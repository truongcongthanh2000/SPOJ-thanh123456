const
   fin='';fon='';
var
   b,c:array [1..100] of int64;
   f,kb:array [0..100] of string;
   n,k,thu:int64;
   s,tam,dem:string;
   i,j:longint;
   code:integer;
   ktra:array [1..100] of boolean;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,k);
   readln(s);
   for i:=1 to k do read(b[i]);
   end;
function cong(a,b:string):string;
   var
      c:string;
      du,x,y,t,i:longint;
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
   if du>0 then
      c:='1'+c;
   exit(c);
   end;
function nhan1so(a:string;b:longint):string;
   var
      c,tam:string;
      i:longint;
      s,du:int64;
   begin
   c:='';
   du:=0;
   for i:=length(a) downto 1 do
      begin
      s:=(ord(a[i])-48)*b+du;
      du:=s div 10;
      c:=chr(s mod 10+48)+c;
      end;
   if du>0 then str(du,tam) else tam:='';
   c:=tam+c;
   while (c[1]='0') and (length(c)>0) do delete(c,1,1);
   exit(c);
   end;
function tru(a,b:string):string;
   var
      du,x,y,t:longint;
      c:string;
   begin
   while length(a)>length(b) do b:='0'+b;
   du:=0;
   c:='';
   for i:=length(a) downto 1 do
      begin
      x:=ord(a[i])-48;
      y:=ord(b[i])-48;
      t:=x-y-du;
      if t<0 then
         begin
         t:=t+10;
         du:=1;
         end
      else du:=0;
      c:=chr(t+48)+c;
      end;
   while (c[1]='0') and (length(c)>1) do delete(c,1,1);
   exit(c);
   end;
function sosanh(a,b:string):longint;
   begin
   while length(a)>length(b) do b:='0'+b;
   while length(a)<length(b) do a:='0'+a;
   if a=b then exit(0);
   if a>b then exit(1);
   exit(-1);
   end;
function bigDiv(a,b:string):string;
   var
      c,hold:string;
      i,k:longint;
   begin
   kb[0]:='0';
   for i:=1 to 10 do kb[i]:=cong(kb[i-1],b);
   hold:='';
   c:='';
   for i:=1 to length(a) do
      begin
      hold:=hold+a[i];
      k:=1;
      while sosanh(hold,kb[k])<>-1 do inc(k);
      c:=c+chr(k-1+48);
      hold:=tru(hold,kb[k-1]);
      end;
   while (c[1]='0') and (length(c)>0) do delete(c,1,1);
   exit(c);
   end;
function bigMod(a,b:string):string;
   var
      i,k:longint;
      hold:string;
   begin
   if length(a)<length(b) then exit(a);
   kb[0]:='0';
   for i:=1 to 10 do kb[i]:=cong(kb[i-1],b);
   hold:='';
   for i:=1 to length(a) do
      begin
      hold:=hold+a[i];
      k:=1;
      while sosanh(hold,kb[k])<>-1 do inc(k);
      hold:=tru(hold,kb[k-1]);
      end;
   exit(hold);
   end;
procedure QHD;
   begin
   f[0]:='1';
   for i:=1 to 100 do
      f[i]:=nhan1so(f[i-1],(n-k+i));
   end;
function kt(a,b:string):boolean;
   begin
   if b='0' then exit(false);
   if (bigMod(a,b))='0' then exit(true);
   exit(false);
   end;
procedure xuli;
   var i:longint;
   begin
   for i:=1 to n do  ktra[i]:=true;
   for i:=1 to k do
      begin
      tam:=bigDiv(s,f[k-i]);
      if kt(s,f[k-i])=false then tam:=cong(tam,'1');
      dem:='0';
      for j:=1 to n do
         begin
         if ktra[j]=true then dem:=cong(dem,'1');
         if sosanh(tam,dem)=0 then break;
         end;
      c[i]:=j;
      ktra[c[i]]:=false;
      val(dem,thu,code);
      s:=tru(s,nhan1so(f[k-i],thu-1));
      end;
   for i:=1 to k do write(c[i],' ');
   writeln;
   end;
procedure xuli2;
   begin
   for i:=1 to n do ktra[i]:=true;
   dem:='1';
   for i:=1 to k do
      begin
      tam:='0';
      for j:=1 to b[i] do
         begin
         if ktra[j]=true then tam:=cong(tam,'1');
         end;
      val(tam,thu,code);
      dem:=cong(dem,nhan1so(f[k-i],thu-1));
      ktra[b[i]]:=false;
      end;
   writeln(dem);
   end;
begin
nhap;
qhd;
xuli;
xuli2;
end.


