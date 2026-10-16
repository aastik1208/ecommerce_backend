module AccountHelper
  def tagged_accounts(item)
    account_details = []
    accounts = Account.where(id: item.tags.pluck(:account_id))
      accounts.each do |acc|
        account_details << {
                          id: acc.id,
                          email: acc.email,
                          firstname: acc.firstname,
                          lastname: acc.lastname,
                          is_influencer: acc.is_influencer
                          }
      end
    return account_details
  end

  def calculate_rating(account)
     account.reviews.present? ? ((account.reviews.pluck(:rating).sum)/(account.reviews.where.not(rating: 0).count).to_f) : 0
  end

  def only_post_count(account)
    account.posts.present? ? calculate_posts(account.items.post_type) : 0
  end

  def calculate_posts(posts)
    posts_ = []
      posts.each do |pst|
        posts_ << pst if (pst.content.post_type == "image" && posts_.exclude?(pst.content))
      end
      return posts_.count
  end

end
