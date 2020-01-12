uses math;
const
        tfi     =       '';
        tfo     =       '';
        vc      =       100000;
type
        arr1    =       array[0..10000] of longint;
var
        fi,fo:Text;
        n,m,maxa,res,kq:longint;
        a:arr1;
{-------------------------------------------------------------------------}
procedure nhap;
var i,j:longint;
begin
        assign(fi,tfi);reset(fi);
         read(fi,n,m);
         maxa:=0;
         for i:=1 to m do
          begin
           read(fi,a[i]);
           maxa:=max(maxa,a[i]);
          end;
        close(fi);
end;
{-------------------------------------------------------------------------}
{-------------------------------------------------------------------------}
function find(x:longint):longint;
var l,r,mid,i:longint;
begin
        i:=vc;
        l:=1;
        r:=m;
        while l<=r do
         begin
          mid:=(l+r)shr 1;
          if a[mid]>=x then
           begin
            i:=mid;
            l:=mid+1;
           end
          else r:=mid-1;
         end;
        exit(i);
end;
{-------------------------------------------------------------------------}
procedure xuly;
var i,j,l,r,mid:longint;
begin
        res:=0;
        for mid:=0 to maxa do
         begin
          i:=find(mid);
          j:=min(i,n)*mid;
          if j>res then
           begin
            res:=j;
            kq:=mid;
           end;
         end;
end;
{-------------------------------------------------------------------------}
procedure doicho(var i,j:longint);
var tg:longint;
begin
        tg:=i;
        i:=j;
        j:=tg;
end;
{-------------------------------------------------------------------------}
procedure sort(l,r:longint);
var mid,i,j:longint;
begin
        i:=l;
        j:=r;
        mid:=a[(l+r)div 2];
        repeat
         while a[i]>mid do inc(i);
         while a[j]<mid do dec(j);
         if i<=j then
          begin
           doicho(a[i],a[j]);
           inc(i);
           dec(j);
          end;
        until i>j;
        if i<r then sort(i,r);
        if l<j then sort(l,j);
end;
{-------------------------------------------------------------------------}
procedure inkq;
var i,j:longint;
begin
        assign(fo,tfo);rewrite(fo);
         write(fo,kq,' ',res);
        close(fo);
end;
{-------------------------------------------------------------------------}
begin
        nhap;
        sort(1,m);
        xuly;
        inkq;
end.
