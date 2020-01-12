const
    fin='';fon='';
    maxn=trunc(4e18);
var
    x1,y1,x2,y2,x3,y3,x4,y4:array [0..trunc(1e6)] of int64;
    n:longint;
    s1,s2,s3,s4:int64;
function min(a,b:int64):int64;
    begin
        if a<b then exit(a)
        else exit(b);
    end;
function max(a,b:int64):int64;
    begin
        if a>b then exit(a)
        else exit(b);
    end;
procedure nhap;
    var
        i:longint;
        a1,b1,a2,b2,a3,b3,a4,b4:int64;
    begin
        assign(input,fin);reset(input);
        assign(output,fon);rewrite(output);
        readln(N);
        for i:=1 to n do
            begin
                readln(a1,b1,a2,b2,a3,b3,a4,b4);
                x1[i]:=a1-b1;  y1[i]:=a1+b1;
                x2[i]:=a2-b2;  y2[i]:=a2+b2;
                x3[i]:=a3-b3;  y3[i]:=a3+b3;
                x4[i]:=a4-b4;  y4[i]:=a4+b4;
            end;
    end;
procedure taomang;
    var
        i:longint;
        a,b,c,d:int64;
    begin
        s1:=-maxn; s2:=-maxn;
        s3:=maxn; s4:=maxn;
        for i:=1 to n do
            begin
                a:=min(min(min(x1[i],x2[i]),x3[i]),x4[i]);
                b:=min(min(min(y1[i],y2[i]),y3[i]),y4[i]);
                c:=max(max(max(x1[i],x2[i]),x3[i]),x4[i]);
                d:=max(max(max(y1[i],y2[i]),y3[i]),y4[i]);
                if (s1>=c) or (s3<=a) then
                    begin
                        writeln(0);
                        halt;
                    end;
                if (s2>=d) or (s4<=b) then
                    begin
                        writeln(0);
                        halt;
                    end;
                s1:=max(s1,a);   //lx
                s2:=max(s2,b);   //ly
                s3:=min(s3,c);   //rx
                s4:=min(s4,d);   //ry
            end;
    end;
procedure solve;
     var
        kq,x,y:qword;
        ddx,ddy,sc:int64;
     begin
        {if ((s3<=s1+1) and (s4>s2+1)) or ((s4<=s2+1) and (s3>s1+1)) then
                begin
                        writeln(0);
                        exit;
                end;
        x:=s3-s1-1;
        y:=s4-s2-1;
        kq:=x*y;
        if kq<=0 then
            begin
                writeln(0);
                exit;
            end;
        if ((s1 mod 2=0) and (s2 mod 2=0))
                or ((s1 mod 2=1) and (s2 mod 2=1)) then writeln((kq+1) div 2)
        else writeln(kq div 2); }
        inc(s1); inc(s2);
        dec(s3); dec(s4);
        if (s1>s3) or (s2>s4) then
            begin
                writeln(0);
                exit;
            end;
        ddx:=s3-s1+2;
        ddy:=s4-s2+2;
        if ((s1 mod 2)+2) mod 2 <> ((s2 mod 2)+2) mod 2 then
            begin
                sc:=(ddx div 2)*(ddy-1-(ddy div 2));
                ddx:=ddx-1-(ddx div 2);
                ddy:=ddy div 2;
                sc:=ddx*ddy+sc;
                writeln(sc);
            end
        else
            begin
                sc:=(ddx div 2)*(ddy div 2);
                ddx:=ddx-1-(ddx div 2);
                ddy:=ddy-1-(ddy div 2);
                sc:=ddx*ddy+sc;
                writeln(sc);
            end;
     close(input); close(output);
     end;
begin
    nhap;
    taomang;
    solve;
end.
