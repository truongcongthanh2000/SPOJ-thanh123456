const
	fin=''; fon='';
var
   t,i,n,k,max:longint;
   a,f:array [0..1000000] of int64;
   c:array [1..1000000] of longint;
function gtmax(a,b:longint):longint;
   begin
   if a>=b then exit(a)
   else exit(b);
   end;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(t);
   max:=0;
   for i:=1 to t do
      begin
      readln(c[i]);
      max:=gtmax(max,c[i]);
      end;
   end;
procedure tinh;
   begin
   a[0]:=0; a[1]:=1;
   for i:=1 to max div 2 do
      begin
      a[i*2]:=a[i];
      a[i*2+1]:=a[i]+a[i+1];
      end;
   end;
procedure qhd;
   begin
   f[1]:=1;
   for i:=2 to max do
      begin
      f[i]:=gtmax(f[i-1],a[i]);
      end;
   end;
procedure xuli;
   begin
   for k:=1 to t do writeln(f[c[k]]);
   close(input);
   close(output);
   end;
begin
nhap;
tinh;
qhd;
xuli;
end.

