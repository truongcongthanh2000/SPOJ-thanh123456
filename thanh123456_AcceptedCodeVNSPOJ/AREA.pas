//uses math;
const
    fin='';fon='';
    maxn=trunc(1e4);
    maxm=trunc(3e4);
type diem=record
    x,y1,y2:longint;
    kt:boolean;
end;
var
    high,top,n:longint;
    a:array [0..maxm*4] of diem;
    Number_HCN,DoPhu:array [0..maxm*10] of longint;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        high:=0;
    end;
function max(a,b:longint):longint;
    begin
        if a>b then exit(a)
        else exit(b);
    end;
procedure push(c1,b,c:longint);
    begin
        inc(top);
        a[top].x:=c1;
        a[top].y1:=b;
        a[top].y2:=c;
        //low:=min(low,b);
        high:=max(high,c);
    end;
procedure taomang;
    var
        i,x1,x2,y1,y2:longint;
    begin
        for i:=1 to n do
            begin
                readln(x1,y1,x2,y2);
                push(x1,y1,y2);
                a[top].kt:=True;
                push(x2,y1,y2);
                a[top].kt:=False;
            end;
    end;
procedure swap(var x,y:diem);
    var
        t:diem;
    begin
        t:=x; x:=y; y:=t;
    end;
procedure qsort(l,r:longint);
    var
        i,j,m,x1,y:longint;
    begin
        i:=l; j:=r;
        m:=random(r-l)+l+1;
        x1:=a[m].x;
        y:=a[m].y2;
        repeat
            while (a[i].x<x1) or ((a[i].x=x1) and (a[i].y2<y)) do inc(i);
            while (a[j].x>x1) or ((a[j].x=x1) and (a[j].y2>y)) do dec(j);
            if i<=j then
                begin
                    swap(a[i],a[j]);
                    inc(i); dec(j);
                end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
    end;
procedure Open_True(i,l,r,u,v:longint);
    var
        mid:longint;
    begin
        if (r<=u) or (l>=v) then
            begin
                //dophu[i]:=0;
                exit;
            end;
        if (r<=v) and (l>=u) then
            begin
                inc(Number_HCN[i]);
                DoPhu[i]:=r-l;
                exit;
            end;
        if l+1>=r then
            begin
                //dophu[i]:=r-l;
                exit;
            end;
        mid:=(l+r) div 2;
        Open_True(i*2,l,mid,u,v);
        Open_True(i*2+1,mid,r,u,v);
        if Number_HCN[i]=0 then DoPhu[i]:=DoPhu[i*2]+DoPhu[i*2+1];
    end;
procedure Open_False(i,l,r,u,v:longint);
    var
        mid:longint;
    begin
        if (r<=u) or (l>=v) then exit;
        if (r<=v) and (l>=u) then
            begin
                dec(Number_HCN[i]);
                if Number_HCN[i]=0 then DoPhu[i]:=DoPhu[i*2]+DoPhu[i*2+1];
                exit;
            end;
        if l+1>=r then
            begin
                DoPhu[i]:=0;
                exit;
            end;
        mid:=(l+r) div 2;
        Open_False(i*2,l,mid,u,v);
        Open_False(i*2+1,mid,r,u,v);
        if Number_HCN[i]=0 then DoPhu[i]:=DoPhu[i*2]+DoPhu[i*2+1];
    end;
procedure solve;
    var
        i:longint;
        s:int64;
    begin
        S:=0;
        Open_True(1,0,high,a[1].y1,a[1].y2);
        for i:=2 to 2*n do
            begin
                s:=s+(a[i].x-a[i-1].x)*DoPhu[1];
                if a[i].kt=true then Open_True(1,0,high,a[i].y1,a[i].y2)
                else Open_False(1,0,high,a[i].y1,a[i].y2);
            end;
        writeln(s);
    close(input); close(output);
    end;
begin
    nhap;
    taomang;
    qsort(1,2*n);
    solve;
end.