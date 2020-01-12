const
   fin='';fon='';
   maxn=trunc(1e6);
type mang=array [0..maxn] of longint;
var
    u,v,c,h,a,p,pos,heap,trace,d:mang;
    n,m,res,top:longint;
function max(a,b:longint):longint;
    begin
        if a>b then exit(a)
        else exit(B);
    end;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m);
    end;
procedure taomang;
    var
        i:longint;
    begin  
        for i:=1 to m do
            begin
                readln(u[i],v[i],c[i]);
                inc(h[u[i]]); inc(h[v[i]]);
            end;
        for i:=2 to n+1 do h[i]:=h[i-1]+h[i];
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
    var
        x:longint;
    begin
        x:=pos[v];
        if x=0 then push(v)
        else UpHeap(x);
    end;
procedure tinh(u,v,w:longint);
    begin
        if d[v]>w then
            begin
                d[v]:=w;
                trace[v]:=u;
                UpDate(v);
            end;
    end;
function pop:longint;
    begin
        pop:=heap[1];
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
        for i:=1 to n do d[i]:=maxlongint;
        d[1]:=0;
    end;
procedure Prim;
    var
        i,u,v,w:longint;
    begin
        res:=0;
        push(1);
        repeat
            u:=pop;
            res:=max(res,d[u]);
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
        writeln(res);
    close(input); close(output);
    end;
begin
    nhap;
    taomang;
    init;
    Prim;
    xuat;
end.

