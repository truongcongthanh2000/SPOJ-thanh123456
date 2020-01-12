const
   fin='';fon='';
var
   i,n,j:longint;
   min:int64;
   a,b:array [1..1000000] of int64;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do read(a[i]);
   for i:=1 to n do read(b[i]);
   end;
procedure qsort(l,r:longint);
   var
      i,j,x,m,t:longint;
   begin
   i:=l;
   j:=r;
   m:=(l+r) div 2;
   x:=a[m];
   repeat
      while a[i]<x do inc(i);
      while a[j]>x do dec(j);
      if i<=j then
         begin
         t:=a[i]; a[i]:=a[j]; a[j]:=t;
         inc(i); dec(j);
         end;
   until i>j;
   if l<j then qsort(l,j);
   if i<r then qsort(i,r);
   end;
procedure qsort1(l,r:longint);
   var
      i,j,x,m,t:longint;
   begin
   i:=l;
   j:=r;
   m:=(l+r) div 2;
   x:=b[m];
   repeat
      while b[i]>x do inc(i);
      while b[j]<x do dec(j);
      if i<=j then
         begin
         t:=b[i]; b[i]:=b[j]; b[j]:=t;
         inc(i); dec(j);
         end;
   until i>j;
   if l<j then qsort1(l,j);
   if i<r then qsort1(i,r);
   end;
procedure xuli;
   begin
   i:=1;
   j:=1;
   min:=maxlongint;
   while (i<=n) and (j<=n) do
      begin
      if abs(a[i]+b[j])<min then min:=abs(a[i]+b[j]);
      if a[i]+b[j]>0 then inc(j)
      else inc(i);
      end;
   writeln(min);
   close(input);
   close(output);
   end;
begin
nhap;
qsort(1,n);
qsort1(1,n);
xuli;
end.


