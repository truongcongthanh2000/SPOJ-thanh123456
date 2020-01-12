const
     fin='';fon='';
     maxn=401;
type
     mang1=array [0..maxn,0..maxn] of char;
     mang2=array [0..maxn] of longint;
var
     n,m,top:longint;
     c:mang1;
     l,r,d,stack:mang2;
procedure nhap;
     var
          i,j:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n,m);
          for i:=1 to n do
               begin
                    for j:=1 to m do
                         read(c[i,j]);
                    readln;
               end;
     end;
procedure push(x:longint);
     begin
          inc(top);
          stack[top]:=x;
     end;
Function Get:longint;
     begin
          exit(stack[top]);
     end;
Procedure pop;
     begin
          stack[top]:=0;
          dec(top);
     end;
Function Dem(x,y,z:char):int64;
     var
          i,j,res:longint;
          s:int64;
     begin
          s:=0;
          for i:=1 to m do d[i]:=0;
          for i:=1 to n do
               begin
                    for j:=1 to m do
                         begin
                              if (c[i,j]=x) or (c[i,j]=y) or (c[i,j]=z) then
                                   inc(d[j])
                              else d[j]:=0;
                         end;
                    top:=0;
                    push(1);
                    l[1]:=1;
                    for j:=2 to m do
                         begin
                              res:=0;
                              while (top>0) and (d[j]<d[get]) do
                                   begin
                                        res:=res+l[get];
                                        pop;
                                   end;
                              l[j]:=res+1;
                              push(j);
                         end;
                    top:=0;
                    push(m);
                    r[m]:=1;
                    for j:=m-1 downto 1 do
                         begin
                              res:=0;
                              while (top>0) and (d[j]<=d[get]) do
                                   begin
                                        res:=res+r[get];
                                        pop;
                                   end;
                              r[j]:=res+1;
                              push(j);
                         end;
                    for j:=1 to m do
                         begin
                              if (c[i,j]=x) or (c[i,j]=y) or (c[i,j]=z) then
                                   s:=s+int64(l[j]*r[j]*d[j]);
                         end;
               end;
          exit(s);
     end;
procedure solve;
     var
          x,y,z:char;
          res:int64;
     begin
          res:=0;
          for x:='A' to 'E' do
               for y:=Succ(x) to 'E' do
                    begin
                         for z:=Succ(y) to 'E' do
                              res:=res+Dem(x,y,z)-Dem(x,x,y)-Dem(z,x,z)-Dem(y,y,z)+Dem(x,x,x)+Dem(y,y,y)+Dem(z,z,z);
                    end;
          writeln(res);
          //writeln(Dem('C','C','E'));
     close(input); close(output);
     end;
begin
     nhap;
     solve;
end.

