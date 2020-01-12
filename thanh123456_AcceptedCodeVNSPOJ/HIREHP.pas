uses math;
const
        fin='';fon='';
        maxn=trunc(5e5);
        maxm=trunc(1e12);
var
        it,t,p:array [0..maxn*4] of int64;
        pos:array [0..maxn] of longint;
        n:longint;
procedure nhap;
        var
                i:longint;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do readln(t[i],p[i]);
        for i:=1 to maxn*4 do it[i]:=maxm;
        end;
procedure build(i,l,r:longint);
        var
                mid:longint;
        begin
        if l=r then
                begin
                pos[l]:=i;
                exit;
                end;
        mid:=(l+r) div 2;
        build(i*2,l,mid);
        build(i*2+1,mid+1,r);
        end;
procedure update(j:longint;var x:int64);
        var
                i:longint;
        begin
        i:=pos[j];
        while i>0 do
                begin
                it[i]:=min(it[i],x);
                i:=i div 2;
                end;
        end;
function get(i,l,r,u,v:longint):int64;
        var
                left,right:int64;
                mid:longint;
        begin
        if (r<u) or (l>v) then exit(maxm)
                else
                if (l>=u) and (r<=v) then exit(it[i])
                        else
                                begin
                                mid:=(l+r) div 2;
                                left:=get(i*2,l,mid,u,v);
                                right:=get(i*2+1,mid+1,r,u,v);
                                exit(min(left,right));
                                end;
        end;
procedure xuli;
        var
                i:longint;
                res:int64;
        begin
        for i:=2 to n do
                begin
                res:=get(1,1,n,i-1,n)+p[i];
                update(t[i],res);
                end;
        writeln(it[pos[n]]);
        close(input); close(output);
        end;
begin
nhap;
build(1,1,n);
 update(t[1],p[1]);
xuli;
end.
