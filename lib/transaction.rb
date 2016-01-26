class Transaction
	attr_reader :id
	@@id = 1
	
	@@transactions = []
		
	def initialize(customer, product)
		@customer = customer
		@product = product	
		
		attempt_to_complete_transaction
	end

	def self.all
		@@transactions
	end

	def self.find(id_to_search_for)
		@@transactions.each do |transaction|
			if transaction.id == id_to_search_for
				return transaction
			end		
		end		

	end
	
	def product
		return @product
	end

	def customer
		return @customer
	end
	
	private 
	
	def attempt_to_complete_transaction
		if @product.stock == 0
		    raise OutOfStockError, "'#{product}' is out of stock"
		else
			@product.stock = @product.stock - 1
		
			@id = @@id
			@@id += 1
		
			@@transactions << self
		end	
	end
	
end
