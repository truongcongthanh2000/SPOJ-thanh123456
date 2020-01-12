const
   fin='';fon='';
   maxn=trunc(1e4);
var
   test,n:longint;
   free:array [-trunc(1e5)..trunc(1e5)] of boolean;
   a:array [0..maxn] of longint;
procedure nhap;
   begin
      assign(input,fin);reset(input);
      assign(output,fon);rewrite(output);
      readln(test);
   end;
procedure docdulieu;
   var
      i:longint;
   begin
   for i:=-maxn to maxn do free[i]:=false;
      readln(n);
      for i:=1 to n do
         begin
         read(a[i]);
         free[a[i]]:=true;
         end;
   end;
procedure xuli;
   var
      i,dem:longint;
   begin
   dem:=0;
   for i:=1 to n do
      begin
      if (a[i] mod 2=0) and (free[a[i] div 2]=true) then
         begin
         free[a[i] div 2]:=false;
         inc(dem);
         end;
      end;
   writeln(dem);
   end;
procedure xuat;
   var
      i:longint;
   begin
   for i:=1 to test do
      begin
      docdulieu;
      xuli;
      end;
   close(input); close(output);
   end;
begin
nhap;
xuat;
end.
