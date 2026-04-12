class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var adj: [String: [String]] = [:]
        for ticket in tickets {
            adj[ticket[0], default: []].append(ticket[1])
        }

        for key in adj.keys {
            adj[key]!.sort { $0 > $1 }
        }
        // adj ["JFK": ["HOU", "SEA"], "HOU": ["JFK"], "SEA": ["JFK"]]

        var results = [String]()
        // dfs
        func dfs(_ from: String) {
            while adj[from] != nil && !adj[from]!.isEmpty {
                if let next = adj[from]!.last {
                    adj[from]!.removeLast()
                    dfs(next)
                }
            }
            results.append(from)
        }


        dfs("JFK")
        return results.reversed()
    }
}
