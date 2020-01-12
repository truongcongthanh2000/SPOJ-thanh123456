uses math;
const
     fin='';fon='';
var
     test:longint;
     d:array [1..5] of longint;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
     end;
procedure init;
     var
          i,n,x:longint;
     begin
          readln(n);
          for i:=1 to 5 do
               d[i]:=0;
          for i:=1 to n do
               begin
                    read(x);
                    inc(d[x]);
               end;
     end;
procedure solve;
     var
          i,res:longint;
     begin
          res:=0;
          res:=Min(d[4],d[5])+Min(d[2],d[3])+d[1]; //1
          res:=Max(res,Min(Min(d[4],d[5])+d[1],d[3])+d[2]); //2;
          res:=Max(res,Min(Min(d[4],d[5])+d[1],d[2])+d[3]); //3;
          res:=Max(res,Min(Min(d[2],d[3])+d[1],d[5])+d[4]); //4;
          res:=Max(res,Min(Min(d[2],d[3])+d[1],d[4])+d[5]); //5;
     writeln(res);
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    write('Case ',i,': ');
                    init;
                    solve;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.

