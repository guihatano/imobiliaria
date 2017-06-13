module ApplicationHelper
	def carousel_indicator(carousel)
		if carousel.length == 3
			tag(:li, class: "second-slide", :data => {:target=>"#myCarousel", :slide_to=>"1"})
			tag(:li, class: "third-slide", :data => {:target=>"#myCarousel", :slide_to=>"2"})
		elsif carousel.length == 2
			tag(:li, class: "second-slide", :data => {:target=>"#myCarousel", :slide_to=>"1"})
		end
	end
end
