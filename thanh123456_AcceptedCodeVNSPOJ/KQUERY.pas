const
     fin='';fon='';
     maxn=trunc(3e4);
type
     mang=array [0..maxn*8] of longint;
var
     n,q:longint;
     u,v,k,cs2,cs1,a,it,res:mang;
procedure nhap;
     var
          i:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n);
          for i:=1 to n do
               begin
                    read(a[i]);
                    cs1[i]:=i;
               end;
          readln(q);
          for i:=1 to q do
               begin
                    readln(u[i],v[i],k[i]);
                    cs2[i]:=i;
               end;
     end;
procedure swap(var x,y:longint);
     var
          tam:longint;
     begin
          tam:=x; x:=y; y:=tam;
     end;
procedure qsort(l,r:longint;var a,b:mang);
     var
          i,j,x,m,y:longint;
     begin
          i:=l; j:=r;
          m:=random(r-l)+l+1;
          x:=a[m];
          y:=b[m];
          repeat
               while (a[i]<x) or ((a[i]=x) and (b[i]<y)) do inc(i);
               while (a[j]>x) or ((a[j]=x) and (b[j]>y)) do dec(j);
               if i<=j then
                    begin
                         swap(a[i],a[j]);
                         swap(b[i],b[j]);
                         inc(i); dec(j);
                    end;
          until i>j;
          if l<j then qsort(l,j,a,b);
          if i<r then qsort(i,r,a,b);
     end;
procedure UpDate(i,l,r,u,v,giatri:longint);
     var
          mid:longint;
     begin
          if (l>v) or (r<u) then exit;
          if (l>=u) and (r<=v) then
               begin
                    it[i]:=it[i]+giatri;
                    exit;
               end;
          mid:=(l+r) div 2;
          UpDate(i*2,l,mid,u,v,giatri);
          Update(i*2+1,mid+1,r,u,v,giatri);
          it[i]:=it[i*2]+it[i*2+1];
     end;
function Get(i,l,r,u,v:longint):longint;
     var
          left,right,mid:longint;
     begin
          if (l>v) or (r<u) then exit(0)
               else
                    if (l>=u) and (r<=v) then exit(it[i])
                         else
                              begin
                                   mid:=(l+r) div 2;
                                   left:=Get(i*2,l,mid,u,v);
                                   right:=Get(i*2+1,mid+1,r,u,v);
                                   exit(left+Right);
                              end;
     end;
procedure solve;
     var
          i,j:longint;
     begin
          for i:=1 to n do UpDate(1,1,n,i,i,1);
          j:=1;
          for i:=1 to q do
               begin
                    while a[j]<=k[i] do
                         begin
                              UpDate(1,1,n,cs1[j],cs1[j],-1);
                              inc(J);
                         end;
                    if j<=n then res[cs2[i]]:=Get(1,1,n,1,v[cs2[i]])-Get(1,1,n,1,u[cs2[i]]-1)
                    else res[cs2[i]]:=0;
               end;
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to q do writeln(res[i]);
     close(input); close(output);
     end;
begin
     nhap;
     qsort(1,n,a,cs1);
     qsort(1,q,k,cs2);
     solve;
     xuat;
end.
