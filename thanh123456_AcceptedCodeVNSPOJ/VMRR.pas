const
     fin='';fon='';
var
     s:ansistring;
     x,y:char;
     n:longint;
     f:array [0..trunc(1e6)+1] of int64;
procedure nhap;
     var
          i:longint;
     begin
          assigN(input,fin);reset(input);
          assign(output,fon);rewritE(output);
          readln(s);
          readln(x,y);
          n:=length(s);
     end;
procedure qhd;
     var
          i:longint;
          res:int64;
     begin
          res:=0;
          for i:=1 to n do
               begin
                    if s[i]=y then
                         res:=res+f[i-1];
                    if s[i]=x then
                         f[i]:=f[i-1]+1
                    else f[i]:=f[i-1];
               end;
          writeln(res);
     close(input); close(output);
     end;
begin
     nhap;
     qhd;
end.

