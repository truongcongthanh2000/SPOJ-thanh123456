uses math;
const
     fin='';fon='';
     maxn=trunc(5e5);
type
     mang=array [0..maxn] of longint;
     mang2=array [0..maxn,0..20] of longint;
var
     n,m,log,count:longint;
     u,v,c,h,a,p,x,y,loai,d,lazy,it,it2,left,right,w,thutu,cs,stack:mang;
     b:mang2;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n,m);
          log:=trunc(log2(n));
          count:=0;
     end;
procedure taomang;
     var
          i,vitri:longint;
          kitu:char;
     begin
          for i:=1 to n-1 do
               begin
                    readln(u[i],v[i],c[i]);
                    inc(h[u[i]]);
                    inc(h[v[i]]);
               end;
          for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
          for i:=n-1 downto 1 do
               begin
                    a[h[u[i]]]:=v[i];
                    p[h[u[i]]]:=c[i];
                    dec(h[u[i]]);
                    a[h[v[i]]]:=u[i];
                    p[h[v[i]]]:=c[i];
                    dec(h[v[i]]);
               end;
          for i:=1 to m do
               begin
                    read(kitu);
                    if kitu='P' then
                         begin
                              readln(x[i],y[i],c[i]);
                              loai[i]:=1;
                         end
                    else
                         begin
                              readln(vitri,c[i]);
                              x[i]:=u[vitri];
                              y[i]:=v[vitri];
                              loai[i]:=2;
                         end;
               end;
     end;
procedure dfs(u:longint);
     var
          i,v:longint;
     begin
          i:=0;
          while b[u,i]<>0 do
               begin
                    if b[b[u,i],i]=0 then break;
                    b[u,i+1]:=b[b[u,i],i];
                    inc(i);
               end;
          inc(count);
          left[u]:=count;
          for i:=h[u]+1 to h[u+1] do
               begin
                    v:=a[i];
                    if left[v]=0 then
                         begin
                              w[v]:=p[i];
                              b[v,0]:=u;
                              d[v]:=d[u]+1;
                              dfs(v);
                         end;
               end;
          right[u]:=count;
     end;
procedure swap(var x,y:longint);
     var
          tam:longint;
     begin
          tam:=x; x:=y; y:=tam;
     end;
function mu(x,k:longint):longint;
     begin
          if k=0 then exiT(1)
          else exit(x shl (k-1));
     end;
function LCA(u,v:longinT):longint;
     var
          i,k:longint;
     begin
          if d[u]<d[v] then swap(u,v);
          k:=d[u]-d[v];
          for i:=log downto 0 do
               begin
                    if k>=mu(2,i) then
                         begin
                              u:=b[u,i];
                              k:=k-mu(2,i);
                         end;
               end;
          if u=v then exit(u);
          for i:=log downto 0 do
               begin
                    if b[u,i]<>b[v,i] then
                         begin
                              u:=b[u,i];
                              v:=b[v,i];
                         end
                    else LCA:=b[u,i];
               end;
     end;
procedure qsort(l,r:longint;var a,b:mang);
     var
          i,x,m,j:longint;
     begin
          i:=l; j:=r;
          m:=random(r-l)+l+1;
          x:=a[m];
          repeat
               while a[i]<x do inc(i);
               while a[j]>x do dec(j);
               if i<=j then
                    begin
                         swap(a[i],a[j]);
                         swap(b[i],b[j]);
                         inc(i); dec(j);
                    end;
          until i>j;
          if l<j then qsorT(l,j,a,b);
          if i<r then qsorT(i,r,a,b);
     end;
procedure qsort_TruyVan(l,r:longint);
     var
          i,j,xx,m:longint;
     begin
          i:=l; j:=r;
          m:=random(r-l)+l+1;
          xx:=c[m];
          repeat
               while c[i]<xx do inc(i);
               while c[j]>Xx do dec(j);
               if i<=j then
                    begin
                         swap(x[i],x[j]);
                         swap(y[i],y[j]);
                         swap(loai[i],loai[j]);
                         swap(c[i],c[j]);
                         swap(thutu[i],thutu[j]);
                         inc(i); dec(j);
                    end;
          until i>j;
          if l<j then qsort_TruyVan(l,J);
          if i<r then qsort_TruyVan(i,r);
     end;
