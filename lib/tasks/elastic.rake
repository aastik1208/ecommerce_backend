namespace :elastic do
    desc "TODO"
    task reindex: :environment do
        begin
            Account.reindex
            Post.reindex
            Item.reindex
        rescue 
            puts "Can't do reindexing"
        end
    end
end