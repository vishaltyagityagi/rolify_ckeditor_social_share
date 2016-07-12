namespace :check_user do
    desc "Add Credits in User Account Based on Subscription (Basic, Standard, Professional) and Check User Subscription of 1 year"
        task credits_and_subscription: :environment do
        begin
         puts "==============Check Long Term Data Storage"
         rescue => e
             Rails.logger.info "Check Long Term Data Storage: #{e}"
        end
    end
      end