class Post < ApplicationRecord
  acts_as_taggable_on :tags

  # Search method for resources (posts)
  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC')
    end
  end


end
