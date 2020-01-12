const
     fin='';fon='';
     maxn=2564;
type
     mang=array [0..maxn] of byte;
var
     n,m,res:integer;
     a:array [0..1000] of mang;
Function Cong(a,b:mang):mang;
     var
          i,x,y,s,du:integer;
          c:mang;
     begin
          du:=0;
          for i:=maxn downto 0 do
               begin
                    c[i]:=0;
                    s:=a[i]+b[i]+du;
                    du:=s div 10;
                    c[i]:=s mod 10;
               end;
          exit(c);
     end;
Function Nhan(a:mang;b:integer):mang;
     var
          i,x,y,s,du:integer;
          c:mang;
     begin
          du:=0;
          for i:=maxn downto 0 do
               begin
                    c[i]:=0;
                    s:=a[i]*b+du;
                    du:=s div 10;
                    c[i]:=s mod 10;
               end;
          exit(c);
     end;
procedure nhap;
     var
          i,j,tmp:integer;
          res:mang;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n);
          if n=2 then
               begin
                    writeln(1);
                    exit;
               end;
          i:=maxn;
          tmp:=n-2;
          while (tmp>0) do
               begin
                    a[0][i]:=tmp mod 10;
                    tmp:=tmp div 10;
                    dec(i);
               end;
          a[n-2][maxn]:=1;
          res:=Cong(a[n-2],a[0]);
          for i:=1 to n-2 do
               begin
                    a[i]:=Nhan(a[i-1],(n-2-i));
                    res:=Cong(a[i],res);
               end;
          for i:=0 to maxn do
               begin
                    if res[i]<>0 then
                         begin
                              for j:=i to maxn do write(res[j]);
                              //writeln;
                              //writeln(maxn-i+1);
                              exit;
                         end;
               end;
          //a[n-2][maxn]:=1;
          //writeln(length(a[n-3]));
     end;
procedure solve;
     var
          i,j:integer;
          res:mang;
     begin
          for i:=0 to maxn do res[i]:=0;
          for i:=0 to n-2 do res:=Cong(res,a[i]);
          for i:=0 to maxn do
               begin
                    if res[i]<>0 then
                         begin
                              for j:=i to maxn do write(res[j]);
                              writeln;
                              writeln(maxn-i+1);
                              exit;
                         end;
               end;
     close(input); close(output);
     end;
begin
     nhap;
     //solve;
end.
