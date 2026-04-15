class Solution {
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        let cols = board[0].count
        var queue: [(Int,Int)] = []

        // find 'O' border, add to q
        for r in 0..<rows {
            for c in 0..<cols {
                if (r == 0 || r == rows - 1 || c == 0 || c == cols - 1) && board[r][c] == "O" {
                    queue.append((r,c))
                }
            }
        }

        // bfs, mark any found 'O' to 'T' - safe
        let dirs = [(-1,0),(1,0),(0,1),(0,-1)]
        while !queue.isEmpty {
            let (r,c) = queue.removeFirst()
            if board[r][c] == "O" {
                board[r][c] = "T"
                for dir in dirs {
                    let nr: Int = r + dir.0
                    let nc: Int = c + dir.1
                    guard nr >= 0, nr < rows, nc >= 0, nc < cols else { continue }
                    queue.append((nr,nc))
                }
            }
        }

        // flip 'T' back to 'O'
        for r in 0..<rows {
            for c in 0..<cols {
                if board[r][c] == "O" { // surrounded
                    board[r][c] = "X" 
                } else if board[r][c] == "T" { // safe
                    board[r][c] = "O"
                }
            }
        }
    }
}