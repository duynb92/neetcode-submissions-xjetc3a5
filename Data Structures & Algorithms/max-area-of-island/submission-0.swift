class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        var rows = grid.count
        var cols = grid[0].count
        var maxArea = 0
        
        func dfs(_ r: Int, _ c: Int, _ area: inout Int) {
            guard r >= 0, r < rows, c >= 0, c < cols, grid[r][c] == 1 else { return }
            grid[r][c] = 0 // mark visited
            area += 1
            dfs(r+1, c, &area)
            dfs(r-1, c, &area)
            dfs(r, c+1, &area)
            dfs(r, c-1, &area)
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 1 {
                    var area = 0
                    dfs(r,c,&area)
                    maxArea = max(maxArea, area)
                }
            }
        }

        return maxArea
    }
}

// time O(rows*cols)
// space O(rows*cols)
