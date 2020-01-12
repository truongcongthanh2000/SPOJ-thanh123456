uses math;
const
    fin='';fon='';
    maxn=trunc(2e5);
    maxm=trunc(1e15);
type diem=record
    gt,sl:longint;
end;
type
    mang1=array [0..maxn*10] of longint;
    mang2=array [0..maxn,0..30] of longint;
    mang3=array [0..maxn,-1..30] of int64;
    mang4=array [0..maxn*10] of diem;
    mang5=array [0..maxn,0..20] of boolean;
var
    n,m,k,top,s,t:longint;
    u,v,c,h,a,p:mang1;
    pos:mang2;
    d:mang3;
    heap:mang4;
    free:mang5;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n,m,k,s,t);
    end;
procedure taomang;
     var
        i:longint;
     begin
        for i:=1 to m do
            begin
                readln(u[i],v[i],c[i]);
                inc(h[u[i]]);
                inc(h[v[i]]);
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
function Check(x,y:diem):boolean;
    begin
        if d[x.gt,x.sl]>d[y.gt,y.sl] then exit(true)
        else exit(false);
    end;
procedure swap(i,j:longint);
    var
        tam:diem;
    begin
        tam:=heap[i];
        heap[i]:=heap[j]; pos[heap[i].gt,heap[i].sl]:=i;
        heap[j]:=tam; pos[heap[j].gt,heap[j].sl]:=j;
    end;
procedure UpHeap(i:longint);
    begin
        if (i=1) or (Check(heap[i],heap[i div 2])=true) then exit;
        Swap(i,i div 2);
        UpHeap(i div 2);
    end;
procedure DownHeap(i:longint);
    var
        j:longint;
    begin
        j:=2*i;
        if j>top then exit;
        if (j<top) and (Check(heap[j],heap[j+1])=true) then inc(j);
        if Check(heap[i],heap[j])=true then
            begin
                swap(i,j);
                DownHeap(j);
            end;
    end;
procedure push(x,y:longint);
    begin
        inc(top);
        heap[top].gt:=x;
        heap[top].sl:=y;
        pos[x,y]:=top;
        UpHeap(top);
    end;
procedure UpDate(a,b:longint);
    var
        x:longint;
    begin
        x:=pos[a,b];
        if x=0 then push(a,b)
        else UpHeap(x);
    end;
procedure Tinh(u,SoVe1,v,SoVe2,w:longinT);
    var
        x:int64;
    begin
        if SoVe2=0 then
            begin
                if d[v,0]>d[u,0]+int64(w) then
                    begin
                        d[v,0]:=d[u,0]+int64(w);
                        UpDate(v,0);
                    end;
            end
        else
        if SoVe1>=SoVe2 then
            begin
                x:=min(d[u,SoVe2-1],d[u,SoVe2]+int64(w));
                if d[v,SoVe2]>x then
                    begin
                        d[v,SoVe2]:=x;
                        UpDate(v,SoVe2);
                    end;
            end
        else
            begin
                if d[v,SoVe2]>d[u,SoVe1] then
                    begin
                        d[v,SoVe2]:=d[u,SoVe1];
                        upDate(v,SoVe2);
                    end;
            end;
    end;
function Pop:diem;
    begin
        pop:=heap[1];
        free[pop.gt,pop.sl]:=true;
        pos[pop.gt,pop.sl]:=0;
        heap[1]:=heap[top];
        pos[heap[1].gt,heap[1].sl]:=1;
        heap[top]:=heap[0];
        dec(top);
        DownHeap(1);
    end;
procedure init;
    var
        i,j:longint;
    begin
        for i:=1 to n do
            for j:=-1 to k do d[i,j]:=maxm;
        d[s,0]:=0;
        push(s,0);
    end;
procedure dijkstra;
    var
        i,j,u,v,w,SoVe:longint;
        x:diem;
    begin
        repeat
            x:=pop;
            u:=x.gt;
            SoVe:=x.sl;
            for i:=h[u]+1 to h[u+1] do
                begin
                    v:=a[i];
                    w:=p[i];
                    for j:=SoVe to k do
                        begin
                            if j=0 then
                                begin
                                    if (d[v,0]>d[u,0]+int64(w)) and (free[v,0]=false) then
                                        begin
                                            d[v,0]:=d[u,0]+int64(w);
                                            UpDate(v,0);
                                        end;
                                end
                            else
                            if j=SoVe then
                            begin
                            if (free[v,j]=false) and (d[v,j]>min(d[u,SoVe-1],d[u,Sove]+int64(w))) then
                                begin
                                    d[v,j]:=Min(d[u,SoVe-1],d[u,SoVe]+int64(w));
                                    UpDate(v,j);
                                end;
                            end
                            else
                            begin
                                if (free[v,j]=false) and (d[v,j]>d[u,SoVe]) then
                                    begin
                                        d[v,j]:=d[u,SoVe];
                                        UpDate(v,j);
                                    end;
                            end;
                        end;
                        //Tinh(u,SoVe,v,j,w);
                end;
        until top=0;
    end;
procedure solve;
    begin
        writeln(d[t,k]);
    close(input); close(output);
    end;
begin
    nhap;
    taomang;
    init;
    dijkstra;
    solve;
end.

