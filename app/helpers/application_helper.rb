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

	def user_empty?
		User.count == 0
	end

	def lightbox_helper(pictures)

		html = '<div class="row">'

		pictures.each_with_index do |picture, index|
			html += <<-HTML
	    <div class="col col-md-auto">
	      #{image_tag(picture.image.url(:thumb), onclick: "openModal();currentSlide(#{index+1})", class: 'hover-shadow')}
	    </div>
	    HTML
	  end

	  # Close div row
	  html << '</div>'

	  # Modal
	  html += <<-HTML
	  <div id="myModal" class="modal">
		  <span class="close cursor" onclick="closeModal()">&times;</span>
		  <div class="modal-content">
	  HTML

	  pictures.each_with_index do |picture, index|
			html += <<-HTML
      <div class="mySlides">
        <div class="numbertext">#{index+1} / #{@realestate.pictures.count}</div>
          #{image_tag(picture.image.url, class: 'modal-image')}
      </div>
      HTML
    end

    html += <<-HTML
			<a class="modal-prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="modal-next" onclick="plusSlides(1)">&#10095;</a>
    HTML

	  # Close div modal
	  html += <<-HTML
			</div>
	  </div>
	  HTML

	  html.html_safe
	end
end
