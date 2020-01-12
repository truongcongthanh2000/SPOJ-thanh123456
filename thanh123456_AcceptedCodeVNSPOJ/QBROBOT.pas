const
        fin='';fon='';
var
        n:longint;
        t,c:array [0..1000,0..1000] of int64;
        free,kt:array [0..100000] of boolean;
        d,a:array [0..100000] of int64;
        maxT:int64;
procedure nhap;
        var
                i,x,j:longint;
        begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(n);
        for i:=1 to n do
                begin
                for j:=i+1 to n do
                        begin
                        t[i,j]:=maxlongint;
                        t[j,i]:=t[i,j];
                        end;
                end;
        for i:=1 to n do
                begin
                read(x);
                if x=1 then free[i]:=true;
                end;
        end;
procedure taomang;
        var
                i,m,u,v:longint;
        begin
        readln(m);
        for i:=1 to m do
                begin
                readln(u,v,t[u,v],c[u,v]);
                inc(maxT,c[u,v]);
                t[v,u]:=t[u,v];
                c[v,u]:=c[u,v];
                end;
        end;
procedure dijkstra(x:int64);
        var
                i,u,v:longint;
        begin
        for i:=0 to n do
                begin
                d[i]:=maxlongint;
                kt[i]:=true;
                a[i]:=-maxlongint;
                end;
        d[1]:=0; a[1]:=x;
        repeat
                u:=0;
                for i:=1 to n do
                        if (d[i]<d[u]) and (kt[i]=true) then u:=i;
                if (u=0) or (u=n) then break;
                kt[u]:=false;
                for v:=1 to n do
                        begin
                        if (kt[v]=true) and (d[v]>d[u]+t[u,v]) and (a[u]>=c[u,v]) or ((d[v]=d[u]+t[u,v]) and ((a[u]-c[u,v])>a[v])) then
                                begin
                                d[v]:=d[u]+t[u,v];
                                if free[v]=false then a[v]:=a[u]-c[u,v]
                                else a[v]:=x;
                                end;
                        end;
        until 1>2;
        end;
procedure xuli;
        var
                mid,l,r,kq:longint;
                min:int64;
        begin
        dijkstra(maxT);
        min:=d[n];
        l:=1; r:=maxT;
        repeat
                mid:=(l+r) div 2;
                DijkStra(mid);
                if d[n]=min then begin kq:=mid; r:=mid-1; end
                else l:=mid+1;
        until l>r;
        writeln(kq);
        close(input);
        close(output);
        end;
begin
nhap;
taomang;
xuli;
end.