procedure init_mang;
     var
          i:longint;
     begin
          dfs(1);
          for i:=1 to n do cs[i]:=i;
          qsort(1,n,w,cs);
          for i:=1 to m do thutu[i]:=i;
          qsort_TruyVan(1,m);
     end;
procedure capnhat(i,l,r:longint);
     begin
          it[i]:=lazy[i]+it[i];
          if l<>r then
               begin
                    inC(lazy[i*2],lazy[i]);
                    inc(lazy[i*2+1],lazy[i]);
               end;
          lazy[i]:=0;
     end;
procedure UpDate(i,l,r,u,v:longint);
     var
          mid:longint;
     begin
          capnhat(i,l,r);
          if (l>v) or (r<u) then exit;
          if (l>=u) and (r<=v) then
               begin
                    inC(it[i]);
                    inC(lazy[i*2]);
                    inc(lazy[i*2+1]);
                    exit;
               end;
          mid:=(l+r) div 2;
          update(i*2,l,mid,u,v);
          update(i*2+1,mid+1,r,u,v);
     end;
function Find(i,l,r,u,v:longint):longint;
     var
          left,right,mid:longint;
     begin
          capnhat(i,l,r);
          if (l>v) or (r<u) then exit(0)
               else
                    if (l>=u) and (r<=v) then exit(it[i])
                         else
                              begin
                                   mid:=(l+r) div 2;
                                   left:=Find(i*2,l,mid,u,v);
                                   right:=Find(i*2+1,mid+1,r,u,v);
                                   exit(left+right);
                              end;
     end;
procedure Update2(i,l,r,u,v:longint);
     var
          mid:longint;
     begin
          if (l>v) or (r<u) then exit;
          if (l>=u) and (r<=v) then
               begin
                    it2[i]:=1;
                    exit;
               end;
          mid:=(l+r) div 2;
          UpDate2(i*2,l,mid,u,v);
          UpDate2(i*2+1,mid+1,r,u,v);
          it2[i]:=it2[i*2]+it2[i*2+1];
     end;
function Find2(i,l,r,u,v:longint):longint;
     var
          left,right,mid:longint;
     begin
          if (l>v) or (r<u) then exit(0)
               else
                    if (l>=u) and (r<=v) then exit(it2[i])
                         else
                              begin
                                   mid:=(l+r) div 2;
                                   left:=Find2(i*2,l,mid,u,v);
                                   right:=Find2(i*2+1,mid+1,r,u,v);
                                   exit(left+right);
                              end;
     end;
procedure solve;
     var
          l,i,res,root,res_x,res_y,res_root:longint;
     begin
          l:=0;
          for i:=1 to m do
               begin
                    while (c[i]>=w[l+1]) and (l<n) do
                         begin
                              inc(l);
                              UpDate(1,1,n,left[cs[l]],right[cs[l]]);
                              UpDate2(1,1,n,left[cs[l]],left[cs[l]]);
                         end;
                    if loai[i]=1 then
                         begin
                              root:=LCA(x[i],y[i]);
                              res_x:=Find(1,1,n,left[x[i]],left[x[i]]);
                              res_y:=Find(1,1,n,left[y[i]],left[y[i]]);
                              res_root:=Find(1,1,n,left[root],left[root]);
                              res:=(res_x+res_y-2*res_root);
                              stack[i]:=res;
                         end
                    else
                         begin
                              if b[y[i],0]=x[i] then
                                   begin
                                        res:=Find2(1,1,n,left[y[i]]+1,right[y[i]]);
                                        stack[i]:=res;
                                   end
                              else
                                   begin
                                        res:=Find2(1,1,n,left[x[i]]+1,right[x[i]]);
                                        stack[i]:=res;
                                   end;
                         end;
               end;
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to m do
               writeln(stack[i]);
          close(input); close(output);
     end;
begin
     nhap;
     taomang;
     init_mang;
     solve;
     qsort(1,m,thutu,stack);
     xuat;
end.
