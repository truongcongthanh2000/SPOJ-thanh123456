const
    fin='';fon='';
    maxn=trunc(1e5);
type
    mang=array [0..maxn] of int64;
var
    n:longint;
    pos,a,s,cs:mang;
    q:int64;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n,q);
        for i:=1 to n do readln(a[i]);
        for i:=1 to n do s[i]:=s[i-1]+a[i];
        for i:=1 to n do a[i]:=q+s[i-1];
        for i:=1 to n do cs[i]:=i;
    end;
function min(a,b:int64):int64;
    begin
        if a<b then exit(a)
        else exit(b);
    end;
function max(a,b:int64):int64;
    begin
        if a>b then exit(a)
        else exit(b);
    end;
procedure swap(var x,y:int64);
    var
        tam:int64;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint);
    var
        i,j,m:longint;
        x:int64;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=a[m];
        repeat
            while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then
                begin
                    swap(a[i],a[j]);
                    swap(cs[i],cs[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure taomang;
    var
        i:longint;
    begin
        pos[0]:=maxlongint;
        for i:=1 to n do
            pos[i]:=min(pos[i-1],cs[i]);
    end;
function Chat(x:int64):longint;
    var
        l,r,mid:longint;
    begin
        l:=1;
        r:=n;
        repeat
            mid:=(l+r) div 2;
            if (a[mid]<=x) and (a[mid+1]>x) then exit(mid)
            else
                begin
                    if a[mid]<=x then l:=mid+1
                    else r:=mid-1;
                end;
        until l>r;
        exit(0);
    end;
procedure solve;
    var
        i,vitri:longint;
        res:int64;
    begin
        res:=-1;
        for i:=1 to n do
            begin
                vitri:=chat(s[i]);
                if vitri=0 then continue;
                res:=max(res,int64(i)-pos[vitri]+1);
            end;
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,n);
    taomang;
    solve;
end.


