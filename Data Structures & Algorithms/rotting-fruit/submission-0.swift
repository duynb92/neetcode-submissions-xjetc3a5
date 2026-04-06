class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var fresh = 0
        var queue: [(Int, Int)] = []
        var minutes = 0

        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 2 { queue.append((r,c)) }
                else if grid[r][c] == 1 { fresh += 1 }
            }
        }

        var dirs = [(-1,0), (1, 0), (0, 1), (0, -1)]
        while !queue.isEmpty && fresh > 0 {
            var size = queue.count
            for i in 0..<size {
                let (r,c) = queue.removeFirst()
                for dir in dirs {
                    var nr = r + dir.0
                    var nc = c + dir.1
                    guard nr >= 0, nr < rows, nc >= 0, nc < cols, grid[nr][nc] == 1 else { continue }
                    grid[nr][nc] = 2
                    fresh -= 1
                    queue.append((nr,nc))
                }                
            }
            minutes += 1
        }

        return fresh == 0 ? minutes : -1
    }
}
