class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet = Set(wordList)
        guard wordSet.contains(endWord) else { return 0 }

        var queue = [beginWord]
        var steps = 1

        while !queue.isEmpty {
            var nextLevel: [String] = []
            for word in queue {
                if word == endWord { return steps }
                var chars = Array(word)
                for i in 0..<chars.count {
                    let original = chars[i]
                    for c in "abcdefghijlkmnopqrstuvxyzw" {
                        if c == original { continue }
                        chars[i] = c
                        let newWord = String(chars)
                        if wordSet.contains(newWord) {
                            nextLevel.append(newWord)
                            wordSet.remove(newWord)
                        }
                        chars[i] = original
                    }
                }
            }

            queue = nextLevel
            steps += 1
        }

        return 0
    }
}
