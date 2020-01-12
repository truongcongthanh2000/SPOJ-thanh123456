const
   fin='';fon='';
var
   n,m,i,x,y,u,v:longint;
   a:array [1..1000000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m);
   end;
procedure init;
   begin
   for i:=1 to n do a[i]:=-1;
   end;
function TimGoc(i:longint):longint;
   var
      j:longint;
   begin
   j:=i;
   while a[j]<>-1 do j:=a[j];
   exit(j);
   end;
procedure DaoGoc(i:longint);
   begin
   if a[i]<>-1 then DaoGoc(a[i]);
   if a[i]<>-1 then a[a[i]]:=i;
   end;
procedure Cay;
   begin
   init;
   for i:=2 to n do
      begin
      readln(x,y);
      if y=1 then
         begin
         if TimGoc(i)<>TimGoc(x) then
            begin
            if a[i]=-1 then a[i]:=x
               else
               if a[x]=-1 then a[x]:=i
                  else
                     begin
                     DaoGoc(a[i]);
                     a[i]:=x;
                     end;
            end;
         end;
      end;
   end;
procedure TruyVan(u,v:longint);
   begin
   if TimGoc(u)<>TimGoc(v) then writeln('YES')
   else writeln('NO');
   end;
procedure xuat;
   begin
   for i:=1 to m do
      begin
      readln(u,v);
      TruyVan(u,v);
      end;
   close(input);
   close(output);
   end;
begin
nhap;
Cay;
xuat;
end.

