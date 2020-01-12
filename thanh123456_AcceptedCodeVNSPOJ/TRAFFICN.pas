uses math;
const
     fin='';fon='';
     maxn=trunc(5e5);
     maxm=trunc(1e9);
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxn] of boolean;
var
     test,n,m,s,t,top,k:longint;
     h,u,v,c,a,p,loai,heap,pos,d,d1,d2:mang1;
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
          readln(n,m,k,s,t);
          for i:=1 to n+1 do
               begin
                    h[i]:=0;
                    free[i]:=false;
               end;
          for i:=1 to m do
               begin
                    readln(u[i],v[i],c[i]);
                    inc(h[u[i]]);
                    inc(h[v[i]]);
               end;
          for i:=1 to n+1 do h[i]:=h[i-1]+h[i];
          for i:=m downto 1 do
               begin
                    a[h[u[i]]]:=v[i];
                    p[h[u[i]]]:=c[i];
                    loai[h[u[i]]]:=1;
                    dec(h[u[i]]);
                    a[h[v[i]]]:=u[i];
                    p[h[v[i]]]:=c[i];
                    loai[h[v[i]]]:=2;
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
          if top>1 then
               begin
                    heap[1]:=heap[top];
                    pos[heap[1]]:=1;
               end;
          heap[top]:=0;
          dec(top);
          if top>0 then DownHeap(1);
     end;
procedure init(s:longint);
     var
          i:longint;
     begin
          for i:=1 to n do
               begin
                    d[i]:=maxm;
                    pos[i]:=0;
                    free[i]:=false;
               end;
          top:=0;
          push(s);
          d[s]:=0;
     end;
procedure Dijkstra(s,thutu:longint;var stack:mang1);
     var
          i,u,v,w:longint;
     begin
          init(s);
          repeat
               u:=pop;
               for i:=h[u]+1 to h[u+1] do
                    begin
                         v:=a[i];
                         w:=p[i];
                         if free[v]=true then continue;
                         if loai[i]=thutu then Relax(u,v,w);
                    end;
          until top=0;
          for i:=1 to n do stack[i]:=d[i];
     end;
procedure solve;
     var
          res,i,u,v,w,s1,s2:longint;
     begin
          Dijkstra(s,1,d1);
          Dijkstra(t,2,d2);
          res:=d1[t];
          for i:=1 to k do
               begin
                    readln(u,v,w);
                    s1:=d1[u]+w+d2[v];
                    s2:=d2[u]+w+d1[v];
                    s:=min(s1,s2);
                    res:=min(res,s);
               end;
          if res=maxm then writeln(-1)
          else writeln(res);
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test  do
               begin
                    taomang;
                    solve;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.
