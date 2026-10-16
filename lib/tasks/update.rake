namespace :update do
  desc "TODO"
  task user: :environment do
    Account.where(magento_id: nil).each do |account|
      if account.email.present?
        magento_user = ActiveRecord::Base.connection.execute("SELECT * from  customer_entity where email= '#{account.email}';").first
        if magento_user.present?
          id = magento_user.first
          puts id
          Account.find(account.id).update_column(:magento_id, id)
        end
      end
    end
  end
end
