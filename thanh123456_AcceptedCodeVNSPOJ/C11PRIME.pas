const
   fin='';fon='';
   maxn=trunc(1e6);
   tam=trunc(1e18);
var
   n:int64;
   top:longint;
   a:array [1..maxn] of int64;
   p:array [1..maxn] of boolean;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assigN(output,fon);rewrite(output);
   readln(n);
   end;
function KTSNT(n:int64):boolean;
var
        i:longint;
begin
        for i:=2 to trunc(sqrt(n)) do
                if n mod i=0 then
                        exit(false);
        exit(true);
end;
function check(x,vitri:int64):int64;
   var
      i:longint;
      kq:int64;
   begin
   kq:=1;
   //writeln(vitri);
   for i:=1 to vitri do
      begin
      if n mod kq<>0 then exit(0);
      kq:=(kq*x) mod tam;
      end;
   exit(kq);
   end;
procedure xuli;
   var
      i:longint;
      x:int64;
   begin
   for i:=2 to 60 do
      begin
      //x:=round(exp(ln(n)/i));
      x:=round(exp(ln(n)/i));
      if (check(x,i)=n) and (ktsnt(x)=true) then
         begin
         writeln(x,' ',i);
         exit;
         end;
      end;
   writeln(0);
   close(input); close(output);
   end;
begin
nhap;
xuli;
end.

