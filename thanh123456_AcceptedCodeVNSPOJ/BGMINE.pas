uses math;
const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of int64;
    mang3=array [0..maxn,0..16] of int64;
var
    n,log:longint;
    x,g,r,cs:mang1;
    luongvang,s,f,a:mang2;
    rmq:mang3;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do readln(x[i],g[i],r[i]);
        for i:=1 to n do
            s[i]:=s[i-1]+r[i];
        for i:=1 to n do
            luongvang[i]:=luongvang[i-1]+g[i];
        log:=trunc(log2(n));
        for i:=1 to n do a[i]:=s[i-1]-x[i];
        for i:=1 to n do cs[i]:=i;
    end;
procedure swap(var x,y:int64);
    var
        tam:int64;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint);
    var
        i,j,m,t:longint;
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
                    t:=cs[i]; cs[i]:=cs[j]; cs[j]:=t;
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure init;
    var
        i:longint;
    begin
        for i:=1 to n do rmq[i,0]:=cs[i];
    end;
function Mu(x,k:longint):longint;
    begin
        if k=0 then exit(1)
        else exit(x shl (k-1));
    end;
procedure RMQ_;
    var
        i,j:longint;
    begin
        init;
        for j:=1 to log do
            begin
                for i:=1 to n do
                    rmq[i,j]:=min(rmq[i,j-1],rmq[i+mu(2,j-1),j-1]);
            end;
    end;
function Get(l,r:longint):longint;
    var
        k:longint;
    begin
        k:=trunc(log2(r-l+1));
        exit(min(rmq[l,k],rmq[r-Mu(2,k)+1,k]));
    end;
function Chat(x:int64):longint;
    var
        l,r,mid,res:longint;
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
procedure thamlam;
    var
        i,j:longint;
        res:int64;
    begin
        res:=g[1];
        for i:=2 to n do
            begin
                for j:=1 to i-1 do
                    begin
                        if s[i]-s[j-1]>=x[i]-x[j] then
                            begin
                                res:=max(res,luongvang[i]-luongvang[j-1]);
                                break;
                            end;
                    end;
            end;
        writeln(res);
    end;
procedure solve;
    var
        i,vitri,tam:longint;
        res:int64;
    begin
        res:=0;
        a[n+1]:=high(int64);
        for i:=1 to n do
            begin
                vitri:=chat(s[i]-x[i]);
                tam:=Get(1,vitri);
                f[i]:=luongvang[i]-luongvang[tam-1];
                res:=max(res,f[i]);
            end;
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,n);
    RMQ_;
    solve;
end.

