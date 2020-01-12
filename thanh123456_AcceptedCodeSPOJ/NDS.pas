const
    fin='';fon='';
var
    test,n,l,max:longint;
    b,a:array [0..trunc(1e7)] of longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewritE(output);
        readln(test);
    end;
procedure nhapdulieu;
    var
        i:longint;
    begin
        readln(n);
        for i:=1 to n do read(a[i]);
        readln(l);
    end;
function tknp(x:longint):longint;
    var
        l,r,mid:longint;
    begin
        l:=0; r:=max;
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
        max:=1;
        b[1]:=a[1];
        for i:=2 to n do
            begin
                b[max+1]:=maxlongint;
                vitri:=tknp(a[i]);
                b[vitri+1]:=a[i];
                if vitri=max then inc(max);
            end;
        if max<l then writeln(-1)
        else writeln(b[l]);
    end;
procedure xuat;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                nhapdulieu;
                solve;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    xuat;
end.
