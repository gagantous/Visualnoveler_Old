class DeveloperSerializer < ActiveModel::Serializer
  attributes :id,:name,:developer_url
 	def developer_url
 		"#{genre_path(object)}"
 	end
end
