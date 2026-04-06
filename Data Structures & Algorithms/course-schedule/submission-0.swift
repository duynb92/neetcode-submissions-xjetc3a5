class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adj: [[Int]] = Array(repeating: [], count: numCourses)
        var inDegree: [Int] = Array(repeating: 0, count: numCourses)

        for pre in prerequisites {
            adj[pre[1]].append(pre[0])
            inDegree[pre[0]] += 1
        }

        var queue = (0..<numCourses).filter { inDegree[$0] == 0 }
        var processed = 0

        while !queue.isEmpty {
            var node = queue.removeFirst()
            processed += 1
            for neighbor in adj[node] {
                inDegree[neighbor] -= 1
                if inDegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }
        return processed == numCourses
    }
}
