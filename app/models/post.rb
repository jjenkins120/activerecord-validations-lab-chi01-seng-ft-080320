class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250,
    too_short: "%{count} characters is too short" }
    validates :summary, length: { maximum: 250,
    too_long: "%{count} characters is too long" }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
  
end


