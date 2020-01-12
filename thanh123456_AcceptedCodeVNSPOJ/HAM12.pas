const
   fin='';fon='';
var
   n,m,k:longint;
   s:ansistring;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m,k);
   readln(s);
   end;
function min(a,b:longint):longint;
   begin
   if a<b then exit(a)
   else exit(b);
   end;
procedure xuli;
   var
      i,j,u,kq,dem:longint;
      t:ansistring;
   begin
   kq:=maxlongint;
   for i:=1 to m-1 do s:=s+s[i];
   inc(n,m-1);
   for i:=1 to k do
      begin
      readln(t);
      for j:=1 to n-m+1 do
         begin
         dem:=0;
         for u:=1 to m do
            if t[u]<>s[j+u-1] then  inc(dem);
         kq:=min(kq,dem);
         end;
      end;
   writeln(kq);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.
