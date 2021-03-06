const
     fin='';fon='';
     maxn=2000;
type
     mang1=array [0..maxn,0..maxn] of char;
     mang2=array [0..maxn] of longint;
var
     n,m,top:longint;
     a:mang1;
     d,l,r,stack:mang2;
procedure nhap;
     var
          i,j:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n,m);
          for i:=1 to n do
               begin
                    for j:=1 to m do read(a[i,j]);
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
procedure solve;
     var
          i,j,res:longint;
          s:int64;
     begin
          s:=0;
          for i:=1 to n do
               begin
                    for j:=1 to m do
                         begin
                              if a[i,j]='1' then inc(d[j])
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
                              //writeln(l[j],' ',r[j]);
                              if a[i,j]='0' then continue;
                              s:=s+int64(l[j]*r[j]*d[j]);
                         end;
                    //writeln(s);
               end;
          writeln(s);
     close(input); close(output);
     end;
begin
     nhap;
     solve;
end.
