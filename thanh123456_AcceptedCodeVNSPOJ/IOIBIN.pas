const
   fin='';fon='';
var
   i,n,p,x,y,c,u,v:longint;
   a:array [1..1000000] of longint;
procedure nhap;
   begin
   assigN(input,fin);reset(input);
   assign(output,fon);rewritE(output);
   readln(p);
   n:=trunc(1e4);
   end;
procedure init;
   begin
   for i:=1 to n do a[i]:=-1;
   end;
function TimGoc(i:longint):longint;
   begin
   if a[i]=-1 then exit(i)
   else
      begin
      a[i]:=TimGoc(a[i]);
      exit(a[i]);
      end;
   end;
procedure DaoGoc(i:longint);
   begin
   if a[i]<>-1 then DaoGoc(a[i]);
   if a[i]<>-1 then a[a[i]]:=i;
   end;
procedure xuli;
   begin
   init;
   for i:=1 to p do
      begin
      readln(x,y,c);
      u:=TimGoc(x);
      v:=TimGoc(y);
      if c=1 then
         begin
            begin
            if u<>v then a[u]:=v;
            end;
         end
      else
         begin
         if u=v then writeln(1)
         else writeln(0);
         end;
      end;
   end;
begin
nhap;
xuli;
end.

