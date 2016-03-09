class VnTypeaheadSerializer < ActiveModel::Serializer
  attributes :name,:image_poster,:vn_url
  			 
 	def vn_url
 		"#{vn_path(object)}"
 	end
end
