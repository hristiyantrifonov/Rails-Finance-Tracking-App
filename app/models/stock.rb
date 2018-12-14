class Stock < ApplicationRecord

  # Because it is class level method (has self. ) that is why we can call it without instance
  def self.new_from_lookup(ticker_symbol)
    # Catch block -- so that we only do stuff if we do not have exception
    begin
      queried_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: queried_stock.company_name, ticker: queried_stock.symbol, last_price: queried_stock.latest_price)
    rescue Exception => e
      return nil
    end
  end

end
