class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var adj: [[(Int,Int)]] = Array(repeating: [], count: n)
        for time in times {
            adj[time[0]-1].append((time[1]-1, time[2]))
        }

        var dist = Array(repeating: Int.max, count: n)
        dist[k-1] = 0

        var minHeap = [(Int,Int)]()
        minHeap.append((0,k-1))

        while !minHeap.isEmpty {
            minHeap.sort { $0 < $1 }
            let (d, u) = minHeap.removeFirst()

            if d > dist[u] { continue }

            for (v, w) in adj[u] {
                let newDist = d + w
                if newDist < dist[v] {
                    dist[v] = newDist
                    minHeap.append((newDist, v))
                }
            }
        }

        var result = 0
        for d in dist {
            if d == Int.max { return -1 }
            result = max(result, d)
        }
        return result
    }
}

// adj [1: [(2,1), (4,4)], 2: [(3,1)], 3: [(4,1)]]
// adj [0: [(1,1), (3,4)], 1: [(2,1)], 2: [(3,1)]]
// dist [0, x, x, x]
// heap [(0,0)]
// dist [0,1,x,4]
// heap [(1,1), (4,3)]
// dist [0,1,2,4]
// heap [(2,2), (4,3)]
// dist [0,1,2,3]
// heap [(4,3)]

