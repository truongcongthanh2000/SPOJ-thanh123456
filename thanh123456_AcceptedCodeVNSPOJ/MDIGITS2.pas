const
	fin='';fon='';
var
   k:qword;
   j,d,i:longint;
   s,s2,s1,n:ansistring;
begin
assign(input,fin);
reset(input);
assign(output,fon);
rewrite(output);
readln(n);
s:='';
for i:=1 to 100000 do
   begin
   str(i,s1);
   s:=s+s1;
   end;
writeln(pos(n,s));
close(input);
close(output);
end.

