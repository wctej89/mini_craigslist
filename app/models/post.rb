class Post < ActiveRecord::Base
  belongs_to :category
  after_create :generate_secret_key

  validates :email, :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/}
  validates_presence_of :title, :description
  validates_numericality_of :price
  # validates_presence_of :key
  # validates_uniqueness_of :key 

  # Remember to create a migration!

  def generate_secret_key
    # begin 
      self.key = SecureRandom.hex(10)
    # end.while self.class.exists?(:key => self.key)
      self.save
  end


end
