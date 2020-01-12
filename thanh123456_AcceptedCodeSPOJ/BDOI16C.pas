uses math;
const
     fin='';fon='';
     maxn=2000;
     maxk=3000;
     module=10007;
type
     mang=array [0..maxn,-1..maxk] of longint;
var
     test,n,k:longint;
     f,c:mang;
procedure nhap;
     begin
          assigN(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
     end;
procedure qhd;
     var
          i,j:longint;
     begin
          for i:=1 to maxn do
               begin
                    f[i,0]:=1;
                    c[i,0]:=1;
               end;
          for i:=1 to maxn do
               for j:=1 to maxk do
                    begin
                         f[i,j]:=c[i-1,j] mod module;
                         if i<=j then
                              f[i,j]:=(f[i,j]-c[i-1,j-i]+module) mod module;
                         c[i,j]:=(c[i,j-1]+f[i,j]) mod module;
                    end;
     end;
procedure nhapdulieu_xuat;
     var
          i:longint;
          res,gt:longint;
     begin
          readln(n,k);
          gt:=1;
          for i:=1 to n do gt:=(gt*i) mod module;
          res:=(gt-c[n,k-1]+module) mod module;
          writeln(res);
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    write('Case ',i,': ');
                    nhapdulieu_xuat;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     qhd;
     xuat;
end.
