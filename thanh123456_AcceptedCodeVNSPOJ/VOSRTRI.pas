const
   fin='';fon='';
var
   n,i,j:longint;
   f:array [0..2,0..trunc(1e5)] of int64;
   d,x,y,d2:array [1..trunc(1e5)] of longint;
   s:int64;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   for i:=1 to n do
      begin
      readln(x[i],y[i]);
      inc(d[x[i]]);
      inc(d2[y[i]]);
      end;
   end;
procedure taomang;
   begin
   f[0,0]:=1;
   for i:=1 to 2 do
      for j:=1 to trunc(1e5) do f[i,j]:=f[i,j-1]+f[i-1,j-1];
   {for i:=1 to 2 do
      begin
      for j:=1 to 10 do write(f[i,j],' ');
      writeln;
      end; }
   end;
procedure tinh;
   begin
   s:=0;
   for i:=1 to n do
      s:=s+f[2,d[x[i]]]*f[2,d2[y[i]]];
   writeln(s);
   close(input);
   close(output);
   end;
begin
nhap;
taomang;
tinh;
end.
