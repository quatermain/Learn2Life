class Article < ActiveRecord::Base
  belongs_to :category

  before_validation :generate_slug
  validates_uniqueness_of :name, :slug

  private

  def generate_slug
    if name_changed? || slug.nil?
      self.slug = name.parameterize
    end
  end
end
