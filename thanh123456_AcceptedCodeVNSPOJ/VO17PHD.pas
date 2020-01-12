const
     fin='';fon='';
     maxn=trunc(1e6);
     maxm=trunc(1e16);
type
     mang1=array [0..maxn] of longint;
     mang2=array [0..maxn] of boolean;
     mang3=array [0..maxn] of int64;
var
     n,top:longint;
     ts,u,v,h,a,pos,heap,c,p:mang1;
     free:mang2;
     d,bac:mang3;
procedure nhap;
     var
          i:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n);
          for i:=1 to n do read(ts[i]);
     end;
procedure TaoMang;
     var
          i,m:longint;
     begin
          readln(m);
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
                    dec(h[u[i]]);
                    a[h[v[i]]]:=u[i];
                    p[h[v[i]]]:=c[i];
                    dec(h[v[i]]);
               end;
     end;
procedure swap(i,j:longinT);
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
procedure ReLax(u,v,w:longint);
     begin
          if d[v]>d[u]+int64(w) then
               begin
                    d[v]:=d[u]+int64(w);
                    bac[v]:=bac[u]+int64(ts[v]);
                    UpDate(v);
               end
          else
          if d[v]=d[u]+int64(w) then
               begin
                    if bac[v]<bac[u]+int64(ts[v]) then
                         bac[v]:=bac[u]+int64(ts[v]);
               end;
     end;
Function pop:longint;
     begin
          pop:=heap[1];
          free[pop]:=true;
          pos[pop]:=0;
          if top=1 then
               begin
                    heap[top]:=0;
                    dec(top);
                    exit;
               end;
          heap[1]:=heap[top];
          pos[heap[1]]:=1;
          heap[top]:=0;
          dec(top);
          DownHeap(1);
     end;
procedure init;
     var
          i:longint;
     begin
          for i:=1 to n do
               d[i]:=maxm;
          d[1]:=0;
          bac[1]:=ts[1];
          push(1);
     end;
procedure Dijkstra;
     var
          i,u,v,w:longint;
     begin
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
procedure xuat;
     begin
          if d[n]=maxm then writeln('impossible')
          else writeln(d[n],' ',bac[n]);
     close(input); close(output);
     end;
begin
     nhap;
     taomang;
     init;
     Dijkstra;
     xuat;
end.

