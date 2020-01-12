const
    fin='';fon='';
    maxn=trunc(5e4);
    module=trunc(1e9);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn,0..51] of longint;
var
    n,k,top:longint;
    a,b,cs,c:mang1;
    it,f:mang2;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewritE(output);
        readln(n,k);
        for i:=1 to n do
            begin
                read(a[i]);
                cs[i]:=i;
            end;
    end;
procedure swap(var x,y:longint);
    var
        tam:longint;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsort(l,r:longint);
    var
        i,j,x,m:longint;
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
procedure Ma_hoa;
     var
        i:longint;
     begin
        for i:=1 to n do
            begin
                if a[i]=a[i-1] then b[i]:=b[i-1]
                else b[i]:=b[i-1]+1;
                c[cs[i]]:=b[i];
            end;
        top:=b[n];
     end;
procedure UpDate(i,l,r,u,v,trangthai,x:longint);
    var
        mid:longint;
    begin
        if (l>v) or (r<u) then exit;
        if (l>=u) and (r<=v) then
            begin
                it[i,trangthai]:=(it[i,trangthai]+x) mod module;
                exit;
            end;
        mid:=(l+r) div 2;
        UpDate(i*2,l,mid,u,v,trangthai,x);
        UpDate(i*2+1,mid+1,r,u,v,trangthai,x);
        it[i,trangthai]:=(it[i*2,trangthai]+it[i*2+1,trangthai]) mod module;
    end;
function Get(i,l,r,u,v,trangthai:longint):longint;
    var
        left,right,mid:longint;
    begin
        if (l>v) or (r<u) then exit(0)
            else
                if (l>=u) and (r<=v) then exit(it[i,trangthai])
                    else
                        begin
                            mid:=(l+r) div 2;
                            left:=Get(i*2,l,mid,u,v,trangthai);
                            right:=Get(i*2+1,mid+1,r,u,v,trangthai);
                            exit((left+right) mod module);
                        end;
    end;
procedure qhd_it;
    var
        i,j,res:longint;
    begin
        for i:=1 to n do
            f[i,1]:=1;
        for j:=2 to k do
            for i:=1 to n do
                begin
                    if i>1 then UpDate(1,0,top,c[i-1],c[i-1],j-1,f[i-1,j-1]);
                    f[i,j]:=Get(1,0,top,c[i]+1,top,j-1);
                end;
        res:=0;
        for i:=1 to n do
            res:=(res+f[i,k]) mod module;
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,n);
    Ma_hoa;
    qhd_it;
end.


