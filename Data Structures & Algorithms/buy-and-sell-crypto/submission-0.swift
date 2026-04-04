class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minBuy = prices[0]
        var maxProfit = 0
        for price in prices {
            maxProfit = max(maxProfit, price - minBuy)
            minBuy = min(minBuy, price)
        }
        return maxProfit
    }
}
