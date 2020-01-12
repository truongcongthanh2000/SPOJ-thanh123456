const
   fin='';
   fon='';
   max=100000;
var
   p:array [1..max] of longint;
   i,j,d,n,l,r,k:longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(l,r);
   end;
procedure tong;
   begin
   k:=1;
   while k<=max do
      begin
      p[k]:=1;
      inc(k);
      end;
   i:=2;
   while i<=max do
      begin
      j:=i+i;
      while j<=max do
         begin
         p[j]:=p[j]+i;
         j:=j+i;
         end;
      inc(i);
      end;
   end;
procedure xuli;
   begin
   i:=l;
   d:=0;
   while i<=r do
      begin
      if p[i]>i then begin inc(d); end;
      inc(i);
      end;
   end;
procedure xuat;
   begin
   writeln(d);
   close(input);
   close(output);
   end;
begin
nhap;
tong;
xuli;
xuat;
end.

