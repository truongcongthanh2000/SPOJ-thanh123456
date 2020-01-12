const
    fin='';fon='';
    module=trunc(1e9)+7;
    maxn=7000;
var
    test:longint;
    f:array [-1..maxn+1,-1..maxn+1] of longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
    end;
procedure qhd;
    var
        i,j:longint;
    begin
        f[0,0]:=1;
        for i:=0 to maxn do
            for j:=0 to maxn do
                begin
                    f[i+1,j-1]:=(f[i+1,j-1]+f[i,j]) mod module;
                    f[i+1,j+1]:=(f[i+1,j+1]+f[i,j]) mod module;
                    f[i+1,j]:=(f[i+1,j]+f[i,j]) mod module;
                end;
    end;
procedure xuat;
    var
        i,n,k:longint;
    begin
        for i:=1 to test do
            begin
                readln(n,k);
                writeln(f[n,k]);
            end;
        close(input); close(output);
    end;
begin
    nhap;
    qhd;
    xuat;
end.
