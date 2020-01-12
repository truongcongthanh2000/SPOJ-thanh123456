uses math;
const
    fin='';fon='';
    maxn=trunc(1e5);
type
    mang1=array [0..maxn] of longint;
    mang2=array [0..maxn] of int64;
var
    n,top,test:longint;
    heap:mang1;
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
        readln(n);
        for i:=1 to n do read(a[i]);
        top:=0;
    end;
procedure swap(i,j:longint);
    var
        tam:longint;
    begin
        tam:=heap[i];
        heap[i]:=heap[j];
        heap[j]:=tam;
    end;
procedure UpHeap(i:longint);
    begin
        if (i=1) or (a[heap[i]]>a[heap[i div 2]]) then exit;
        swap(i,i div 2);
        UpHeap(i div 2);
    end;
procedure DownHeap(i:longint);
    var
        j:longint;
    begin
        j:=2*i;
        if j>top then exit;
        if (j<top) and (a[heap[j]]>a[heap[j+1]]) then inc(j);
        if  a[heap[i]]>a[heap[j]] then
            begin
                swap(i,j);
                DownHeap(j);
            end;
    end;
procedure push(x:longint);
    begin
        inc(top);
        heap[top]:=x;
        UpHeap(top);
    end;
function pop:longint;
    begin
        pop:=heap[1];
        heap[1]:=heap[top];
        heap[top]:=0;
        dec(top);
        DownHeap(1);
    end;
procedure init;
    var
        i:longint;
    begin
        for i:=1 to n do push(i);
    end;
procedure solve;
    var
        x,y:longint;
        res:int64;
    begin
        res:=0;
        repeat
            x:=pop;
            y:=pop;
            a[x]:=a[x]+a[y];
            res:=res+a[x];
            push(x);
        until top=1;
        writeln(res);
    end;
procedure xuat;
    var
        i:longint;
    begin
        for i:=1 to test do
            begin
                nhapdulieu;
                init;
                solve;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    xuat;
end.

