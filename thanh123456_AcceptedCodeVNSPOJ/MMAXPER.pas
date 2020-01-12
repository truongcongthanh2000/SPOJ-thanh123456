uses math;
const
     fin='';fon='';
     maxn=trunc(1e6)+1;
type
     mang=array [0..maxn] of longint;
var
     n:longint;
     a,b:mang;
     f:array [0..maxn,1..2] of longint;
procedure swap(var x,y:longint);
     var
          tam:longint;
     begin
          tam:=x; x:=y; y:=tam;
     end;
procedure nhap;
     var
          i:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n);
          for i:=1 to n do
               begin
                    readln(a[i],b[i]);
                    if a[i]>b[i] then swap(a[i],b[i]);
               end;
     end;
procedure solve;
     var
          i:longint;
     begin
          f[1,1]:=a[1];
          f[1,2]:=b[1];
          for i:=2 to n do
               begin
                    f[i,1]:=max(f[i-1,1]+abs(b[i]-b[i-1]),f[i-1,2]+abs(b[i]-a[i-1]))+a[i];
                    f[i,2]:=max(f[i-1,2]+abs(a[i]-a[i-1]),f[i-1,1]+abs(a[i]-b[i-1]))+b[i];
               end;
          writeln(max(f[n,1],f[n,2]));
     close(input); close(output);
     end;
begin
     nhap;
     solve;
end.
