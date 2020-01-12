const
   fin='';fon='';
var
   i,n,jmax,j,t,k,dem:longint;
   a,c1,c2,d:array [0..10000000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   k:=0;
   for i:=1 to n do
      begin
      read(c1[i]);
      inc(k);
      d[k]:=0;
      end;
   for i:=1 to n do
      begin
      read(c2[i]);
      inc(k);
      d[k]:=1;
      end;
   n:=k;
   for i:=1 to n do
      begin
      if i<=n div 2 then a[i]:=c1[i]
      else a[i]:=c2[i-(n div 2)];
      end;
   end;
procedure qsort(l,r:longint);
   var
      i,j,m,x,t:longint;
   begin
   i:=l; j:=r;
   m:=(l+r) div 2;
   x:=a[m];
   repeat
      while a[i]<x do inc(i);
      while a[j]>x do dec(j);
      if i<=j then
         begin
         t:=a[i]; a[i]:=a[j]; a[j]:=t;
         t:=d[i]; d[i]:=d[j]; d[j]:=t;
         inc(i); dec(j);
         end;
   until i>j;
   if j>l then qsort(l,j);
   if i<r then qsort(i,r);
   end;
procedure xuli;
   begin
   qsort(1,n);
   dem:=0; i:=1;
   while i<=n-1 do
      begin
      if d[i]<>d[i+1] then
         begin
         inc(dem);
         inc(i,2);
         end
      else inc(i);
      end;
   writeln(dem);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.

