const
    fin='';fon='';
    maxn=trunc(2e4);
type
    mang=array [0..maxn*100] of longint;
var
    f,a,s,d:mang;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
    end;
procedure sang;
    var
        i,j,top:longint;
    begin
        for i:=1 to maxn do f[i]:=i;
        top:=0;
        for i:=2 to maxn do
            begin
                if f[i]=i then
                    begin
                        for j:=1 to maxn div i do f[i*j]:=i;
                        inc(top);
                        a[top]:=i;
                    end;
            end;
        s[0]:=0;
        for i:=1 to top do s[i]:=s[i-1]+a[i];
        for i:=1 to top do
            for j:=i to top do
                begin
                    if s[j]-s[i-1]>maxn then break;
                    inc(d[s[j]-s[i-1]]);
                end;
    end;
procedure solve;
    var
        n:longint;
    begin
        while not(eof(input)) do
            begin
                readln(n);
                if n=0 then break;
                writeln(d[n]);
            end;
        close(input); close(output);
    end;
begin
    nhap;
    sang;
    solve;
end.

