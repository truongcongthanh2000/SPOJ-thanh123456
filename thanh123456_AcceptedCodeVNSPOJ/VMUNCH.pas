const
   fin='';fon='';
var
   i,j,m,n,ra,vao,cn,cm:longint;
   f:array [1..10000,1..10000] of longint;
   a:array [0..10001,0..10001] of char;
   kt:array [1..10000,1..10000] of boolean;
   queue_dong,queue_cot:array [1..10000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m);
   for i:=1 to n do
      begin
      for j:=1 to m do
        begin
          read(a[i,j]);
          if a[i,j]='C' then begin cn:=i; cm:=j; end;
        end;
      readln;
      end;
   end;
procedure push(a,b,c,d:longint);
   begin
   inc(vao);
   queue_dong[vao]:=c;
   queue_cot[vao]:=d;
   f[c,d]:=f[a,b]+1;
   kt[c,d]:=false;
   end;
procedure bfs;
   begin
   fillchar(kt,sizeof(kt),true);
   a[1,1]:='.'; a[cn,cm]:='.';
   queue_dong[1]:=cn; queue_cot[1]:=cm; f[1,1]:=0;
   ra:=0; vao:=1;
   repeat
      inc(ra);
      if ra>vao then exit;
      i:=queue_dong[ra]; j:=queue_cot[ra];
      if (a[i,j]=a[i+1,j]) and (kt[i+1,j]=true) then push(i,j,i+1,j);
      if (a[i,j]=a[i-1,j]) and (kt[i-1,j]=true) then push(i,j,i-1,j);
      if (a[i,j]=a[i,j+1]) and (kt[i,j+1]=true) then push(i,j,i,j+1);
      if (a[i,j]=a[i,j-1]) and (kt[i,j-1]=true) then push(i,j,i,j-1);
   until (ra>vao) or ((queue_dong[vao]=1) and (queue_cot[vao]=1));
   end;
procedure xuat;
   begin
   if ra>vao then writeln(0)
   else writeln(f[1,1]);
   close(input);
   close(output);
   end;
begin
nhap;
bfs;
xuat;
end.
