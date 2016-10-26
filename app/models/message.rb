class Message < ActiveRecord::Base
    #名前は必須入力かつ2文字以上25文字以内
    validates :name,length:{minimum:2,maximum:25},presence:true
    #年齢は0以上
    validates :age,numericality:{greater_than_or_equal_to:0},presence:true
    #内容は必須入力かつ2文字以上
    validates :body,length:{minimum:2},presence:true
end
