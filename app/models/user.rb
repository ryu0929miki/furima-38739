class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




         with_options presence: true do
          validates :nickname
          validates :birthday
        end
      
       
        validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }, allow_nil: true

      
        with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
          validates :first_name
          validates :family_name
        end
      
        with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
          validates :first_name_kana
          validates :family_name_kana
        end

end
