class MessagesController < ApplicationController
  def index
    @message = Message.new #Messageモデルオブジェクトの生成
    @messages = Message.all #テーブルからすべてのレコードを取得する
  end
  
  def create
    @message=Message.new(message_params) #message_paramsのでーたを使ってMessageモデルオブジェクトの生成
    if @message.save #生成したモデルオブジェクトをデータベースに保存する。保存できなかったらfalseをかえす
      redirect_to root_path , notice: "メッセージを保存しました" #セッションを使った表示
    else
      #メッセージが保存できなかった場合
      @messages = Message.all #@messagesはMessage.allで複数形だからmessages　@はインスタンス変数　ただのmessagesだとビューにいかない
      flash.now[:alert] = "メッセージの保存に失敗しました" #アラート表示
=begin
  【flash.now[:notice]】 
  現在のリクエストでのみ有効なメッセージを設定する。
  現在のリクエストが終了した時点で、自動的にメッセージは削除される。
  renderで表示する画面にメッセージを表示したい場合に用いる。

  【flash[:notice]】 
  次のリクエストまで有効なメッセージを設定する。
  次のリクエストが終了した時点で、自動的にメッセージは削除される。
  redirect_toした先の画面でメッセージを表示したい場合に用いる。
  renderを使用しているにもかかわらず、flash[:notice]を使用してしまうと、
  1つ先の画面にも同じメッセージが表示されてしまう。
=end
      render "index"
=begin
  【render】
  レタリングするテンプレートを指定する。
  デフォルトはアクション名（コントローラのメソッド名）と同じViewファイルを使用してHTMLを作成するが、
  renderで使いたいViewファイルを指定することができる。
  エラーメッセージ表示のために、元の画面に差し戻す際などに利用する。
    # hogeのViewを指定
    render :action => "hoge"
  【redirect_to】
  リクエストを別のアクションに委譲する。
  つまりクライアントにリダイレクト先URLを返却し、クライアントは再度そのURLにリクエストを上げることになる。
    # hogeアクションに対するリダイレクト先URLを返却する
    redirect_to :action=> "hoge"
  renderがViewを利用するだけなのに対して、
  redirect_toはリダイレクトによる処理の委譲を意味する。
=end
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
=begin
  requireは引数のファイル名のRubyファイルを読み込んで実行するメソッド
  コントローラでNote.new(params[:note])という書き方をしてしまうとどんな値でもセットできてしまうようになるのでセキュリティ上の問題がある。
  そのため保存を許可するカラムを指定する「ストロングパラメータ」というものを使う。requireの引数にparamsのキー、permitの引数に保存を許可するカラムを指定する。 
  そして、許可したカラムのみのハッシュを返すメソッドをprivateメソッドとして定義する。 
=end
  end
end
