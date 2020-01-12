const
    fin='';fon='';
    maxn=1000;
type
    mang=array [0..maxn+1,0..maxn+1] of int64;
    mang2=array [0..maxn+2] of int64;
var
    a,f:mang;
    n,m,q:longint;
    hang,cot:mang2;
function min(a,b:int64):int64;
    begin
        if a<b then exit(a)
        else exit(b);
    end;
procedure nhap;
    var
        i,j:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m,q);
        for i:=1 to n do
            for j:=1 to m do read(a[i,j]);
    end;
procedure qhd;
    var
        i,j:longint;
    begin
        for i:=1 to n do
            for j:=1 to m do
                f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+a[i,j];
        for i:=1 to n do
            hang[i]:=f[i,m]-f[i-1,m];
        for i:=1 to m do
            cot[i]:=f[n,i]-f[n,i-1];
    end;
function Tinh(x,y,u,v:longint):int64;
    begin
        exit(f[u,v]-f[u,y-1]-f[x-1,v]+f[x-1,y-1]);
    end;
function ChatNgang(x,y,u,v:longint):int64;
    var
        l,r,mid:longint;
        s1,s2,s,kq:int64;
    begin
        kq:=tinh(x,y,u,v);
        s:=kq;
        l:=x; r:=u;
        repeat
            mid:=(l+r) div 2;
            s1:=tinh(x,y,mid,v);
            s2:=s-s1;
            kq:=min(kq,abs(s1-s2));
            if s1<s2 then l:=mid+1
            else r:=mid-1;
        until l>r;
        exit(kq);
    end;
function ChatDoc(x,y,u,v:longint):int64;
    var
        l,r,mid:longint;
        s1,s2,s,kq:int64;
    begin
        kq:=tinh(x,y,u,v);
        s:=kq;
        l:=y; r:=v;
        repeat
            mid:=(l+r) div 2;
            s1:=tinh(x,y,u,mid);
            s2:=s-s1;
            kq:=min(kq,abs(s1-s2));
            if s1<s2 then l:=mid+1
            else r:=mid-1;
        until l>r;
        exit(kq);
    end;
procedure Test(x,y,u,v:longint);
    var
        kq1,kq2:int64;
    begin
        kq1:=ChatNgang(x,y,u,v);
        kq2:=ChatDoc(x,y,u,v);
        writeln(min(kq1,kq2));
    end;
procedure solve;
    var
        i,x,y,u,v:longint;
    begin
        for i:=1 to q do
            begin
                readln(x,y,u,v);
                Test(x,y,u,v);
            end;
        close(input); close(output);
    end;
begin
    nhap;
    qhd;
    solve;
end.

