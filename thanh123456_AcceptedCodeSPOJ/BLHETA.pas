const
    fin='';fon='';
    module=trunc(1e9)+7;
    maxn=trunc(1e5);
type diem=record
    gt:int64;
    len:longint;
end;
var
    pow,hash:array [0..maxn] of int64;
    a:array [0..maxn] of diem;
    res:array [0..maxn] of char;
    s:ansistring;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(s);
        pow[0]:=1;
        for i:=1 to maxn do pow[i]:=pow[i-1]*26 mod module;
    end;
function getHash(i,j:longint):int64;
    begin
        exit((hash[j]-(hash[i-1]*pow[j-i+1]) mod module+module) mod module);
    end;
Function Hash1(s:string):int64;
    var
        i:longint;
        kq:int64;
    begin
        kq:=0;
        for i:=1 to length(s) do
            kq:=(kq*26+(ord(s[i])-64)) mod module;
        exit(kq);
    end;
procedure solve;
    var
        i,n,top,j:longint;
        s1:string;
    begin
        readln(n);
        for i:=1 to n do
            begin
                readln(s1);
                a[i].gt:=Hash1(s1);
                a[i].len:=length(s1);
            end;
        top:=0;
        for i:=1 to length(s) do
            begin
                inc(top);
                res[top]:=s[i];
                hash[top]:=(hash[top-1]*26+(ord(s[i])-64)) mod module;
                for j:=1 to n do
                    begin
                        if a[j].gt=getHash(top-a[j].len+1,top) then
                            begin
                                top:=top-a[j].len;
                                break;
                            end;
                    end;
            end;
        for i:=1 to top do write(res[i]);
        close(input); close(output);
    end;
begin
    nhap;
    solve;
end.
