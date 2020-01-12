uses math;
const
    fin='';fon='';
    maxn=trunc(1e6);
type diem=record
    resmin,ressum,lazy:int64;
end;
type
    mang1=array [0..maxn] of diem;
    mang2=array [0..maxn] of longint;
var
    test,n,q,count:longint;
    x,c,h,a,left,right:mang2;
    it:mang1;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
    end;
procedure NhapDuLieu;
    var
        i:longint;
    begin
        fillchar(left,sizeof(left),0);
        fillchar(right,sizeof(right),0);
        fillchar(h,sizeof(h),0);
        fillchar(x,sizeof(x),0);
        fillchar(c,sizeof(c),0);
        readln(n,q);
        count:=0;
        for i:=1 to n do
            begin
                readln(x[i],c[i]);
                inc(h[x[i]]);
                //trace[i]:=x[i];
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
        for i:=1 to n do
            begin
                a[h[x[i]]]:=i;
                dec(h[x[i]]);
            end;
    end;
procedure dfs(u:longint);
    var
        i,v:longint;
    begin
        inc(count);
        left[u]:=count;
        for i:=h[u]+1 to h[u+1] do
            begin
                v:=a[i];
                if left[v]=0 then dfs(v);
            end;
        right[u]:=count;
        x[left[u]]:=c[u];
    end;
procedure build(i,l,r:longint);
    var
        mid:longint;
    begin
        if l=r then
            begin
                it[i].resmin:=x[l];
                it[i].ressum:=x[l];
                it[i].lazy:=0;
                exit;
            end;
        mid:=(l+r) div 2;
        build(i*2,l,mid);
        build(i*2+1,mid+1,r);
        it[i].lazy:=0;
        it[i].resmin:=min(it[i*2].resmin,it[i*2+1].resmin);
        it[i].ressum:=it[i*2].ressum+it[i*2+1].ressum;
    end;
procedure UpDate(i,l,r,u,v:longint;var x:int64);
    var
        mid:longint;
    begin
        inc(it[i].resmin,it[i].lazy);
        inc(it[i].ressum,it[i].lazy*int64(r-l+1));
        if l<>r then
            begin
                inc(it[i*2].lazy,it[i].lazy);
                inc(it[i*2+1].lazy,it[i].lazy);
            end;
        it[i].lazy:=0;
        if (l>v) or (r<u) then exit;
        if (l>=u) and (r<=v) then
            begin
                inc(it[i].lazy,x);
                if l<>r then
                    begin
                        inc(it[i*2].lazy,x);
                        inc(it[i*2+1].lazy,x);
                    end;
                inc(it[i].resmin,it[i].lazy);
                inc(it[i].ressum,it[i].lazy*int64(r-l+1));
                it[i].lazy:=0;
                exit;
            end;
        mid:=(l+r) div 2;
        UpDate(i*2,l,mid,u,v,x);
        UpDate(i*2+1,mid+1,r,u,v,x);
        it[i].resmin:=min(it[i*2].resmin,it[i*2+1].resmin);
        it[i].ressum:=it[i*2].ressum+it[i*2+1].ressum;
    end;
Function Tinh_Min(i,l,r,u,v:longint):int64;
    var
        mid:longint;
        left,right:int64;
    begin
        inc(it[i].resmin,it[i].lazy);
        inc(it[i].ressum,it[i].lazy*int64(r-l+1));
        if l<>r then
            begin
                inc(it[i*2].lazy,it[i].lazy);
                inc(it[i*2+1].lazy,it[i].lazy);
            end;
        it[i].lazy:=0;
        if (l>v) or (r<u) then exit(maxlongint)
            else
                if (l>=u) and (r<=v) then exit(it[i].resmin)
                    else
                        begin
                            mid:=(l+r) div 2;
                            left:=Tinh_Min(i*2,l,mid,u,v);
                            Right:=Tinh_Min(i*2+1,mid+1,r,u,v);
                            exit(min(left,right));
                        end;
    end;
Function Tinh_Sum(i,l,r,u,v:longint):int64;
    var
        mid:longint;
        left,right:int64;
    begin
        inc(it[i].resmin,it[i].lazy);
        inc(it[i].ressum,it[i].lazy*int64(r-l+1));
        if l<>r then
            begin
                inc(it[i*2].lazy,it[i].lazy);
                inc(it[i*2+1].lazy,it[i].lazy);
            end;
        it[i].lazy:=0;
        if (l>v) or (r<u) then exit(0)
            else
                if (l>=u) and (r<=v) then exit(it[i].ressum)
                    else
                        begin
                            mid:=(l+r) div 2;
                            left:=Tinh_Sum(i*2,l,mid,u,v);
                            Right:=Tinh_Sum(i*2+1,mid+1,r,u,v);
                            exit(left+right);
                        end;
    end;
procedure init;
    begin
        dfs(1);
        build(1,1,right[1]);
    end;
procedure solve;
    var
        i,c,dinh:longint;
        res:diem;
    begin
        for i:=1 to q do
            begin
                readln(c,dinh);
                if c=1 then
                    begin
                        Res.ressum:=Tinh_Sum(1,1,right[1],left[dinh],right[dinh]);
                        writeln(Res.ressum);
                    end
                else
                    begin
                        Res.resmin:=Tinh_Min(1,1,right[1],left[dinh],right[dinh]);
                        if Res.resmin>1000 then res.resmin:=1000;
                        UpDate(1,1,right[1],left[dinh],right[dinh],res.resmin);
                    end;
            end;
    end;
procedure xuat;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                NhapDulieu;
                init;
                writeln('Case ',i,':');
                solve;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    xuat;
end.




