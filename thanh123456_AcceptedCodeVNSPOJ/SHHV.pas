const
   fin='';fon='';
var
   n,i,j,l,vitri,p:longint;
   a,vt,b:array [1..10000] of longint;
   f:array [0..10000] of int64;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewritE(output);
   n:=0;
   while not seekeoln(input) do
      begin
      inc(n);
      read(a[n]);
      end;
   readln(p);
   end;
procedure QHd;
   begin
   f[0]:=1;
   for i:=1 to 12 do f[i]:=f[i-1]*i;
   for i:=1 to 12 do vt[i]:=i; //////so phan tu <= i
   end;
procedure xuatVitri;
   begin
   vitri:=1;
   for i:=1 to n do
      begin
      vitri:=vitri+(vt[a[i]]-1)*f[n-i];
      for j:=a[i]+1 to n do dec(vt[j]);
      end;
   writeln(vitri);
   end;
procedure xuatDay;
   begin
   for i:=1 to n do vt[i]:=i;
   vitri:=1;
   for i:=1 to n do
      begin
      for j:=1 to n do
         begin
         if vitri+j*f[n-i] > p then
            begin
            l:=j-1;
            break;
            end;
         end;
      vitri:=vitri+l*f[n-i];
      b[i]:=vt[l+1];
      for j:=l+1 to n do vt[j]:=vt[j+1];
      end;
   for i:=1 to n do write(b[i],' ');
   end;
procedure xuli;
   begin
   xuatVitri;
   xuatDay;
   close(input);
   close(output);
   end;
begin
nhap;
qhd;
xuli;
end.
