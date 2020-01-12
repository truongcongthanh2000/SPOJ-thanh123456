const
     fin='';fon='';
     SaiSo=1e-9;
     maxn=2000;
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxn] of double;
var
     n:longint;
     cs_1,cs_2,b,x_xanh,x_do,y_xanh,y_do:mang1;
     a:mang2;
procedure nhap;
     var
          i:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n);
          for i:=1 to n do
               begin
                    cs_1[i]:=i;
                    readln(x_xanh[i],y_xanh[i]);
               end;
          for i:=1 to n do
               begin
                    cs_2[i]:=i+n;
                    readln(x_do[i],y_do[i]);
               end;
     end;
procedure Swap1(var x,y:longint);
     var
          tam:longint;
     begin
          tam:=x; x:=y; y:=tam;
     end;
procedure swap2(var x,y:double);
     var
          tam:double;
     begin
          tam:=x; x:=y;  y:=tam;
     end;
procedure qsort(l,r:longint);
     var
          i,j,m:longint;
          x:double;
     begin
          i:=l; j:=r;
          m:=random(r-l)+l+1;
          x:=a[m];
          repeat
               while a[i]<x do inc(i);
               while a[j]>x do dec(j);
               if i<=j then
                    begin
                         swap2(a[i],a[j]);
                         swap1(b[i],b[j]);
                         inc(i); dec(j);
                    end;
          until i>j;
          if l<j then qsort(l,j);
          if i<r then qsort(i,r);
     end;
procedure solve_1; ///1 xanh 2 do
     var
          i,j,u,v:longint;
     begin
          for i:=1 to n do
               begin
                    for j:=1 to n do
                         begin
                              u:=x_xanh[i]-x_do[j];
                              v:=y_xanh[i]-y_do[j];
                              b[j]:=cs_2[j];
                              if v=0 then a[j]:=SaiSo
                              else a[j]:=u/v;
                         end;
                    qsort(1,n);
                    for j:=1 to n-1 do
                         if a[j]=a[j+1] then
                              begin
                                   writeln(cs_1[i],' ',b[j],' ',b[j+1]);
                                   halt;
                              end;
               end;
     end;
procedure solve_2; ///1 do 2 xanh
     var
          i,j,u,v:longint;
     begin
          for i:=1 to n do
               begin
                    for j:=1 to n do
                         begin
                              u:=x_do[i]-x_xanh[j];
                              v:=y_do[i]-y_xanh[j];
                              b[j]:=cs_1[j];
                              if v=0 then a[j]:=SaiSo
                              else a[j]:=u/v;
                         end;
                    qsort(1,n);
                    for j:=1 to n-1 do
                         if a[j]=a[j+1] then
                              begin
                                   writeln(cs_2[i],' ',b[j],' ',b[j+1]);
                                   halt;
                              end;
               end;
     end;
procedure xuat;
     begin
          writeln(-1);
     close(input); close(output);
     end;
begin
     nhap;
     solve_1;
     solve_2;
     xuat;
end.

