
#include<bits/stdc++.h>
using namespace std;

struct DinicFlow {
    static const long long oo = 1e13;
    int numNode, numEdge;
    vector<int> dist, head, work;
    vector<long long> flow, capa;
    vector <int> next,point;

    DinicFlow(int n = 0) {
        numNode = n;
        numEdge = 0;
        dist.assign(n + 7, 0);
        head.assign(n + 7, -1);
        work.assign(n + 7, 0);
    }

    int addEdge(int u, int v, int c1, int c2) {
        int ret = numEdge;
        point.push_back(v); capa.push_back(c1); flow.push_back(0); next.push_back(head[u]); head[u] = numEdge++;
        point.push_back(u); capa.push_back(c2); flow.push_back(0); next.push_back(head[v]); head[v] = numEdge++;
        return ret;
    }

    bool bfs(int s, int t) {
        queue<int> q;
        for (int i = 1; i <= numNode; i++) dist[i] = -1;
        dist[s] = 0; q.push(s);
        while (!q.empty()) {
            int u = q.front(); q.pop();
            for (int i = head[u]; i >= 0; i = next[i]) if (flow[i] < capa[i] && dist[point[i]] < 0) {
                dist[point[i]] = dist[u] + 1;
                q.push(point[i]);
            }
        }
        return dist[t] >= 0;
    }
    long long dfs(int s, int t, long long f) {
        if (s == t) return f;
        for (int &i = work[s]; i >= 0; i = next[i]) if (flow[i] < capa[i] && dist[point[i]] == dist[s] + 1) {
            long long d = dfs(point[i], t, min(f, capa[i] - flow[i]));
            if (d > 0) {
                flow[i] += d;
                flow[i ^ 1] -= d;
                return d;
            }
        }
        return 0;
    }

    long long maxFlow(int s, int t) {
        for (int i = 1; i <= numNode; i++) flow[i] = 0;
        long long totFlow = 0;
        while (bfs(s, t)) {
            for (int i = 1; i <= numNode; i++) work[i] = head[i];
            while (true) {
                long long oo = 1e14;
                long long d = dfs(s, t, oo);
                if (d == 0) break;
                totFlow += d;
            }
        }
        return totFlow;
    }

    long long getFlow(int id) const {
        return flow[id];
    }
};

int main(void) {
    int n, m, src, snk; cin >> n >> m ;
    src = 1; snk = n;
    DinicFlow df(n);
    for (int love = 0; love < m; love++) {
        int u, v, c; cin >> u >> v >> c;
        df.addEdge(u, v, c ,c);
    }
    cout << df.maxFlow(src, snk) << endl;
    return 0;
}
