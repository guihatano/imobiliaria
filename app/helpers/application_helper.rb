module ApplicationHelper
	def carousel_indicator(carousel)
		if carousel.length == 3
			tag(:li, class: "second-slide", :data => {:target=>"#myCarousel", :slide_to=>"1"})
			tag(:li, class: "third-slide", :data => {:target=>"#myCarousel", :slide_to=>"2"})
		elsif carousel.length == 2
			tag(:li, class: "second-slide", :data => {:target=>"#myCarousel", :slide_to=>"1"})
		end
	end

	def realestates_title(params)
		title = t('realestates')
		if params[:type].present?
			title = t(params[:type], scope: [:enumerize, :realestate, :re_type])
			# trick to pluralize, maybe should be changed in the future
			unless params[:type] == Realestate.re_type.rural
				title << "s"
			end
		end

		if params[:category] == Realestate.category.rent
			title << " " + t('to_rent')
		elsif params[:category] == Realestate.category.sale
			title << " " + t('for_sale')
		end

		title
	end

	def flash_class(level)
		case level
			when 'notice' then "alert alert-info"
			when 'success' then "alert alert-success"
			when 'error' then "alert alert-warning"
			when 'alert' then "alert alert-danger"
			when 'recaptcha_error' then "alert alert-danger"
		end
	end
end
