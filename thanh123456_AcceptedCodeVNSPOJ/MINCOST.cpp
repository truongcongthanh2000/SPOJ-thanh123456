#include <bits/stdc++.h>
using namespace std;

const int N = 222;
const int INF = INT_MAX;

using namespace std;

int d[N]; int Parent[N];
bool inQ[N];
int cap[N][N], cost[N][N], flow[N][N];
int n, m, S, T;
int minCost, maxFlow;

bool findPath() {
  queue<int> Q;
  for (int i = 1; i <= n; i++) {
    d[i] = INF;
    Parent[i] = 0;
    inQ[i] = 0;
  }
  Q.push(S); inQ[S] = 1; d[S] = 0LL;
  while (!Q.empty()) {
    int u = Q.front(); Q.pop(); inQ[u] = 0;
    for (int v = 1; v <= n; v++) {
        if (flow[u][v] < cap[u][v]) {
          int uv = (flow[u][v] < 0 ? -1 : 1) * cost[u][v];
          if (d[v] > d[u] + uv) {
            d[v] = d[u] + uv;
            Parent[v] = u;
            if (!inQ[v]) {
              inQ[v] = 1;
              Q.push(v);
            }
          }
        }
    }
  }
  return Parent[T] != 0;
}

void incFlow() {
  int delta = INF;
  for (int v = T; v != S; v = Parent[v])
    delta = min(delta, flow[Parent[v]][v] >= 0 ? (cap[Parent[v]][v] - flow[Parent[v]][v]) : -flow[Parent[v]][v]);
  for (int v = T; v != S; v = Parent[v])
    flow[Parent[v]][v] += delta, flow[v][Parent[v]] -= delta;
  maxFlow += delta;
  minCost += d[T] * delta;
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  cin >> n >> m >> maxFlow >> S >> T;
  int u, v;
  for (int i = 0; i < m; i++) {
    cin >> u >> v;
    cin >> cost[u][v] >> cap[u][v];
    cost[v][u] = cost[u][v];
    cap[v][u] = cap[u][v];
  }
  ++n;
  cost[n][S] = 0;
  cap[n][S] = maxFlow;
  int TMP = maxFlow;
  S = n;
  maxFlow = 0;
  while (findPath()) incFlow();
  if (maxFlow < TMP) cout << -1 << endl;
  else {
    n--;
    cout << minCost << endl;
    for (int u = 1; u <= n; u++) for (int v = 1; v <= n; v++)
    if (flow[u][v] > 0)
      cout << u << ' ' << v << ' ' << flow[u][v] << endl;
    cout << "0 0 0\n";
  }
  return 0;
}
