class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var dist = Array(repeating: Int.max, count: n)
        dist[src] = 0

        for _ in 0...k {
            var temp = dist
            for flight in flights {
                let u = flight[0], v = flight[1], w = flight[2]
                if dist[u] != Int.max && dist[u] + w < temp[v] {
                    temp[v] = dist[u] + w
                }
            }
            dist = temp
        }

        return dist[dst] == Int.max ? -1 : dist[dst]
    }
}

// dist = [0, x, x, x]
// dist [0, 200, 300, 500]
// dist []

// dist = [x,0,x]
// dist [100,0,200]


