const
    fin='';fon='';
    maxn=trunc(1e6);
type diem=record
    gt,vt:longint;
end;
type
    mang1=array [0..maxn*10] of longint;
    mang2=array [0..maxn*4] of diem;
var
    n:longint;
    res:diem;
    a,pos:mang1;
    it:mang2;
procedure nhap;
    var
        i:longint;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do read(a[i]);
        it[0].gt:=-1;
        it[0].vt:=0;
    end;
function max(a,b:diem):diem;
    begin
        if a.gt>=b.gt then exit(a)
        else exit(b);
    end;
procedure build(i,l,r:longint);
    var
        mid:longint;
    begin
        if l=r then
            begin
                it[i].gt:=a[l];
                it[i].vt:=l;
                pos[l]:=i;
                exit;
            end;
        mid:=(l+r) div 2;
        build(i*2,l,mid);
        build(i*2+1,mid+1,r);
        it[i]:=max(it[i*2],it[i*2+1]);
    end;
{procedure UpDate(vitri,giatri:longint);
    var
        i:longint;
        tam:diem;
    begin
        i:=pos[vitri];
        a[vitri]:=giatri;
        it[i].gt:=giatri;
        it[i].vt:=vitri;
        i:=i div 2;
        tam.gt:=giatri;
        tam.vt:=vitri;
        while i>0 do
            begin
                it[i]:=max(it[i],tam);
                i:=i div 2;
            end;
    end; }
procedure UpDate(i,l,r,vitri,giatri:longint);
    var
        mid:longint;
    begin
        if (l>vitri) or (r<vitri) then exit;
        if (l=r) and (l=vitri) then
            begin
                it[i].gt:=giatri;
                it[i].vt:=l;
                a[vitri]:=giatri;
                //pos[l]:=i;
                exit;
            end;
        mid:=(l+r) div 2;
        UpDate(i*2,l,mid,vitri,giatri);
        UpDate(i*2+1,mid+1,r,vitri,giatri);
        it[i]:=max(it[i*2],it[i*2+1]);
    end;
procedure Get(i,l,r,u,v:longint);
    var
        mid:longint;
    begin
        if u>v then exit;
        if (l>v) or (r<u) then exit;
        if (l>=u) and (r<=v) then
            begin
                res:=max(res,it[i]);
                exit;
            end;
        mid:=(l+r) div 2;
        Get(i*2,l,mid,u,v);
        Get(i*2+1,mid+1,r,u,v);
    end;
procedure solve;
    var
        i,u,v,q:longint;
        c:char;
        tam,tam1,tam2:diem;
    begin
        readln(q);
        for i:=1 to q do
            begin
                read(c);
                readln(u,v);
                if c='U' then UpDate(1,1,n,u,v)
                else
                    begin
                        res.vt:=0;
                        res.gt:=-1;
                        Get(1,1,n,u,v);
                        tam:=res;
                        res.vt:=0;
                        res.gt:=-1;
                        Get(1,1,n,u,tam.vt-1);
                        tam1:=res;
                        res.vt:=0;
                        res.gt:=-1;
                        Get(1,1,n,tam.vt+1,v);
                        tam2:=res;
                        writeln(tam.gt+max(tam1,tam2).gt);
                    end;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    build(1,1,n);
    solve;
end.

