module RealestatesHelper

	def realestate_price(realestate)

		label = '<strong>'

		if realestate.category == Realestate.category.rent
			label << 'Aluguel:</strong> '
		elsif realestate.category == Realestate.category.sale
			label << 'Preço de venda:</strong> '
		end

		label << number_to_currency(realestate.price).to_s
		label.html_safe
	end
end
