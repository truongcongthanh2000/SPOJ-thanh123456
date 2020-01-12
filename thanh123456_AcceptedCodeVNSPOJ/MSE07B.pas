uses math;
const
    fin='';fon='';
    maxn=trunc(1e6);
type
    mang=array [0..maxn] of longint;
var
    top1,top2,count1,count2:longint;
    heap1,heap2,pos1,pos2,d1,d2,maso1,maso2:mang;
procedure nhap;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
    end;
procedure swap1(i,j:longint);
    var
        tam:longint;
    begin
        tam:=heap1[i];
        heap1[i]:=heap1[j]; pos1[heap1[i]]:=i;
        heap1[j]:=tam; pos1[heap1[j]]:=j;
    end;
procedure UpHeap1(i:longint);            //heap1 : min
    begin
        if (i=1) or (d1[heap1[i]]>d1[heap1[i div 2]]) then exit;
        swap1(i,i div 2);
        UpHeap1(i div 2);
    end;
procedure DownHeap1(i:longint);
    var
        j:longint;
    begin
        j:=2*i;
        if j>top1 then exit;
        if (j<top1) and (d1[heap1[j]]>d1[heap1[j+1]]) then inc(j);
        if d1[heap1[i]]>d1[heap1[j]] then
            begin
                swap1(i,j);
                DownHeap1(j);
            end;
    end;
procedure push1(x,y:longint);
    begin
        inc(count1);
        inc(top1);
        heap1[top1]:=count1;
        maso1[count1]:=x;
        pos1[count1]:=top1;
        d1[count1]:=y;
        UpHeap1(top1);
    end;
function get1:longint;
    begin
        get1:=heap1[1];
        pos1[get1]:=0;
        heap1[1]:=heap1[top1];
        pos1[heap1[1]]:=1;
        heap1[top1]:=0;
        dec(top1);
        DownHeap1(1);
    end;
procedure pop1(dinh:longint);
    var
        x:longint;
    begin
        x:=pos1[dinh];
        pos1[dinh]:=0;
        if x<top1 then
            begin
                heap1[x]:=heap1[top1];
                pos1[heap1[x]]:=x;
            end;
        heap1[top1]:=0;
        dec(top1);
        x:=min(x,top1);
        UpHeap1(max(1,x));
        DownHeap1(x);
    end;
procedure swap2(i,j:longint);
    var
        tam:longint;
    begin
        tam:=heap2[i];
        heap2[i]:=heap2[j]; pos2[heap2[i]]:=i;
        heap2[j]:=tam; pos2[heap2[j]]:=j;
    end;
procedure UpHeap2(i:longint);            //heap2 : max
    begin
        if (i=1) or (d2[heap2[i]]<d2[heap2[i div 2]]) then exit;
        swap2(i,i div 2);
        UpHeap2(i div 2);
    end;
procedure Downheap2(i:longint);
    var
        j:longint;
    begin
        j:=2*i;
        if j>top2 then exit;
        if (j<top2) and (d2[heap2[j]]<d2[heap2[j+1]]) then inc(j);
        if d2[heap2[i]]<d2[heap2[j]] then
            begin
                swap2(i,j);
                Downheap2(j);
            end;
    end;
procedure push2(x,y:longint);
    begin
        inc(count2);
        inc(top2);
        heap2[top2]:=count2;
        maso2[count2]:=x;
        pos2[count2]:=top2;
        d2[count2]:=y;
        UpHeap2(top2);
    end;
function get2:longint;
    begin
        get2:=heap2[1];
        pos2[get2]:=0;
        heap2[1]:=heap2[top2];
        pos2[heap2[1]]:=1;
        heap2[top2]:=0;
        dec(top2);
        Downheap2(1);
    end;
procedure pop2(dinh:longint);
    var
        x:longint;
    begin
        x:=pos2[dinh];
        pos2[dinh]:=0;
        if x<top2 then
            begin
                heap2[x]:=heap2[top2];
                pos2[heap2[x]]:=x;
            end;
        heap2[top2]:=0;
        dec(top2);
        x:=min(x,top2);
        UpHeap2(max(1,x));
        Downheap2(x);
    end;
procedure solve;
    var
        i,x,y,dinh:longint;
        c:char;
    begin
        top1:=0;
        top2:=0;
        count1:=0;
        count2:=0;
        maso1[0]:=0;
        maso2[0]:=0;
        while not(eof(input)) do
            begin
                read(c);
                if c='1' then
                    begin
                        readln(x,y);
                        push1(x,y);
                        push2(x,y);
                    end
                else
                if c='3' then  //min
                    begin
                        readln;
                        if top1=0 then
                            begin
                                writeln(0);
                                continue;
                            end;
                        dinh:=get1;
                        writeln(maso1[dinh]);
                        pop2(dinh);
                    end
                else
                if c='2' then ///max
                    begin
                        readln;
                        if top2=0 then
                            begin
                                writeln(0);
                                continue;
                            end;
                        dinh:=get2;
                        writeln(maso2[dinh]);
                        pop1(dinh);
                    end
                else break;
            end;
        close(input); close(output);
    end;
begin
    nhap;
    solve;
end.




