///Tim day tang dan
///Khong Phai day tang nghiem ngat
const
    fin='';fon='';
    maxn=trunc(1e5);
type
    mang=array [0..maxn] of longint;
var
    test,n,max:longint;
    w,h,b:mang;
procedure nhap;
    begin
        assign(input,fin);reseT(input);
        assigN(output,fon);rewrite(output);
        readln(test);
    end;
procedure nhapdulieu;
    var
        i:longint;
    begin
        readln(n);
        for i:=1 to n do read(w[i],h[i]);
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
        x:=w[m];
        y:=h[m];
        repeat
            while (w[i]<x) or ((w[i]=x) and (h[i]<y)) do inC(i);
            while (w[j]>x) or ((w[j]=x) and (h[j]>y)) do dec(j);
            if i<=j then
                begin
                    swap(h[i],h[j]);
                    swap(w[i],w[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsorT(i,r);
    end;
function Chat(x:longint):longint;
    var
        l,r,mid:longint;
    begin
        l:=1;
        r:=max;
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
procedure solve;
    var
        i,vitri:longint;
    begin
        b[1]:=h[1];
        max:=1;
        for i:=2 to n do
            begin
                b[max+1]:=0;
                vitri:=Chat(h[i]);
                b[vitri+1]:=h[i];
                if vitri=max then inc(max);
            end;
        writeln(max);
    end;
procedure xuat;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                nhapdulieu;
                qsort(1,n);
                solve;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    xuat;
end.



