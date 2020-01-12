uses math;
const
    fin='';fon='';
    maxn=trunc(1e5);
type
    mang=array [0..maxn] of longint;
var
    n,m,res,top:longint;
    mau,c,b,a,thutu:mang;
    free:Array [0..maxn] of boolean;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
        for i:=1 to n*m do
            readln(mau[i],c[i]);
        res:=0;
    end;
procedure init;
    var
        i:longint;
    begin
        for i:=1 to n*m do
            a[i]:=thutu[mau[i]]*100+c[i];
    end;
function Chat(x:longint):longint;
    var
        l,r,mid:longint;
    begin
        l:=1;
        r:=top;
        repeat
            mid:=(l+r) div 2;
            if (b[mid]<x) and (b[mid+1]>=x) then exit(mid)
            else
                begin
                    if b[mid]<x then l:=mid+1
                    else r:=mid-1;
                end;
        until l>r;
        exit(0);
    end;
procedure solve;
    var
        i,vitri:longint;
    begin
        top:=1;
        b[1]:=a[1];
        for i:=2 to n*m do
            begin
                b[top+1]:=maxlongint;
                vitri:=chat(a[i]);
                b[vitri+1]:=a[i];
                if vitri=top then inc(top);
            end;
        res:=max(res,top);
    end;
procedure vet(i:longint);
    var
        j:longint;
    begin
        for j:=1 to n do
            begin
                if free[j]=true then continue;
                thutu[i]:=j;
                free[j]:=true;
                if i=n then
                    begin
                        init;
                        solve;
                    end
                else vet(i+1);
                free[j]:=false;
            end;
    end;
procedure xuat;
    begin
        writeln(n*m-res);
    close(input); close(output);
    end;
begin
    nhap;
    vet(1);
    xuat;
end.