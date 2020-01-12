uses math;
const
     fin='';fon='';
     di:Array [1..8] of longint =(-2,-1,1,2,2,1,-1,-2);
     dj:array [1..8] of longint =(1,2,2,1,-1,-2,-2,-1);
var
     top1,top2,n:longint;
     a1,a2,b1,b2:array [0..1000] of longint;
     c:array [0..9,0..9] of int64;
     Hau,Xe,Voi,Ngua:array [0..64,0..64] of boolean;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n);
     end;
procedure taomang;
     var
          i,j,u,v:longint;
     begin
          for i:=1 to n do
               begin
                    readln(u,v,c[u,v]);
                    inc(top1);
                    a1[top1]:=u;
                    b1[top1]:=v;
               end;
          for i:=1 to 8 do
               for j:=1 to 8 do
                    begin
                         if c[i,j]=0 then
                              begin
                                   inc(top2);
                                   a2[top2]:=i;
                                   b2[top2]:=j;
                              end;
                    end;
     end;
Function Cheo1(i,j,u,v:longint):boolean;
     begin
          if i+j=u+v then exit(true)
          else exit(false);
     end;
Function Cheo2(i,j,u,v:longint):boolean;
     begin
          if i-j=u-v then exit(true)
          else exit(false);
     end;
Function Hang(i,j,u,v:longint):boolean;
     begin
          if i=u then exit(true)
          else exit(false);
     end;
Function Cot(i,j,u,v:longint):boolean;
     begin
          if j=v then exit(true)
          else exit(false);
     end;
Function Nhay(i,j,u,v:longint):boolean;
     var
          k:longint;
     begin
          for k:=1 to 8 do
               if (i+di[k]=u) and (j+dj[k]=v) then exit(true);
          exit(false);
     end;
procedure Init;
     var
          i,j:longint;
     begin
          for i:=1 to top1 do
               for j:=1 to top2 do
                    begin
                         if (Cheo1(a1[i],b1[i],a2[j],b2[j])=true) or (Cheo2(a1[i],b1[i],a2[j],b2[j])=true) then
                              begin
                                   Hau[i,j]:=true;
                                   Voi[i,j]:=true;
                              end;
                         if (Hang(a1[i],b1[i],a2[j],b2[j])=true) or (Cot(a1[i],b1[i],a2[j],b2[j])=true) then
                              begin
                                   hau[i,j]:=true;
                                   Xe[i,j]:=true;
                              end;
                         if Nhay(a1[i],b1[i],a2[j],b2[j])=true then
                              Ngua[i,j]:=true;
                    end;
     end;
procedure solve;
     var
          i,j,u,v,k:longint;
          res,s:int64;
     begin
          res:=0;
          for i:=1 to top2 do
               for j:=1 to top2 do
                    begin
                         if i=j then continue;
                         for u:=1 to top2 do
                              begin
                                   if (u=i) or (u=j) then continue;
                                   for v:=1 to top2 do
                                        begin
                                             if (v=i) or (v=j) or (v=u) then continue;
                                             s:=0;
                                             for k:=1 to top1 do
                                                  begin
                                                       if (Hau[k,i]=true) or (Voi[k,j]=true) or (Xe[k,u]=true) or (Ngua[k,v]=true) then
                                                            s:=s+c[a1[k],b1[k]];
                                                  end;
                                             res:=max(res,s);
                                        end;
                              end;
                    end;
          writeln(res);
     close(input); close(output);
     end;
begin
     Nhap;
     TaoMang;
     Init;
     solve;
end.

