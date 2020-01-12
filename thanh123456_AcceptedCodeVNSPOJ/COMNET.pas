const
     fin='';fon='';
     maxn=trunc(1e5)+1;
     maxm=trunc(1e6)+1;
type diem=record
     u,v,w,w2:longint;
end;
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxm] of diem;
var
     n,m,q,test:longint;
     c,vt:mang1;
     a:mang2;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
     end;
procedure nhapdulieu;
     var
          i:longint;
     begin
          readln(n,m,q);
          for i:=1 to m do
               readln(a[i].u,a[i].v,a[i].w);
     end;
procedure init;
     var
          i:longint;
     begin
          for i:=1 to n do c[i]:=-1;
     end;
function TimGoc(i:longint):longint;
     begin
          if c[i]=-1 then exit(i)
          else
               begin
                    c[i]:=TimGoc(c[i]);
                    exit(c[i]);
               end;
     end;
procedure union(u,v:longint);
     var
          x,y:longint;
     begin
          x:=TimGoc(U);
          y:=TimGoc(v);
          if x=y then exit;
          c[x]:=y;
     end;
procedure swap(var x,y:longint);
     var
          tam:longint;
     begin
          tam:=x; x:=y; y:=tam;
     end;
procedure Check(vitri,sl:longint);
     var
          i,u,v:longint;
     begin
          init;
          for i:=1 to m do
               begin
                    if a[i].w < a[vitri].w then
                         begin
                              u:=a[i].u;
                              v:=a[i].v;
                              Union(u,v);
                         end;
               end;
          if TimGoc(a[vitri].u)=TimGoc(a[vitri].v) then writeln('YES')
          else writeln('NO');
          for i:=1 to sl do
               swap(a[vt[i]].w,a[vt[i]].w2);
     end;
procedure solve;
     var
          i,sl,vitri,j,tam:longint;
     begin
          for i:=1 to q do
               begin
                    read(vitri,sl);
                    for j:=1 to sl do
                         begin
                              read(vt[j],tam);
                              a[vt[j]].w2:=tam;
                              swap(a[vt[j]].w,a[vt[j]].w2);
                         end;
                    Check(vitri,sl);
               end;
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
