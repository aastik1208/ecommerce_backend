# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
env :PATH, ENV['PATH']

every 15.minutes do
  runner "Brandsday::ProductJob.perform_later", :output => {:error => 'log/product_sync_error.log', :standard => 'log/product_sync.log'}
  runner "Brandsday::BrandInfoJob.perform_later", :output => {:error => 'log/brand_info_sync_error.log', :standard => 'log/brand_info_sync_sync.log'}
  runner "Brandsday::SellerJob.perform_later", :output => {:error => 'log/seller_sync_error.log', :standard => 'log/seller_sync_sync.log'}

end

every 1.hour do
	runner "Brandsday::VariantJob.perform_later", :output => {:error => 'log/variant_sync_error.log', :standard => 'log/variant_sync_sync.log'}
end