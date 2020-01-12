const
   fin='';fon='';
var
   i,j,a,b:qword;
   c:array [1..200000] of qword;
   p:array [2..200000] of boolean;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(a,b);
   end;
procedure sieve;
   begin
   fillchar(p,sizeof(p),true);
   i:=2;
   while i<=trunc(sqrt(200000)) do
      begin
      if p[i] then
         begin
         j:=i*i;
         while j<=200000 do
            begin
            p[j]:=false;
            j:=j+i;
            end;
         end;
      inc(i);
      end;
   end;
procedure xuli;
   begin
   i:=a;
   while i<=b do
      begin
      if p[i]=true then writeln(i);
      inc(i);
      end;
   close(input);
   closE(output);
   end;
begin
nhap;
sieve;
xuli;
end.
