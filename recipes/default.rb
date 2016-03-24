directory '/var/www' do
  owner 'devel'
  group 'www-data'
  mode '0755'
  action :create
end

ruby_block "require rbenv env variable" do
  block do
    insert = ". /etc/profile"
    path = "/home/devel/.bashrc"

    file = IO.read path
    unless file.match /^#{insert}$/
      IO.write path, insert + "\n" + file
    end
  end
end
