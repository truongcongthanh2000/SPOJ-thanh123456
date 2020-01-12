uses math;
const
    fin='';fon='';
    maxn=trunc(1e6);
type mang=array [0..maxn] of longint;
var
    n,csmax:longint;
    a,b,f1,f2:mang;
procedure nhap;
    var
        i,j:longint;
    begin
        assign(input,fin);reseT(input);
        assigN(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
        j:=0;
        for i:=n downto 1 do
            begin
                inc(j);
                a[n+j]:=a[i];
            end;
    end;
function tknp(x:longint):longint;
    var
        l,r,mid:longint;
    begin
        l:=1;
        r:=csmax;
        if r=0 then exit(0);
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
function tknp1(x:longint):longint;
    var
        l,r,mid:longint;
    begin
        l:=1;
        r:=csmax;
        if r=0 then exit(0);
        repeat
            mid:=(l+r) div 2;
            if (b[mid]>x) and (b[mid+1]<=x) then exit(mid)
            else
                begin
                    if b[mid]>x then l:=mid+1
                    else r:=mid-1;
                end;
        until l>r;
        exit(0);
    end;
procedure LIS_1;
    var
        i,vitri:longint;
    begin
        csmax:=1;
        for i:=n downto 1 do
            begin
                b[csmax+1]:=-maxlongint;
                vitri:=tknp1(a[i]);
                f1[i]:=vitri+1;
                b[vitri+1]:=a[i];
                if vitri=csmax then inc(csmax);
            end;
    end;
procedure LIS_2;
    var
        i,vitri:longint;
    begin
        csmax:=0;
        for i:=n downto 1 do
            begin
                b[csmax+1]:=maxlongint;
                vitri:=tknp(a[i]);
                f2[i]:=vitri+1;
                b[vitri+1]:=a[i];
                if vitri=csmax then inc(csmax);
            end;
    end;

procedure solve;
    var
        i,res:longint;
    begin
        res:=0;
        for i:=1 to n do
            res:=max(f1[i]+f2[i]-1,res);
        writeln(reS);
    close(input); close(output);
    end;
begin
    nhap;
    LIS_1;
    LIS_2;
    solve;
end.
