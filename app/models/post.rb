class Post < ApplicationRecord
  has_many :favorites
  acts_as_taggable_on :tags

  # Search method for resources (posts)
  def self.search(term)
    results = []
    if term
      results << where('lower(title) LIKE ?', "%#{term.downcase}%").order('id DESC')
      results << self.tagged_with([term], wild: true,:any => true)
    else
      results << order('id DESC')
    end
    # Since we're getting multi-dimensional arrays
    results.flatten
  end


end
