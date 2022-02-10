class User < ApplicationRecord
    attr_accessor :remember_token
    has_many :book_cards
    has_many :bill_returns

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    enum genders: ["Male", "Female", "N/A"]
    enum type: [:Employee, :Client]

    validates :name, presence: true, length: {maximum: 50}
    validates :age, presence: true
    validate :age_limit
    validates :email, presence: true, length: {maximum: 255},
        format: { with: VALID_EMAIL_REGEX},
        uniqueness: true
    validates :password, length: {minimum: 6}, allow_nil: true
    has_secure_password

    scope :employees, -> {where(type: 0)}
    scope :clients, -> {where(type: 1)}

    before_save :downcase_email

    class << self
        def digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                            BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost)
        end

        def new_token
            SecureRandom.urlsafe_base64
        end
    end

    def remember
        self.remember_token = User.new_token
        update remember_digest: User.digest(remember_token)
    end

    def forget
        update remember_digest: nil
    end

    def authenticate?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    private

        def age_limit
            if self.age
                age = Date.today.year - self.age.year
                if (age>100 || age<18)
                    errors.add :age, "must be between 18 to 100"
                end
            end
        end

        def downcase_email
            self.email.downcase
        end

end
