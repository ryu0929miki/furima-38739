class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # addressモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

    def save
      # 各テーブルにデータを保存する処理を書く
      # 購入情報を保存し、変数donationに代入する
      order = Order.create(user_id: user_id, item_id: item_id)
      # 住所を保存する
      #  ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
    end

end