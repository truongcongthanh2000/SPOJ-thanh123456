const
    fin='';fon='';
    maxn=trunc(1e3);
type
    mang=array [0..maxn,0..maxn] of longint;
var
    n:longint;
    a,kt,f1,f2,a1,a2:mang;
procedure nhap;
    var
        i,j:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do
            for j:=1 to n do read(a[i,j]);
    end;
procedure init;
    var
        i,j:longint;
    begin
        kt[0,1]:=1;
        for i:=1 to n do
            begin
                for j:=1 to n do
                    begin
                        if j=1 then kt[i,j]:=(kt[i-1,j]+1) mod 2
                        else kt[i,j]:=(kt[i,j-1]+1) mod 2;
                    end;
            end;
        for i:=1 to n do
            begin
                for j:=1 to n do
                    begin
                        if kt[i,j]=0 then a1[i,j]:=a[i,j]
                        else a2[i,j]:=a[i,j];
                    end;
            end;
    end;
procedure qhd;
    var
        i,j:longint;
    begin
        for i:=1 to n do
            for j:=1 to n do
                begin
                    f1[i,j]:=f1[i-1,j]+f1[i,j-1]-f1[i-1,j-1]+a1[i,j];
                    f2[i,j]:=f2[i-1,j]+f2[i,j-1]-f2[i-1,j-1]+a2[i,j];
                end;
    end;
function Get(i,j,x,y:longint;var f:mang):longint;
    begin
        exit(f[x,y]-f[i-1,y]-f[x,j-1]+f[i-1,j-1]);
    end;
procedure solve;
    var
        i,q,u,v,x,y,s1,s2:longint;
    begin
        readln(q);
        for i:=1 to q do
            begin
                readln(u,v,x,y);
                s1:=Get(u,v,x,y,f1);
                s2:=Get(u,v,x,y,f2);
                writeln(abs(s1-s2));
            end;
        close(input); close(output);
    end;
begin
    nhap;
    init;
    qhd;
    solve;
end.
