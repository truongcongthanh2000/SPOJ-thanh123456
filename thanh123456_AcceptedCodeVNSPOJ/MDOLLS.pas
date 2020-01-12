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
        fillchaR(w,sizeof(w),0);
        fillchar(h,sizeof(h),0);
        fillchar(b,sizeof(b),0);
        read(n);
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
        x:=h[m];
        y:=w[m];
        repeat
            while (h[i]<x) or ((h[i]=x) and (w[i]>y)) do inC(i);
            while (h[j]>x) or ((h[j]=x) and (w[j]<y)) do dec(j);
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
        l:=0;
        r:=max;
        mid:=(l+r) div 2;
        while (mid<>l) and (mid<>r) do
            begin
                //mid:=(l+r) div 2;
                //if (b[mid]<x) and (b[mid+1]>=x) then exit(mid)
                //else
                if b[mid]<=x then l:=mid
                else r:=mid;
                mid:=(l+r) div 2;
            end;
        //until l>r;
        for mid:=r downto l do
            if x>=b[mid] then exit(mid);
    end;
procedure solve;
    var
        i,vitri:longint;
    begin
        b[0]:=-maxlongint;
        b[1]:=w[n];
        max:=1;
        for i:=n-1 downto 1 do
            begin
                //b[max+1]:=maxlongint;
                vitri:=Chat(w[i]);
                if vitri=max then
                    begin
                        inc(max);
                        b[max]:=w[i];
                    end
                else
                    if b[vitri+1]>w[i] then b[vitri+1]:=w[i];
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

