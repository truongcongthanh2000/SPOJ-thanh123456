const fi='';
fo='';
var  i,j,n,k,x,y,top,top1,top2,dem:longint;
kt,b:array[0..500,0..500]of boolean;
a:array[0..500,0..500]of longint;
qd2,qd1,qc1,qc2,qd,qc:array[0..round(1e6)]of longint;
procedure nhap;
    begin
        readln(n,k);
        for i:=1 to n do
            for j:=1 to n do a[i,j]:=1;
        for i:=1 to k do
            begin
                readln(x,y);
                a[x,y]:=0;
            end;
    end;
procedure push(xx,yy:longint);
    begin
        inc(top2);
        qd[top2]:=xx;
        qc[top2]:=yy;
        b[xx,yy]:=false;
        if kt[xx,yy]=false then
            begin
            writeln(dem);
            halt;
            end;
    end;
procedure init1;
    begin
        for i:=1 to top1 do
            begin
                qd1[i]:=qd[i];
                qc1[i]:=qc[i];
            end;
    end;
procedure init2;
    begin
        for i:=1 to top2 do
            begin
                qd2[i]:=qd[i];
                qc2[i]:=qc[i];
            end;
    end;
procedure bfs;
    begin
        qd1[1]:=1;
        qc1[1]:=1;
        qd2[1]:=1;
        qc2[1]:=n;
        top1:=1;
        top2:=1;
        repeat
            inc(dem);
            top:=top1;
            top1:=0;
            fillchar(kt,sizeof(kt),true);
            fillchar(b,sizeof(b),true);
            for i:=1 to top do
                begin
                    x:=qd1[i];
                    y:=qc1[i];
                    if (a[x+1,y]=1)and(kt[x+1,y]=true) then
                        begin
                            inc(top1);
                            qd[top1]:=x+1;
                            qc[top1]:=y;
                            kt[x+1,y]:=false;
                        end;
                    if (a[x+1,y+1]=1)and(kt[x+1,y+1]=true) then
                        begin
                            inc(top1);
                            qd[top1]:=x+1;
                            qc[top1]:=y+1;
                            kt[x+1,y+1]:=false;
                        end;
                    if (a[x,y+1]=1)and(kt[x,y+1]=true)  then
                        begin
                            inc(top1);
                            qd[top1]:=x;
                            qc[top1]:=y+1;
                            kt[x,y+1]:=false;
                        end;
                end;
            init1;
            top:=top2;
            top2:=0;
            for i:=1 to top do
                begin
                    x:=qd2[i];
                    y:=qc2[i];
                    if (a[x,y-1]=1)and(b[x,y-1]=true) then push(x,y-1);
                    if (a[x+1,y-1]=1)and(b[x+1,y-1]=true) then push(x+1,y-1);
                    if (a[x+1,y]=1)and(b[x+1,y]=true) then push(x+1,y);
                end;
            init2;
        until 1>2;
    end;
begin
    assign(input,fi);reset(input);
    assign(output,fo);rewrite(output);
        nhap;
        bfs;
    close(input);closE(output);
end.