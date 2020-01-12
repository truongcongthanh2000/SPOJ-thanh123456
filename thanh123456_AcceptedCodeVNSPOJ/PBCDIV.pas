const
   fin='';fon='';
var
   n,a,b:qword;
   i:longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n);
   end;
procedure tinh(a,b:qword);
   var
      kq1,kq2,kq3:int64;
   begin
   kq1:=(b div 12)-((a-1) div 12);
   kq2:=(b div 30)-((a-1) div 30);
   kq3:=(b div 60)-((a-1) div 60);
   writeln(kq1+kq2-2*kq3);
   end;
procedure xuli;
   begin
   for i:=1 to n do
      begin
      readln(a,b);
      tinh(a,b);
      end;
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.
