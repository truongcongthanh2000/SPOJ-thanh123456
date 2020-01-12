const
    fin='';fon='';
    maxn=60000;
type
    mang=array [0..maxn*100] of longint;
var
    n,m:longint;
    a,it,pos:mang;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        m:=0;
        for i:=1 to n do
            begin
                readln(a[i]);
                if a[i]>m then m:=a[i];
            end;
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
procedure UpDate(x:longint);
    var
        i:longint;
    begin
        i:=pos[x];
        while i>0 do
            begin
                inc(it[i]);
                i:=i div 2;
            end;
    end;
function get(i,l,r,u,v:longint):longint;
    var
        mid,left,right:longint;
    begin
        if (r<u) or (l>v) then exit(0)
            else
                if (l>=u) and (r<=v) then exit(it[i])
                    else
                        begin
                            mid:=(l+r) div 2;
                            left:=get(i*2,l,mid,u,v);
                            right:=get(i*2+1,mid+1,r,u,v);
                            exit(left+right);
                        end;
    end;
procedure solve;
    var
        i,res:longint;
    begin
        res:=0;
        for i:=n downto 1 do
            begin
                res:=res+get(1,1,m,1,a[i]-1);
                UpDate(a[i]);
            end;
        writeln(res);
        close(input); close(output);
    end;
begin
    nhap;
    build(1,1,m);
    solve;
end.
