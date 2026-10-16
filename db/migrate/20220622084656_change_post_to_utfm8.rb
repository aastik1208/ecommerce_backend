class ChangePostToUtfm8 < ActiveRecord::Migration[6.1]
   def up
    execute "ALTER TABLE app_posts CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE app_reviews CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE app_reactions CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
  end

  def down
    execute "ALTER TABLE app_posts CONVERT TO CHARACTER SET utf8 COLLATE utf8_bin"
    execute "ALTER TABLE app_reviews CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE app_reactions CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
  end
end
