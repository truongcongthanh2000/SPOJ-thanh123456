const
    fin='';fon='';
    maxn=trunc(1e7);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of longint;
var
    w,v,c,d,x:mang1;
    a1,b1,a2,b2,tam1,tam2,res1,res2:mang2;
    s1,s2,res:longint;
    len,n,m,mid,top1,top2,top:longint;
function max(a,b:longint):longint;
    begin
        if a>b then exit(a)
        else exit(b);
    end;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
        for i:=1 to n do readln(w[i],v[i]);
        mid:=n div 2;
        res:=0;
    end;
procedure push(x,y:longint);
    begin
        inc(len);
        tam1[len]:=x;
        tam2[len]:=y;
    end;
procedure vet(i:longint);
    var
        j:longint;
    begin
        for j:=0 to 1 do
            begin
                x[i]:=j;
                if j=1 then
                    begin
                        s1:=s1+c[i];
                        s2:=s2+d[i];
                    end;
                if (i=top) and (s1<=m) and (s1>0) then push(s1,s2)
                else
                if i<top then vet(i+1);
                if j=1 then
                    begin
                        s1:=s1-c[i];
                        s2:=s2-d[i];
                    end;
            end;
    end;
procedure init(l,r:longint);
    var
        i:longint;
    begin
        top:=0;
        len:=0;
        for i:=l to r do
            begin
                inc(top);
                c[top]:=w[i];
                d[top]:=v[i];
            end;
    end;
procedure Sinh_1;
    var
        i:longint;
    begin
        s1:=0; s2:=0;
        init(1,mid);
        vet(1);
        top1:=len;
        for i:=1 to top1 do
            begin
                a1[i]:=tam1[i];
                b1[i]:=tam2[i];
            end;
    end;
procedure Sinh_2;
    var
        i:longint;
    begin
        fillchar(tam1,sizeof(tam1),0);
        fillchar(tam2,sizeof(tam2),0);
        s1:=0; s2:=0;
        init(mid+1,n);
        for i:=1 to top do x[i]:=0;
        vet(1);
        top2:=len;
        for i:=1 to top2 do
            begin
                a2[i]:=tam1[i];
                b2[i]:=tam2[i];
            end;
    end;
procedure swap(var x,y:longint);
    var
        tam:longint;
    begin
        tam:=x; x:=y; y:=tam;
    end;
procedure qsorT(l,r:longint;var a,b:mang2);
    var
        i,j,m:longint;
        x,y:longint;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x:=a[m];
        y:=b[m];
        repeat
            while (a[i]<x) or ((a[i]=x) and (b[i]<y)) do inC(i);
            while (a[j]>x) or ((a[j]=x) and (b[j]>y)) do dec(j);
            if i<=j then
                begin
                    swap(a[i],a[j]);
                    swap(b[i],b[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j,a,b);
        if i<r then qsort(i,r,a,b);
    end;
procedure taomang;
    var
        i:longint;
    begin
        res1[1]:=b1[1];
        for i:=2 to top1 do
            res1[i]:=max(res1[i-1],b1[i]);
        res2[1]:=b2[1];
        for i:=2 to top2 do
            res2[i]:=max(res2[i-1],b2[i]);
    end;
function Chat(x:longint;var top:longint;var a:mang2):longint;
    var
        l,r,mid:longint;
    begin
        if top=0 then exit(0);
        l:=1;
        r:=top;
        a[top+1]:=maxlongint;
        repeat
            mid:=(L+r) div 2;
            if (a[mid]<=x) and (a[mid+1]>x) then exit(mid)
            else
                begin
                    if a[mid]<=x then l:=mid+1
                    else r:=mid-1;
                end;
        until l>r;
        exit(0);
    end;
procedure xuli_1;
    var
        i,vitri:longint;
    begin
        for i:=1 to top1 do
            begin
                vitri:=Chat(m-a1[i],top2,a2);
                res:=max(res2[vitri]+b1[i],res);
            end;
    end;
procedure xuli_2;
    var
        i,vitri:longint;
    begin
        for i:=1 to top2 do
            begin
                vitri:=Chat(m-a2[i],top1,a1);
                res:=max(res1[vitri]+b2[i],res);
            end;
    end;
procedure solve;
    begin
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    Sinh_1;
    Sinh_2;
    qsort(1,top1,a1,b1);
    qsort(1,top2,a2,b2);
    taomang;
    xuli_1;
    xuli_2;
    solve;
end.

