const
    fin='';fon='';
    maxn=trunc(4e5);
    module=trunc(1e9)+7;
type diem=record
    len,sl:longint;
end;
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of diem;
var
    n,top:longint;
    a,cs,pos,b:mang1;
    it,stack:mang2;
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
        x:=cs[m];
        repeat
            while a[cs[i]]<a[x] do inc(i);
            while a[cs[j]]>a[x] do dec(j);
            if i<=j then
                begin
                    swap(cs[i],cs[j]);
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
        top:=1;
        b[cs[1]]:=1;
        for i:=2 to n do
            if a[cs[i]]<>a[cs[i-1]] then
                begin
                    inc(top);
                    b[cs[i]]:=top;
                end
            else
                b[cs[i]]:=top;
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
procedure UpDate(vitri:longint;var x:diem);
    var
        i:longint;
    begin
        i:=pos[vitri];
        while i>0 do
            begin
                if it[i].len<x.len then it[i]:=x
                else
                if it[i].len=x.len then it[i].sl:=(it[i].sl+x.sl) mod module;
                i:=i div 2;
            end;
    end;
function Find(i,l,r,u,v:longint):diem;
    var
        left,right,tam:diem;
        mid:longint;
    begin
        if (l>v) or (r<u) then exit(it[0])
            else
                if (l>=u) and (r<=v) then exit(it[i])
                    else
                        begin
                            mid:=(l+r) div 2;
                            left:=Find(i*2,l,mid,u,v);
                            right:=Find(i*2+1,mid+1,r,u,v);
                            if left.len<right.len then exit(right)
                            else
                            if left.len>right.len then exit(left)
                            else
                                begin
                                    tam.len:=left.len;
                                    tam.sl:=(left.sl+right.sl) mod module;
                                    exit(tam);
                                end;
                        end;
    end;
procedure solve;
    var
        i,m,max_len:longint;
        res:int64;
        tam:diem;
    begin
        m:=0;
        max_len:=0;
        for i:=1 to n do
            begin
                tam:=Find(1,1,top,1,b[i]-1);
                tam.len:=tam.len+1;
                if tam.sl=0 then tam.sl:=1;
                UpDate(b[i],tam);
                inc(m);
                stack[m]:=tam;
                if max_len<tam.len then max_len:=tam.len;
            end;
        res:=0;
        for i:=1 to m do
            begin
                if stack[i].len=max_len then
                    res:=(res+stack[i].sl) mod module;
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
