const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang=array [0..maxn] of longint;
var
    n,csmax:longint;
    a,b,c:mang;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do readln(a[i],b[i]);
    end;
procedure swap(var x,y:longint);
    var
        tam:longint;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint);
    var
        i,j,x,m,y:longint;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=a[m];
        y:=b[m];
        repeat
            while (a[i]<x) or ((a[i]=x) and (b[i]>y)) do inc(i);
            while (a[j]>x) or ((a[j]=x) and (b[j]<y)) do dec(j);
            if i<=j then
                begin
                    swap(a[i],a[j]);
                    swap(b[i],b[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
function Chat(x:longint):longint;
    var
        l,r,mid:longint;
    begin
        l:=1; r:=csmax;
        repeat
            mid:=(l+r) div 2;
            if (c[mid]<=x) and (c[mid+1]>x) then exit(mid)
            else
                begin
                    if c[mid]<=x then l:=mid+1
                    else r:=mid-1;
                end;
        until l>r;
        exit(0);
    end;
procedure solve;
    var
        i,vitri:longint;
    begin
        c[1]:=b[n];
        csmax:=1;
        for i:=n-1 downto 1 do
            begin
                c[csmax+1]:=maxlongint;
                vitri:=Chat(b[i]);
                c[vitri+1]:=b[i];
                if vitri=csmax then inc(csmax);
            end;
        writeln(csmax);
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,n);
    solve;
end.
