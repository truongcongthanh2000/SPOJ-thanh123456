const
   fin='';fon='';
var
   k,max,i,j:longint;
   c,t:ansistring;
   a:array [1..100] of string;
   b:array [1..100] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   k:=0;
   max:=0;
   while not(eof(input)) do
      begin
      inc(k);
      readln(a[k]);
      b[k]:=length(a[k]);
      if length(a[k])>max then max:=length(a[k]);
      end;
   end;
procedure lamchocacsobangnhau;
   begin
   for i:=1 to k do
      begin
      while length(a[i])<max do a[i]:=a[i]+a[i][1];
      end;
   end;
procedure qsort(l,r:longint);
   var
      m,i,j,c:longint;
      x,t:string;
   begin
   i:=l;
   j:=r;
   m:=(l+r) div 2;
   x:=a[m];
   repeat
      while a[i]>x do inc(i);
      while a[j]<x do dec(j);
      if i<=j then
         begin
         t:=a[i];
         a[i]:=a[j];
         a[j]:=t;
         c:=b[i];
         b[i]:=b[j];
         b[j]:=c;
         inc(i);
         dec(j);
         end;       
   until i>j;
   if l<j then qsort(l,j);
   if i<r then qsort(i,r);
   end;
procedure xuli;
   begin
   lamchocacsobangnhau;
   qsort(1,k);
   c:='';
   for i:=1 to k do
      begin
      t:='';
      for j:=1 to b[i] do t:=t+a[i][j];
      c:=c+t;
      end;
   writeln(c);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.
