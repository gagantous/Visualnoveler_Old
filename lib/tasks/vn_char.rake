require 'rake'
  desc "Migrate belongs_to to has_many through"
  task :migrate_char => :environment do
    characters = Character.all
    characters.each do |char|
        char_vn = CharacterVn.new(vn_id: char.vn_id,character_id: char.id)
        char_vn.save
      end
  end