uses math;
const
     //fin='GASOLINE.inp';fon='GASOLINE.out';
     fin=''; fon='';
     maxn=trunc(1e6);
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxn] of boolean;
var
     test,n,m,top:longint;
     h,pos,heap,d,u,v,c,p,a:mang1;
     free:mang2;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
     end;
procedure taomang;
     var
          i:longint;
     begin
          readln(n,m);
          for i:=1 to n+1 do
               begin
                    free[i]:=false;
                    h[i]:=0;
                    pos[i]:=0;
               end;
          for i:=1 to m do
               begin
                    readln(u[i],v[i],c[i]);
                    inC(u[i]);
                    inc(v[i]);
                    inc(h[u[i]]);
                    inc(h[v[i]]);
               end;
          for i:=1 to n+1 do h[i]:=h[i-1]+h[i];
          for i:=m downto 1 do
               begin
                    a[h[u[i]]]:=v[i];
                    p[h[u[i]]]:=c[i];
                    dec(h[u[i]]);
                    a[h[v[i]]]:=u[i];
                    p[h[v[i]]]:=c[i];
                    dec(h[v[i]]);
               end;
     end;
procedure swap(i,j:longint);
     var
          tam:longint;
     begin
          tam:=heap[i];
          heap[i]:=heap[j]; pos[heap[i]]:=i;
          heap[j]:=tam; pos[heap[j]]:=j;
     end;
procedure UpHeap(i:longint);
     begin
          if (i=1) or (d[heap[i]]>d[heap[i div 2]]) then exit;
          swap(i,i div 2);
          UpHeap(i div 2);
     end;
procedure DownHeap(i:longint);
     var
          j:longint;
     begin
          j:=2*i;
          if j>top then exit;
          if (j<top) and (d[heap[j]]>d[heap[j+1]]) then inc(j);
          if d[heap[i]]>d[heap[j]] then
               begin
                    swap(i,j);
                    DownHeap(j);
               end;
     end;
procedure push(x:longint);
     begin
          inc(top);
          heap[top]:=x;
          pos[x]:=top;
          UpHeap(top);
     end;
procedure UpDate(v:longint);
     begin
          if pos[v]=0 then push(v)
          else UpHeap(pos[v]);
     end;
procedure Relax(u,v,w:longint);
     begin
          if d[v]>d[u]+w then
               begin
                    d[v]:=d[u]+w;
                    UpDate(v);
               end;
     end;
function pop:longint;
     begin
          pop:=heap[1];
          free[pop]:=true;
          pos[pop]:=0;
          if top=1 then
               begin
                    heap[1]:=0;
                    dec(top);
                    exit;
               end;
          heap[1]:=heap[top];
          pos[heap[1]]:=1;
          heap[top]:=0;
          dec(top);
          DownHeap(1);
     end;
procedure init(s:longint);
     var
          i:longint;
     begin
          for i:=1 to n do
               begin
                    d[i]:=maxlongint;
                    pos[i]:=0;
                    free[i]:=false;
               end;
          top:=0;
          d[s]:=0;
          push(s);
     end;
procedure Dijkstra(x:longint);
     var
          i,u,v,w:longint;
     begin
          init(x);
          repeat
               u:=pop;
               for i:=h[u]+1 to h[u+1] do
                    begin
                         v:=a[i];
                         w:=p[i];
                         if free[v]=true then continue;
                         relax(u,v,w);
                    end;
          until top=0;
     end;
procedure Solve;
     var
          i,res,j:longint;
     begin
          res:=0;
          for i:=1 to n do
               begin
                    Dijkstra(i);
                    for j:=1 to n do
                         res:=Max(res,d[j]);
               end;
          if res=maxlongint then writeln(-1)
          else writeln(res);
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    TaoMang;
                    solve;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.