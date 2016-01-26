class Customer
	attr_reader :name
	attr_reader :email_address
	
	@@customers = []

	def initialize(options={})
		@name = options[:name]
		@email_address = options[:email_address]
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
		# return "#{self.name} purchased a #{product.title}"
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
