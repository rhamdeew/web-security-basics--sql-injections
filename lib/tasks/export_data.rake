namespace :export do
  desc "Export admins"
  task :export_to_seeds => :environment do
    Admin.all.each do |admin|
      excluded_keys = ['created_at', 'updated_at', 'id']
      admin_hash = admin.attributes.except(*excluded_keys)
      puts "Admin.create(#{admin_hash})"
    end
  end
end