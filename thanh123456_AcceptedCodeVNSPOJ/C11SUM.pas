const
    fin='';fon='';
    module=trunc(1e9)+7;
    maxn=trunc(1e6)+1;
type
    mang=array [0..maxn] of int64;
var
    s:ansistring;
    n:longint;
    f:mang;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(s);
        n:=length(s);
        f[0]:=0;
        for i:=1 to n do f[i]:=((f[i-1]*10)+1) mod module;
    end;
procedure solve;
    var
        i,x:longint;
        s1,s2,reS:int64;
        code:integer;
    begin
        res:=0;
        for i:=1 to n do
            begin
                val(s[i],x,code);
                s1:=f[n-i+1]*int64(x);
                s2:=i;
                res:=(res+(s1*s2)) mod module;
            end;
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    solve;
end.
