     ///1 2 4 7 13 24 44.....
     //f[i-1],f[i],f[i+1] => f[i],f[i+1],f[i+2]
     // f[i]   = 0 * f[i-1]+ 1 * f[i]+ 0 * f[i+1]
     // f[i+1] = 0 * f[i-1]+ 0 * f[i]+ 1 * f[i+1]
     // f[i+2] = 1 * f[i-1]+ 1 * f[i]+ 1 * f[i+1]
     ///0 1 0
     ///0 0 1
     ///1 1 1
const
     fin='';fon='';
type
     matrix=array [1..3,1..3] of int64;
var
     n,module:int64;
     a:matrix;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n,module);
     end;
Function NhanMt(a,b:matrix):matrix;
     var
          i,j,k:longint;
          c:matrix;
     begin
          fillchar(c,sizeof(c),0);
          for i:=1 to 3 do
               for j:=1 to 3 do
                    for k:=1 to 3 do
                         c[i,j]:=(c[i,j]+a[i,k]*b[k,j]) mod module;
          exit(c);
     end;
Function Mu(n:int64):matrix;
     var
          tmp:matrix;
     begin
          if n=1 then exit(a);
          tmp:=Mu(n div 2);
          tmp:=NhanMt(tmp,tmp);
          if n mod 2=1 then tmp:=NhanMt(tmp,a);
          exiT(tmp);
     end;
procedure Solve;
     var
          i,j:longint;
          res:matrix;
     begin
          //init
          a[1,1]:=0; a[1,2]:=1; a[1,3]:=0;
          a[2,1]:=0; a[2,2]:=0; a[2,3]:=1;
          a[3,1]:=1; a[3,2]:=1; a[3,3]:=1;
          //solve
          res:=Mu(n);
          {for i:=1 to 3 do
               begin
                    for j:=1 to 3 do write(res[i,j],' ');
                    writeln;
               end;   }
          writeln(res[3,3]);
          close(input); close(output);
     end;
begin
     nhap;
     Solve;
end.