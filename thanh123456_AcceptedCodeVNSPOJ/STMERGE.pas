uses math;
const
     fin='';fon='';
     maxm=trunc(1e16);
var
     test,n,m:longint;
     f:Array [0..1001,0..1001,0..1] of int64;
     c:array [0..1001,0..1001] of int64;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
     end;
procedure nhapdulieu;
     var
          i,j:longint;
     begin
          readln(n,m);
          for i:=1 to n do
               for j:=1 to m do read(c[i,j]);
     end;
procedure init;     ////0: x[i] ; 1: y[j]
     var
          i,j,k:longint;
     begin
          {for i:=1 to n do
               for j:=1 to m do
                    for k:=0 to 1 do
                         f[i,j,k]:=maxm;}
          f[1,1,0]:=c[1,1];
          f[1,1,1]:=c[1,1];
          for i:=2 to n do
               begin
                    f[i,1,1]:=c[i,1];
                    f[i,1,0]:=min(f[i-1,1,0],f[i-1,1,1]+c[i,1]);
               end;
          for i:=2 to m do
               begin
                    f[1,i,0]:=c[1,i];
                    f[1,i,1]:=min(f[1,i-1,1],f[1,i-1,0]+c[1,i]);
               end;
     end;
procedure qhd;
     var
          i,j:longint;
     begin
          for i:=2 to n do
               for j:=2 to m do
                    begin
                         f[i,j,0]:=min(f[i-1,j,0],f[i-1,j,1]+c[i,j]);
                         f[i,j,1]:=min(f[i,j-1,1],f[i,j-1,0]+c[i,j]);
                    end;
          {for i:=1 to n do
               begin
                    for j:=1 to m do write(f[i,j,0],' ');
                    writeln;
               end; }
          writeln(min(f[n,m,0],f[n,m,1]));
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    nhapdulieu;
                    init;
                    qhd;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.

