class Post < ActiveRecord::Base

    validates :title, presence: :true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        if self.title
            if self.title.exclude?("Won't Believe" || "Secret" || "Guess" || "Top [number]")
                errors.add(:title, "not clicky enough")
            end
        end
    end
end
