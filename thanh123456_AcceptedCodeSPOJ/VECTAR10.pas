const
    fin='';fon='';
var
    f:array [0..trunc(1e6)] of longint;
procedure nhap;
    begin
        assigN(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
    end;
procedure taomang;
    var
        i:longint;
    begin
        f[1]:=1; f[2]:=2;
        for i:=3 to trunc(1e6) do
            begin
                if f[i-1]=i-1 then f[i]:=2
                else f[i]:=f[i-1]+2;
            end;
    end;
procedure xuat;
    var
        n:longint;
    begin
        while not(eof(input)) do
            begin
                readln(n);
                if n<>0 then writeln(f[n]);
            end;
        close(input); close(output);
    end;
begin
    nhap;
    taomang;
    xuat;
end.
