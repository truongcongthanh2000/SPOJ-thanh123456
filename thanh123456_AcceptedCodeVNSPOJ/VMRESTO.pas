const
   fin='';fon='';
var
   kqmax,max,n:int64;
   hang,t:array [0..100] of int64;
   a:array [1..100,1..100] of int64;
procedure nhap;
   var
      i,j:longint;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   max:=0;
   for i:=1 to n do
      begin
      for j:=1 to n do
         begin
         read(a[i,j]);
         hang[i]:=hang[i]+a[i,j];
         end;
      t[i]:=t[i-1]+hang[i];
      end;
   end;
procedure dienvaobang;
   var
      i:longint;
   begin
   kqmax:=0;
   for i:=2 to n do
      begin
      a[i,i]:=hang[1]-hang[i];
      inc(kqmax,a[i,i]);
      end;
   kqmax:=(hang[1]-kqmax) div (n-1);
   for i:=1 to n do
      a[i,i]:=a[i,i]+kqmax;
   end;
procedure xuat;
   var
      i,j:longint;
   begin
   for i:=1 to n do
      begin
      for j:=1 to n do write(a[i,j],' ');
      writeln;
      end;
   close(input);
   close(output);
   end;
begin
nhap;
dienvaobang;
xuat;
end.



