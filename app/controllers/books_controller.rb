class BooksController < ApplicationController
  def index
    #表示するためのインスタンス変数に空のModelオブジェクトを作成
    #自動的にcreateアクションのURLへ送信できる
    @book = Book.new
    #テーブルに保存されたデータを全て取得
    @books = Book.all
  end
  
  def create
    #入力されたデータを受け取りローカル変数に格納
    #ビューに渡す必要がないので@はつけない
    book = Book.new(book_params)
    #呼び出したModelインスタンスをデータベースに保存するメソッド
    book.save
    redirect_to '/books/:id'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  #privateより下の記述はアクションとして認識されないのでURLと対応できなくなる
  private
  #フォームから送られてくるデータはparamsに入っており、requireでモデル名を指定、permitで保存を許可するカラムを指定
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
