const
     fin='';fon='';
     base = 111539786;
type
     mt=array [0..3,0..3] of int64;
var
     a:mt;
     test:longint;
procedure nhap;
     begin
          assigN(input,fin);reset(input);
          assigN(output,fon);rewrite(output);
          readln(test);
          a[1,1]:=0; a[1,2]:=1;
          a[2,1]:=1; a[2,2]:=1;
     end;
Function Nhan(a,b:mt):mt;
     var
          i,j,k:longint;
          c:mt;
     begin
          fillchar(c,sizeof(c),0);
          for i:=1 to 2 do
               for j:=1 to 2 do
                    for k:=1 to 2 do
                         c[i,j] := (c[i,j] + a[i,k] * b[k,j]) mod base;
          exit(c);
     end;
Function Giai(n:int64):mt;
     var
          tmp:mt;
     begin
          if (n=1) then exit(a);
          tmp:=Giai(n div 2);
          tmp:=Nhan(tmp,tmp);
          if n mod 2 =0 then exiT(tmp)
          else exit(Nhan(tmp,a));
     end;
procedure solve;
     var
          i:longint;
          n:int64;
          res:mt;
     begin
          for i:=1 to test do
               begin
                    Readln(n);
                    res:=Giai(n);
                    writeln(res[2,2]);
               end;
     close(input); close(output);
     end;
begin
     nhap;
     solve;
end.
