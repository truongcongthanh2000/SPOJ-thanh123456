Const
        fi='';
        fo='';
        maxn=6000;
 
Type
        arr1    =array[0..maxn] of longint;
 
Var
        n,le    :longint;
        w       :arr1;
        s       :arr1;
        l       :arr1;
        f       :text;
 
Procedure Nhap;
var
        i       :longint;
begin
        s[0]:=0;
        assign(f,fi);
        reset(f);
        readln(f,n,le);
        for i:=1 to n do
                begin
                        readln(f,w[i]);
                        s[i]:=w[i]+s[i-1];
                end;
        close(f);
end;
 
function max(a,b:longint):longint;
begin
        if a>b then exit(a);
        exit(b);
end;
 
Procedure solution;
var
        i,j     :longint;
        k       :longint;
        u       :longint;
begin
        l[0]:=0;
        w[0]:=0;
        for i:=1 to n do
                begin
                        l[i]:=maxlongint;
                        for j:=i downto 1 do
                                if s[i]-s[j-1]<=le then
                                        begin
                                                k:=le-(s[i]-s[j-1]);
                                                u:=Max(L[j-1],k);
                                                if l[i]>u then l[i]:=u;
                                        end
                                else break;{neu s[j]+s[j+1]+..+s[i]>le thi khong tim nua}
                end;
end;
 
Procedure xuat;
begin
        assign(f,fo);
        rewrite(f);
        write(f,l[n]);
        close(f);
end;
 
begin
        nhap;
        solution;
        xuat;
end.