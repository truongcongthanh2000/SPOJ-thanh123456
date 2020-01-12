var
	x,y,a:array[1..1000000] of longint;
	bac,rear:array[0..10001] of longint;
	i,j,u,v,n,m:longint;
	f:array[0..10001,0..10001] of boolean;
	used:array[0..10001] of boolean;
begin      

	read(n,m);
	for i:=1 to m do
		begin
			read(x[i],y[i]);
			inc(bac[x[i]]);
			inc(bac[y[i]]);
			f[x[i]][y[i]]:=true;
			f[y[i]][x[i]]:=true;
		end;
	for i:=1 to n do rear[i]:=rear[i-1]+bac[i-1];
	for i:=1 to m do
		begin
			inc(rear[x[i]]);
			inc(rear[y[i]]);
			a[rear[x[i]]]:=y[i];
			a[rear[y[i]]]:=x[i];
		end;
	for i:=1 to n do
	if not used[i] then
		begin
			used[i]:=true;
			for j:=rear[i-1]+1 to rear[i] do
			if not used[a[j]] then
				begin
					for u:=rear[a[j]-1]+1 to rear[a[j]] do
					if not used[a[u]] then
						begin
							for v:=rear[a[u]-1]+1 to rear[a[u]] do
							if not used[a[v]] then
							if a[v]<>i then
							if a[v]<>a[j] then
							if f[a[v]][i] then
								begin
									write(i,' ',a[j],' ',a[u],' ',a[v]);
									halt;
								end;
						end;
				end;
		end;
	write(-1);
end.