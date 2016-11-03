Rails.application.routes.draw do
  root 'messages#index'
  #resources :messages , only: [:create]     createアクションアクションに関するものだけを生成
  resources :messages , except: [:index, :new]  #index、newアクションアクションに関するもの以外を生成
=begin
  「rake routes」コマンドでroutesの設定を確認できる
  「edit_message」が生成されたことで、editアクションにつながるURLを自動生成するURLヘルパ「edit_message_path」が利用できるようになる
  「show、update、destroy」にも同様に「message_path」が利用できるようになる
=end
end
