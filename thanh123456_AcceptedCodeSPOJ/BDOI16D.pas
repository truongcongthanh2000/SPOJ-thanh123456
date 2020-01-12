uses math;
const
     fin='';fon='';
     maxn=trunc(1e5)+1;
     maxk=51;
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxn] of int64;
     mang3=array [0..maxn,0..maxk] of int64;
var
     n,kc,k,test:longint;
     x,v,left:mang1;
     s:mang2;
     f:mang3;
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
          readln(n,kc,k);
          for i:=1 to n do
               begin
                    readln(x[i],v[i]);
                    left[i]:=i;
                    s[i]:=0;
               end;
     end;
procedure swap(var x,y:longint);
     var
          tam:longint;
     begin
          tam:=x; x:=y; y:=tam;
     end;
procedure qsorT(l,r:longint);
     var
          i,j,xx,m:longint;
     begin
          i:=l; j:=r;
          m:=random(r-l)+l+1;
          xx:=x[m];
          repeat
               while x[i]<xx do inc(i);
               while x[j]>xx do dec(j);
               if i<=j then
                    begin
                         swap(x[i],x[j]);
                         swap(v[i],v[j]);
                         inc(i); dec(j);
                    end;
          until i>j;
          if l<j then qsort(l,j);
          if i<r then qsort(i,r);
     end;
function Check(x,y:longint):boolean;
     begin
          if abs(y-x) <= 2*kc then exit(true)
          else exit(false);
     end;
procedure Left_right;
     var
          l,r,i:longint;
     begin
          x[0]:=0;
          l:=0;
          for r:=1 to n do
               begin
                    while (Check(x[l],x[r])=false) and (l<r) do inc(l);
                    left[r]:=l;
               end;
          for i:=1 to n do s[i]:=s[i-1]+int64(v[i]);
     end;
function Get(l,r:longint):int64;
     begin
          exit(s[r]-s[l-1]);
     end;
procedure qhd;
     var
          i,j:longint;
     begin
          for i:=1 to n do f[i,0]:=0;
          for i:=1 to k do f[0,i]:=0;
          for i:=1 to n do
               for j:=1 to k do
                    begin
                         f[i,j]:=f[i-1,j];
                         if left[i]=0 then f[i,j]:=max(f[i,j],s[i])
                         else f[i,j]:=max(f[i,j],f[left[i]-1,j-1]+Get(left[i],i));
                    end;
          writeln(f[n,k]);
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    nhapdulieu;
                    qsort(1,n);
                    lefT_right;
                    write('Case ',i,': ');
                    qhd;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.
