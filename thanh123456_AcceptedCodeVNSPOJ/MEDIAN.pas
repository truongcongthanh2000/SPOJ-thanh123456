const
    fin='';fon='';
    module=65536;
    maxn=trunc(3e6);
type
    mang=array [0..maxn] of longint;
var
    test,n,k,mid,len2,top1,top2:longint;
    a,pos1,pos2,heap1,heap2:mang;
    res:int64;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(test);
    end;
procedure nhapdulieu;
    var
        i:longint;
        seed,mul,add,x:int64;
    begin
        top1:=0;
        top2:=0;
        for i:=1 to n do
            begin
                pos1[i]:=0;
                pos2[i]:=0;
                heap1[i]:=0;
                heap2[i]:=0;
                a[i]:=0;
            end;
        readln(seed,mul,add,n,k);
        a[1]:=seed;
        for i:=2 to n do
            begin
                x:=(a[i-1]*mul) mod module;
                a[i]:=(x+add) mod module;
            end;
    end;
procedure swap1(i,j:longint);    ///heap1: min
    var
        tam:longint;
    begin
        tam:=heap1[i];
        heap1[i]:=heap1[j]; pos1[heap1[i]]:=i;
        heap1[j]:=tam; pos1[heap1[j]]:=j;
    end;
procedure UpHeap1(i:longint);
    begin
        if (i=1) or (a[heap1[i]]<a[heap1[i div 2]]) then exit;
        swap1(i,i div 2);
        UpHeap1(i div 2);
    end;
procedure DownHeap1(i:longint);
    var
        j:longint;
    begin
        j:=2*i;
        if j>top1 then exit;
        if (j<top1) and (a[heap1[j]]<a[heap1[j+1]]) then inc(j);
        if a[heap1[i]] < a[heap1[j]] then
            begin
                swap1(i,j);
                DownHeap1(j);
            end;
    end;
procedure push1(x:longint);
    begin
        inc(top1);
        heap1[top1]:=x;
        pos1[x]:=top1;
        UpHeap1(top1);
    end;
function get1:longint;
    begin
        exit(heap1[1]);
    end;
procedure pop1(i:longint);
    begin
        pos1[heap1[i]]:=0;
        if i=top1 then
            begin
                heap1[top1]:=0;
                dec(top1);
                exit;
            end;
        heap1[i]:=heap1[top1];
        pos1[heap1[i]]:=i;
        heap1[top1]:=0;
        dec(top1);
        UpHeap1(i);
        DownHeap1(i);
    end;
procedure delete1(dinh:longint);
    var
        x:longint;
    begin
        x:=pos1[dinh];
        if x=0 then exit;
        pop1(x);
    end;
procedure swap2(i,j:longint);    ///heap2: max
    var
        tam:longint;
    begin
        tam:=heap2[i];
        heap2[i]:=heap2[j]; pos2[heap2[i]]:=i;
        heap2[j]:=tam; pos2[heap2[j]]:=j;
    end;
procedure Upheap2(i:longint);
    begin
        if (i=1) or (a[heap2[i]] > a[heap2[i div 2]]) then exit;
        swap2(i,i div 2);
        Upheap2(i div 2);
    end;
procedure Downheap2(i:longint);
    var
        j:longint;
    begin
        j:=2*i;
        if j>top2 then exit;
        if (j<top2) and (a[heap2[j]] > a[heap2[j+1]]) then inc(j);
        if a[heap2[i]] > a[heap2[j]] then
            begin
                swap2(i,j);
                Downheap2(j);
            end;
    end;
procedure push2(x:longint);
    begin
        inc(top2);
        heap2[top2]:=x;
        pos2[x]:=top2;
        Upheap2(top2);
    end;
function get2:longint;
    begin
        exit(heap2[1]);
    end;
procedure pop2(i:longint);
    begin
        pos2[heap2[i]]:=0;
        if i=top2 then
            begin
                heap2[top2]:=0;
                dec(top2);
                exit;
            end;
        heap2[i]:=heap2[top2];
        pos2[heap2[i]]:=i;
        heap2[top2]:=0;
        dec(top2);
        Upheap2(i);
        Downheap2(i);
    end;
procedure delete2(dinh:longint);
    var
        x:longint;
    begin
        x:=pos2[dinh];
        if x=0 then exit;
        pop2(x);
    end;
procedure init;
    var
        i,dinh:longint;
    begin
        mid:=(k+1) div 2;
        len2:=k div 2;
        for i:=1 to mid do
            push1(i);
        for i:=mid+1 to k do
            begin
                dinh:=get1;
                if a[i]<a[dinh] then
                    begin
                        delete1(dinh);
                        push1(i);
                        push2(dinh);
                    end
                else push2(i);
            end;
        res:=a[get1];
    end;
procedure solve;
    var
        i:longint;
    begin
        a[0]:=maxlongint;
        for i:=k+1 to n do
            begin
                delete1(i-k);
                delete2(i-k);
                if top1 < mid then
                    begin
                        if a[get2] < a[i] then
                            begin
                                push1(get2);
                                delete2(get2);
                                push2(i);
                            end
                        else push1(i);
                    end
                else
                    begin
                        if a[get1] > a[i] then
                            begin
                                push2(get1);
                                delete1(get1);
                                push1(i);
                            end
                        else push2(i);
                    end;
                res:=res+int64(a[get1]);
            end;
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
                write('Case #',i,': ');
                solve;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    xuat;
end.
