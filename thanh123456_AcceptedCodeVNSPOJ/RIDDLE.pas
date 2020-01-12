const
     fin='';fon='';
     maxn=trunc(1e6);
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxn] of int64;
var
     n,k,test:longint;
     a,b:mang1;
     s:mang2;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(tesT);
     end;
procedure nhapdulieu;
     var
          i:longint;
     begin
          readln(n,k);
          for i:=1 to n do read(b[i]);
     end;
procedure swap(VAr x,y:longint);
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
          x:=a[m];
          repeat
               while a[i]<x do inc(i);
               while a[j]>X do dec(j);
               if i<=j then
                    begin
                         swap(a[i],a[j]);
                         inc(i); dec(j);
                    end;
          until i>j;
          if l<j then qsort(l,j);
          if i<r then qsort(i,r);
     end;
function Check(m:longint):boolean;
     var
          i:longint;
     begin
          for i:=1 to m do a[i]:=b[i];
          qsort(1,m);
          for i:=1 to m do
               begin
                    if s[i-1]+1<int64(a[i]) then exit(false);
                    s[i]:=s[i-1]+int64(a[i]);
               end;
          if s[m]<k then exit(false);
          exit(true);
     end;
procedure solve;
     var
          l,r,mid,res:longint;
     begin
          l:=1;
          res:=0;
          r:=n;
          repeat
               mid:=(l+r) div 2;
               if Check(mid)=false then
                    l:=mid+1
               else
                    begin
                         res:=mid;
                         r:=mid-1;
                    end;
          until l>r;
          if res=0 then writeln(-1)
          else writeln(res);
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    nhapdulieu;
                    solve;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.