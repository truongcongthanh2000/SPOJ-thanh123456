const
   fin='';fon='';
var
   i,a,b,t,d:int64;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(a,b);
   end;
function ucln(x,y:longint):longint;
   var
      t:longint;
   begin
   t:=y mod x;
   while t<>0 do
      begin
      t:=x mod y;
      x:=y;
      y:=t;
      end;
   exit(x);
   end;
function dao(x:int64):int64;
   var
      i,c:int64;
   begin
   c:=0;
   while x>0 do
      begin
      i:=x mod 10;
      x:=x div 10;
      c:=c*10+i;
      end;
   exit(c);
   end;
procedure xuli;
   begin
   i:=a;
   while i<=b do
      begin
      t:=dao(i);
      if ucln(i,t)=1 then inc(d);
      inc(i);
      end;
   writeln(d);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.