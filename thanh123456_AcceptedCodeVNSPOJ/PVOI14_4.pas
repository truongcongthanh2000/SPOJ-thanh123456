uses math;
const
    fin='';fon='';
    maxn=trunc(5e5);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn,1..4] of longint;
var
    n,top:longint;
    cs,a,b,pos:mang1;
    it:mang2;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
        for i:=1 to n do cs[i]:=i;
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
                    swap(Cs[i],cs[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure Ma_Hoa;
    var
        i:longint;
    begin
        top:=0;
        for i:=1 to n do
            begin
                if a[i]<>a[i-1] then inc(top);
                b[cs[i]]:=top;
            end;
    end;
procedure build(i,l,r:longint);
    var
        mid:longint;
    begin
        if l=r then
            begin
                it[i,1]:=0;
                it[i,2]:=0;
                it[i,3]:=0;
                it[i,4]:=0;
                pos[l]:=i;
                exit;
            end;
        mid:=(l+r) div 2;
        build(i*2,l,mid);
        build(i*2+1,mid+1,r);
    end;
procedure UpDate(dinh,trangthai,d:longint);
    var
        i:longint;
    begin
        i:=pos[dinh];
        while i>0 do
            begin
                if it[i,trangthai]<d then it[i,trangthai]:=d;
                i:=i div 2;
            end;
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
                            left:=get(i*2,l,mid,u,v,trangthai);
                            right:=get(i*2+1,mid+1,r,u,v,trangthai);
                            exit(max(left,right));
                        end;
    end;
procedure solve;
    var
        i,res,d1,d2,d:longint;
    begin
        res:=0;
        for i:=1 to n do
            begin
                d:=Get(1,1,top,1,b[i]-1,1);
                UpDate(b[i],1,d+1);
                d1:=Get(1,1,top,b[i]+1,top,2);
                d2:=Get(1,1,top,b[i]+1,top,1);
                d:=max(d1,d2);
                if d>=2 then UpDate(b[i],2,d+1);
                d1:=Get(1,1,top,1,b[i]-1,2);
                d2:=Get(1,1,top,1,b[i]-1,3);
                d:=max(d1,d2);
                if d>=3 then UpDate(b[i],3,d+1);
                d1:=Get(1,1,top,b[i]+1,top,3);
                d2:=Get(1,1,top,b[i]+1,top,4);
                d:=max(d1,d2);
                if d>=4 then
                    begin
                        UpDate(b[i],4,d+1);
                        res:=max(d+1,res);
                    end;
            end;
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    qsort(1,n);
    ma_hoa;
    build(1,1,top);
    solve;
end.
