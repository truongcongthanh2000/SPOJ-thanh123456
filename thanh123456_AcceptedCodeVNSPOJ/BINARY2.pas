const
    fin='';fon='';
    module=trunc(1e9);
    maxn=trunc(1e6);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn,0..1] of longint;
var
    n,k:longint;
    mu:mang1;
    f:mang2;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n,k);
    end;
procedure init;
    var
        i:longint;
    begin
        mu[0]:=1;
        for i:=1 to k do
            mu[i]:=(mu[i-1]*2) mod module;
        f[0,0]:=1;
        f[0,1]:=1;
        for i:=1 to k do
            begin
                f[i,0]:=mu[i-1];
                f[i,1]:=mu[i-1];
            end;
    end;
procedure qhd;
    var
        i:longint;
    begin
        for i:=k+1 to n do
            begin
                f[i,0]:=f[i-1,1]+f[i-1,0];
                f[i,0]:=((f[i,0]-f[i-k-1,0])+module) mod module;
                f[i,1]:=f[i-1,0]+f[i-1,1];
                f[i,1]:=((f[i,1]-f[i-k-1,1])+module) mod module;
            end;
        writeln((f[n,1]+f[n,0]) mod module);
    closE(input); close(output);
    end;
begin
    nhap;
    init;
    qhd;
end.


