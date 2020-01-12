const
   fin='';fon='';
var
   n,k:longint;
   f,a,r:array [1..trunc(1e6)] of longint;
   s:array [1..trunc(1e6)] of char;
procedure nhap;
   var
      i:longint;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,k);
   for i:=1 to n do read(r[i]);
   readln;
   for i:=1 to k do read(s[i]);
   end;
function tinh(i:longinT):longint;
   var
      l,Thu,dem:longint;
   begin
   l:=0;
   dem:=0;
   while l<k+1 do
      begin
      inc(dem);
      thu:=l+r[i];
      while (thu<=k) and (s[thu]='1') do dec(thu);
      l:=thu;
      end;
   exit(dem);
   end;
procedure taomangA;
   var
      i:longint;
   begin
   for i:=1 to n do a[i]:=tinh(i);
   end;
procedure swap(var x,y:longint);
   var tam:longint;
   begin
   tam:=x; x:=y; y:=tam;
   end;
procedure qsort(l,r:longint);
   var
      i,j,x,m:longint;
   begin
   i:=l; j:=r;
   m:=random(r-l)+l+1;
   x:=a[m];
   repeat
      while a[i]<x do inc(i);
      while a[j]>x do dec(j);
      if i<=j then
         begin
         swap(a[i],a[j]);
         inc(i); dec(j);
         end;
   until i>j;
   if l<j then qsort(l,j);
   if i<r then qsort(i,r);
   end;
function min(a,b:longint):longint;
   begin
   if a<b then exit(a)
   else exit(b);
   end;
procedure qhd;
   var
      i:longint;
   begin
   f[1]:=a[1];
   f[2]:=a[2];
   f[3]:=a[1]+a[2]+a[3];
   for i:=4 to n do
      f[i]:=min(f[i-1]+a[i]+a[1],f[i-2]+(a[i]+a[2])+(a[1]+a[2]));
   writeln(f[n]);
   end;
begin
nhap;
taomangA;
qsort(1,n);
qhd;
end.



