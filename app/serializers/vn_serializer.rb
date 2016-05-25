class VnSerializer < ActiveModel::Serializer
  attributes :name,:image_poster,:vn_url

  # Too much bloat
  # :id,:name,:summary,:release_date,:image_poster,:image_coverpage,:vn_url,
  # 			 :image_1,:image_2,:image_3,:image_4,:rating_number,:trailer_url
 	def vn_url
 		"#{vn_path(object)}"
 	end
end
