const
   fin='';fon='';
var
   top,i,giatrimax,x,dodai,tam:longint;
   c:char;
   heap,a:array [1..1000000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   top:=0;
   end;
procedure doicho(i,j:longint);
   var
      tam:longint;
   begin
   tam:=heap[i];
   heap[i]:=heap[j];
   heap[j]:=tam;
   end;
procedure upHeap(i:longint);
   begin
   if (i=1) or (heap[i]<=heap[i div 2]) then exit;
   doicho(i,i div 2);
   upHeap(i div 2);
   end;
procedure push(x:longint);
   begin
   inc(top);
   heap[top]:=x;
   upheap(top);
   end;
procedure downHeap(i:longint);
   var j:longint;
   begin
   j:=2*i;
   if j>top then exit;
   if (j<top) and (heap[j]<heap[j+1]) then inc(j);
   if heap[i]<heap[j] then doicho(i,j);
   downheap(j);
   end;
procedure pop;
   begin
   heap[1]:=heap[top];
   heap[top]:=0;
   dec(top);
   downHeap(1);
   end;
procedure xuli;
   begin
   while not(eof(input)) do
      begin
      read(c);
      if c='+' then
         begin
         readln(x);
         if top<15000 then push(x);
         end
      else
         begin
         readln;
         if top>0 then
            begin
            giatrimax:=heap[1];
            while (top>0) and (giatrimax=heap[1]) do pop;
            end;
         end;
      end;
   end;
procedure xuat;
   begin
   dodai:=0;
   while top<>0 do
      begin
      tam:=heap[1];
      while (top>0) and (tam=heap[1]) do pop;
      inc(dodai);
      a[dodai]:=tam;
      end;
   writeln(dodai);
   for i:=1 to dodai do writeln(a[i]);
   end;
begin
nhap;
xuli;
xuat;
end.
