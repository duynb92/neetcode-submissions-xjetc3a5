class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var rows = grid.count
        var cols = grid[0].count

        func dfs(_ r: Int, _ c: Int) {
            guard r >= 0, r < rows, c >= 0, c < cols, grid[r][c] == "1" else { return }
            // mark visited
            grid[r][c] = "0"
            dfs(r-1, c)
            dfs(r+1, c)
            dfs(r, c+1)
            dfs(r, c-1)
        }

        var count = 0
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == "1" {
                    dfs(r,c)
                    count += 1
                }
            }
        }

        return count
    }
}
