const
   fin='';fon='';
   du=20122007;
var
   n,top:longint;
   a:array [1..trunc(1e5)] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   end;
procedure push(x:longint);
   begin
   inc(top); a[top]:=x;
   end;
procedure taomang;
   var
      i,tam1,tam2:longint;
   begin
   top:=0;
   for i:=1 to trunc(sqrt(n)) do
      begin
      if n mod i=0 then
         begin
         tam1:=i;
         tam2:=n div i;
         if tam1=tam2 then push(tam1)
         else begin push(tam1); push(tam2); end;
         end;
      end;
   //for i:=1 to top do write(a[i],' ');
   end;
function tinh(x:longint):int64;
   var
      tam:int64;
   begin
   if x=1 then exit(3);
   tam:=tinh(x div 2);
   if x mod 2=1 then exit(((tam*tam) mod du)*3 mod du)
   else exit((tam*tam) mod du);
   end;
procedure xuat;
   var
      i:longint;
      kq:int64;
   begin
   kq:=1;
   for i:=1 to top do
      kq:=(kq*(tinh(a[i])-1)) mod du;
   writeln(kq);
   close(input);
   close(output);
   end;
begin
nhap;
taomang;
xuat;
end.

