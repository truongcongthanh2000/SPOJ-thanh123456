const
    fin='';fon='';
    module=trunc(1e9)+7;
    maxn=trunc(1e4);
type mang=array [0..maxn] of int64;
var
    a:mang;
    k,top:longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(k);
    end;
function getHash(s:string):int64;
    var
        i:longint;
        kq:int64;
    begin
        kq:=0;
        for i:=1 to length(s) do
            kq:=(kq*256+ord(s[i])) mod module;
        exit(kq);
    end;
procedure push;
    var
        i,j,n:longint;
        s:string;
    begin
        top:=0;
        for i:=1 to k do
            begin
                readln(n);
                for j:=1 to n do
                    begin
                        readln(s);
                        inc(top);
                        a[top]:=getHash(s);
                    end;
            end;
    end;
procedure sort;
    var
        i,j:longint;
        tam:int64;
    begin
        for i:=1 to top-1 do
            for j:=i+1 to top do
                if a[i]>a[j] then
                    begin
                        tam:=a[i]; a[i]:=a[j]; a[j]:=tam;
                    end;
    end;
procedure solve;
    var
        i,res:longint;
    begin
        res:=0;
        for i:=1 to top do
            begin
                if a[i]<>a[i-1] then
                    inc(res);
            end;
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    push;
    sort;
    solve;
end.
