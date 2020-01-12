const
        fin='';fon='';
        maxn=trunc(1e9)+7;
var
        min,i,u,v,n,k,s,t,j:longint;
        a:array [1..4] of longint;
        c:array [1..100,1..100] of longint;
procedure nhap;
        begin
        assign(input,fin);reset(input);
        assigN(output,fon);rewrite(output);
        readln(n);
        for i:=1 to 4 do read(a[i]);
        end;
procedure khoitao;
        begin
        for i:=1 to n do
                begin
                for j:=1 to n do
                        begin
                        if i=j then c[i,j]:=0
                        else c[i,j]:=maxn;
                        end;
                end;
        while not(eof(input)) do
                begin
                read(u,v,c[u,v]);
                c[v,u]:=c[u,v];
                end;
        end;
procedure Floyd;
        begin
        for t:=1 to n do
                for u:=1 to n do
                        for v:=1 to n do
                                begin
                                if c[u,v] > c[u,t] + c[t,v] then
                                        c[u,v]:=c[u,t]+c[t,v];
                                end;
        end;
procedure xuli;
        begin
        min:=maxn;
        for u:=1 to n do
                for v:=u to n do
                        for i:=1 to 3 do
                                for j:=i+1 to 4 do
                                        begin
                                        s:=c[a[i],u]+c[a[j],u]+c[u,v];
                                        for k:=1 to 4 do
                                                begin
                                                if (k<>i) and (k<>j) then s:=s+c[a[k],v];
                                                end;
                                        if s<min then min:=s;
                                        end;
        writeln(min);
        end;
begin
nhap;
khoitao;
Floyd;
xuli;
end.
