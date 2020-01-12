const
     fin='';fon='';
     maxn=trunc(1e5)+5;
var
     x,n,res:int64;
     b:array [0..maxn*4] of int64;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n,x);
          res:=n*(n+1) div 2;
     end;
procedure solve;
     var
          i:longint;
          s,tam,a:int64;
     begin
          b[maxn]:=1;
          s:=0;
          tam:=maxn;
          for i:=1 to n do
               begin
                    readln(a);
                    if a>=x then
                         begin
                              inc(tam);
                              s:=s-b[tam];
                         end
                    else
                         begin
                              s:=s+b[tam];
                              dec(tam);
                         end;
                    inC(b[tam]);
                    res:=res-s;
               end;
          writeln(res);
     close(input); close(output);
     end;
begin
     nhap;
     solve;
end.

