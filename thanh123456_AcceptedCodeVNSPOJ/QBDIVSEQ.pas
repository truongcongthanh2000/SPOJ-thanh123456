const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang=array [0..maxn] of longint;
var
    n,max:longint;
    a,b:mang;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do
            readln(a[i]);
    end;
Function Chat(x:longint):longint;
    var
        l,r,mid:longint;
    begin
        l:=0;
        r:=max;
        repeat
            mid:=(l+r) div 2;
            if (b[mid]<x) and (b[mid+1]>=x) then exit(mid)
            else
                begin
                    if b[mid]<x then l:=mid+1
                    else r:=mid-1;
                end;
        until l>r;
        exit(0);
    end;
procedure solve;
    var
        i,vitri:longint;
    begin
        b[0]:=-1;
        max:=1;
        b[1]:=a[n];
        for i:=n-1 downto 1 do
            begin
                b[max+1]:=maxlongint;
                vitri:=Chat(a[i]);
                b[vitri+1]:=a[i];
                if vitri=max then inc(max);
            end;
        writeln(max);
        close(input); close(output);
    end;
begin
    nhap;
    solve;
end.