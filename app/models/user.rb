class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_validation :set_slug, only: [:create, :update]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_token_authenticatable

  validates :first_name, :last_name, presence: true

  has_many :skills, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :experiences, dependent: :destroy

  # validates :email, uniquness: true
  has_one_attached :photo

  def to_param
    "#{id}-#{slug}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def available?
    self.available
  end

  def switch_available
    self.available? ? self.available = false : self.available = true
  end

  # def profile_finished?
  #   self.skills.empty? || self.projects.empty? || self.experiences.empty? ? false : true
  # end

  def profile_finished?
    skills = self.skills.length
    projects = self.projects.length
    experiences = self.experiences.length

    skills < 2 || projects < 2 || experiences < 2 ? false : true
  end

  def profile_empty?
    self.skills.empty? && self.projects.empty? && self.experiences.empty?
  end

  private

  def set_slug
    self.slug = "#{first_name}_#{last_name}".parameterize
  end
end
