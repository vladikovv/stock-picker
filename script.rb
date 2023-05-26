def stock_picker(prices)
  result = []
  max_profit = prices[1] - prices[0]

  prices.each_with_index do |buy_price, buy_index|
    sell_index = buy_index
    potential_sell_days = prices.values_at(buy_index + 1..prices.length - 1)
    potential_sell_days.each do |sell_price|
      sell_index += 1
      potential_profit = sell_price - buy_price
      if potential_profit > max_profit
        max_profit = potential_profit
        result = [buy_index, sell_index]
      end
    end
  end
  result
end

print stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
