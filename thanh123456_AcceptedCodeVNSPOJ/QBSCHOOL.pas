const
    fin='';fon='';
    maxm=trunc(1e9);
    maxn=trunc(1e5);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of int64;
var
    n,m,top:longint;
    u,v,k,c,h,a,p,heap,pos:mang1;
    d,bac:mang2;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n,m);
    end;
procedure taomang;
    var
        i:longint;
    begin
        for i:=1 to m do
            begin
                readln(k[i],u[i],v[i],c[i]);
                inc(h[u[i]]);
                if k[i]=2 then inc(h[v[i]]);
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
        for i:=m downto 1 do
            begin
                a[h[u[i]]]:=v[i];
                p[h[u[i]]]:=c[i];
                deC(h[u[i]]);
                if k[i]=2 then
                    begin
                        a[h[v[i]]]:=u[i];
                        p[h[v[i]]]:=c[i];
                        dec(h[v[i]]);
                    end;
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
procedure UpHeap(i:longinT);
    begin
        if (i=1) or (d[heap[i]]>=d[heap[i div 2]]) then exit;
        swap(i,i div 2);
        UpHeap(i div 2);
    end;
procedure DownHeap(i:longinT);
    var
        j:longint;
    begin
        j:=2*i;
        if j>top then exit;
        if (j<top) and (d[heap[j]]>=d[heap[j+1]]) then inc(j);
        if d[heap[i]]>=d[heap[j]] then
            begin
                swap(i,j);
                DownHeap(j);
            end;
    end;
procedure push(x:longinT);
    begin
        inc(top);
        heap[top]:=x;
        pos[x]:=top;
        UpHeap(top);
    end;
procedure UpDate(v:longinT);
    var
        x:longint;
    begin
        x:=pos[v];
        if x=0 then push(v)
        else UpHeap(x);
    end;
procedure Tinh(u,v,w:longint);
    begin
        if d[u]+w<d[v] then
            begin
                d[v]:=d[u]+w;
                bac[v]:=bac[u];
                UpDate(v);
            end
        else
        if d[u]+w = d[v] then
            begin
                bac[v]:=bac[v]+bac[u];
                UpDate(v);
            end;
    end;
function pop:longint;
    begin
        pop:=heap[1];
        pos[pop]:=0;
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
        for i:=1 to n do d[i]:=maxm;
        d[1]:=0;
        bac[1]:=1;
    end;
procedure Dijkstra;
    var
        i,u,v,w:longint;
    begin
        push(1);
        repeat
            u:=pop;
            for i:=h[u]+1 to h[u+1] do
                begin
                    v:=a[i];
                    w:=p[i];
                    Tinh(u,v,w);
                end;
        until top=0;
    end;
procedure xuat;
    begin
        writeln(d[n],' ',bac[n]);
    close(input); close(output);
    end;
begin
    nhap;
    taomang;
    init;
    Dijkstra;
    xuat;
end.
