class User < ActiveRecord::Base
  has_many :identities

  def self.create_from_hash!(hash)

    create(:name => hash['info']['name'])
  end
end
