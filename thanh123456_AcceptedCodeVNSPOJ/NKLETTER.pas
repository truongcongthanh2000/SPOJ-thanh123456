const
   fin='';fon='';
var
   i,m,n,j,k:longint;
   s1,s2,tam:string;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(s1);
   readln(s2);
   n:=length(s1);
   m:=length(s2);
   end;
procedure xuli;
   begin
   tam:=s1;
   while (pos(tam,s2)<>1) and (tam<>'') do delete(tam,1,1);
   k:=length(tam);
   end;
procedure xuat;
   begin
   writeln(m+n-k);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
xuat;
end.
