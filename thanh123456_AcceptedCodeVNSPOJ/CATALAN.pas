const
   fin='';fon='';
var
   n,i,j,x,y,k:longint;
   s,thu:int64;
   a,f:array [1..1000,1..1000] of longint;
   b,c:array [1..10000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assigN(output,fon);rewrite(output);
   readln(n);
   for i:=1 to 2*n+1 do read(b[i]);
   readln(Thu);
   end;
procedure taomang;
   begin
   inc(n);
   for i:=1 to n do a[i,i]:=0;
   for i:=2 to n do
      begin
      for j:=1 to i-1 do
         a[i,j]:=a[i-1,j]+1;
      end;
   f[n,n]:=1;
   for i:=n downto 1 do
      begin
      for j:=i downto 1 do
         begin
         if (i=n) and (j=n) then continue;
         f[i,j]:=f[i+1,j]+f[i,j+1];
         end;
      end;
   end;
procedure xuli1;
   begin
   s:=f[1,1];
   x:=0; y:=1;
   for i:=1 to 2*n-2 do
      begin
      if b[i]=a[x+1,y] then inc(x)
      else inc(y);
      if b[i+1]<>a[x+1,y] then s:=s-f[x+1,y];
      end;
   writeln(s);
   end;
procedure xuli2;
   begin
   x:=1;
   y:=1;
   c[1]:=0;
   k:=1;
   Thu:=f[1,1]-Thu;
   while 1>0 do
      begin
      if (f[x+1,y]>Thu) {or (y=x)} then
         begin
         inc(k);
         c[k]:=a[x+1,y];
         inc(x);
         end
      else
         begin
         inc(k);
         c[k]:=a[x,y+1];
         Thu:=Thu-f[x+1,y];
         inC(y);
         end;
      if (x=n) and (y=n) then break;
      end;
   for i:=1 to 2*n-1 do write(c[i],' ');
   end;
begin
nhap;
taomang;
xuli1;
xuli2;
end.

