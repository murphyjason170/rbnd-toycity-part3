class Customer
	attr_reader :name
	
	@@customers = []

	def initialize(options={})
		@name = options[:name]
	
		add_to_customers
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.each do |customer|
			if customer.name == name
				return customer
			end		
		end		
	end

	def purchase(product)
		Transaction.new(self, product)
	end
	
	private
	
	def add_to_customers

		duplicate_exists = false
		
		@@customers.each do |customer|
			if customer.name == @name
				duplicate_exists = true	
			end		
		end
		
		if duplicate_exists == true
      raise DuplicateCustomerError, "'#{name}' already exists"
		else
			@@customers << self
		end

	end


end
