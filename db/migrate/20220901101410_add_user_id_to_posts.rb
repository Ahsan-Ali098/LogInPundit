# frozen_string_literal: true

# Adding ID to posts
#
class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
