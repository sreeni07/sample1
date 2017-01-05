class Product < ActiveRecord::Base
 def self.search(search)
  where("name LIKE ?", "%#{search}%") 
  where("content LIKE ?", "%#{search}%")
 end
 def self.to_csv(options = {})
 	attributes = %w{Name Profile tweets_text Retweets Favourites}
  CSV.generate(headers: true) do |csv|
    csv << attributes
    all.each do |attr|
      csv << attributes.map {|attr| tweet.send(attr)}
    end
  end
 end
end