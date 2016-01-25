# lib/product.rb
class Product
	attr_reader :title
	attr_reader :price
	attr_reader :stock
	
	@@products = []
	
	def initialize(options={})
	@title = options[:title]
	@price = options[:price]
	@stock = options[:stock]
	
	add_to_products
	end
	
	def self.all
		@@products
	end


	private
	
	def add_to_products

	duplicate_exists = false
		
		@@products.each do |product|
			if product.title == @title
				duplicate_exists = true	
			end		
		end
		
		if duplicate_exists == true
      raise DuplicateProductError, "'#{title}' already exists"
		else
			@@products << self
		end


	end
	
end


