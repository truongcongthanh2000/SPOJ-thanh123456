const
   fin='';fon='';
var
   i,n,max,d,k:longint;
   a,c:array [1..200000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do
      readln(a[i]);
   end;
procedure taomang;
   begin
   k:=2;
   c[1]:=1;
   while c[k-1]+k<=trunc(1e8) do
      begin
      c[k]:=c[k-1]+k;
      inc(k);
      end;
   dec(k);
   end;
function ktra(x:longint):boolean;
   var
      l,r,m:longint;
   begin
   l:=1;
   r:=k;
   repeat
      m:=(l+r) div 2;
      if c[m]=x then exit(true)
      else
         begin
         if c[m]<x then l:=m+1
         else r:=m-1;
         end;
   until l>r;
   exit(false);
   end;
procedure xuli;
   begin
   d:=0; max:=0;
   for i:=1 to n do
      begin
      if (a[i]>=a[i-1]) and (ktra(a[i])) and (ktra(a[i-1])) then inc(d)
      else
         begin
         if ktra(a[i]) then d:=1
         else
            begin
            if d>max then max:=d;
            d:=0;
            end;
         end;
      end;
   if d>max then max:=d;
   writeln(max);
   close(input);
   close(output);
   end;
begin
nhap;
taomang;
xuli;
end.

