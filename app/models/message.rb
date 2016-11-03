class Message < ActiveRecord::Base
    #名前は必須入力かつ2文字以上２５文字以内
    validates :name , length: { maximum:25, minimum:2 } ,presence:true
    #内容は必須入力かつ2文字以上1000文字以内
    validates :body , length: { minimum:2, maximum:1000 } ,presence:true
    #年齢は年齢は0以上150以内
    validates :age , numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150 }
end
