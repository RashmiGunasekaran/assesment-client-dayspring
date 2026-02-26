class AddCommentToReviews < ActiveRecord::Migration[8.1]
  def change
    add_column :reviews, :comment, :text
  end
end
