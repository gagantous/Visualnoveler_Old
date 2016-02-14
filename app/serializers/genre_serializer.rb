class GenreSerializer < ActiveModel::Serializer
  attributes :id,:name,:genre_url
 	def genre_url
 		"#{genre_path(object)}"
 	end
end
