class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let rows = heights.count
        let cols = heights[0].count

        let dirs = [(-1,0),(1,0),(0,1),(0,-1)]
        func bfs(_ cells: [(Int,Int)]) -> Set<[Int]>{
            var visited = Set<[Int]>(cells.map { [$0.0, $0.1] })
            var queue = cells
            while !queue.isEmpty {
                let (r,c) = queue.removeFirst()
                for dir in dirs {
                    let nr = r + dir.0
                    let nc = c + dir.1
                    guard nr >= 0, nr < rows, nc >= 0, nc < cols, !visited.contains([nr,nc]), heights[nr][nc] >= heights[r][c] else { continue }
                    visited.insert([nr,nc])
                    queue.append((nr,nc))
                }
            }
            return visited
        }

        var pacCells: [(Int,Int)] = []
        var atlCells: [(Int,Int)] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if r == 0 || c == 0 {
                    pacCells.append((r,c))
                }
                if r == rows - 1 || c == cols - 1 {
                    atlCells.append((r,c))
                }
            }
        }

        let pacs = bfs(pacCells)
        let atls = bfs(atlCells)

        return pacs.filter { atls.contains($0) }
    }
}
