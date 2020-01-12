const
    fin='';fon='';
    maxn=trunc(1e5);
type
    mang=array [0..maxn*4] of longint;
var
    it,f:mang;
    n,m:longint;
procedure nhap;
    begin
        assigN(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
    end;
procedure capnhat(i,l,r:longint);
    begin
        //f[i]:=r-l+1;
        f[i]:=(r-l+1)-f[i];
        if (l<>r) then
            begin
                it[i*2]:=(it[i*2]+1) mod 2;
                it[i*2+1]:=(it[i*2+1]+1) mod 2;
            end;
        it[i]:=0;
    end;
procedure UpDate(i,l,r,u,v:longint);
    var
        mid:longint;
    begin
        if (it[i]=1) then capnhat(i,l,r);
        if (l>v) or (r<u) then exit;
        if (l>=u) and (r<=v) then
            begin
                it[i]:=(it[i]+1) mod 2;
                //f[i]:=it[i]*(r-l+1);
                f[i]:=(r-l+1)-f[i];
                it[i]:=0;
                if l<>r then
                    begin
                        it[i*2]:=(it[i*2]+1) mod 2;
                        it[i*2+1]:=(it[i*2+1]+1) mod 2;
                    end;
                exit;
            end;
        mid:=(l+r) div 2;
        UpDate(i*2,l,mid,u,v);
        UpDate(i*2+1,mid+1,r,u,v);
        f[i]:=f[i*2]+f[i*2+1];
    end;
function Get(i,l,r,u,v:longint):longint;
    var
        mid,left,right:longint;
    begin
        if (it[i]=1) then capnhat(i,l,r);
        if (l>v) or (r<u) then exit(0)
            else
                if (l>=u) and (r<=v) then exit(f[i])
                    else
                        begin
                            mid:=(l+r) div 2;
                            left:=Get(i*2,l,mid,u,v);
                            right:=Get(i*2+1,mid+1,r,u,v);
                            exit(left+right);
                        end;
    end;
procedure solve;
    var
        i,u,v,c:longint;
    begin
        for i:=1 to m do
            begin
                readln(c,u,v);
                if c=0 then UpDate(1,1,n,u,v)
                else writeln(Get(1,1,n,u,v));
            end;
        close(input); close(output);
    end;
begin
    nhap;
    solve;
end.

