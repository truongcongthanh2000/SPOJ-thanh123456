const
   fin='';fon='';
var
   i,n,m,top,x,y,dem,j:longint;
   a,u,v,h,a1:array [1..trunc(1e6)] of longint;
   c:char;
procedure nhap;
   begin
   assigN(input,fin);reset(input);
   assign(output,fon);rewritE(output);
   readln(n);
   readln(m);
   end;
procedure init;
   begin
   for i:=1 to n do a[i]:=-1;
   end;
function timGoc(i:longinT):longint;
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
procedure push(x,y:longint);
   begin
   inc(top);
   u[top]:=x;
   v[top]:=y;
   inc(h[x]);
   inc(h[y]);
   end;
procedure taoDothi;
   begin
   init;
   for i:=1 to m do
      begin
      readln(c,x,y);
      if c='F' then
         begin
         if TimGoc(x)<>TimGoc(y) then
            begin
            if a[x]=-1 then a[x]:=y
               else
               if a[y]=-1 then a[y]:=x
                  else
                     begin
                     DaoGoc(x);
                     a[x]:=y;
                     end;
            end;
         end
      else
         push(x,y);
      end;
   end;
procedure taomang;
   begin
   for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
   for i:=top downto 1 do
      begin
      a1[h[u[i]]]:=v[i];
      dec(h[u[i]]);
      a1[h[v[i]]]:=u[i];
      dec(h[v[i]]);
      end;
   for i:=1 to n do
      begin
      for j:=h[i]+2 to h[i+1] do
         begin
         x:=a1[j];
         y:=a1[j-1];
         if TimGoc(x)<>Timgoc(y) then
            begin
            if a[x]=-1 then a[x]:=y
               else
               if a[y]=-1 then a[y]:=x
                  else
                     begin
                     DaoGoc(x);
                     a[x]:=y;
                     end;
            end;
         end;
      end;
   end;
procedure xuat;
   begin
   dem:=0;
   for i:=1 to n do
      if a[i]=-1 then inc(dem);
   writeln(dem);
   close(input);
   closE(output);
   end;
begin
nhap;
taodothi;
taomang;
xuat;
end.

