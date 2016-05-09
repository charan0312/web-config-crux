# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "yerriswamy"
client_key               "#{current_dir}/yerriswamy.pem"
validation_client_name   "ggkswamy-validator"
validation_key           "#{current_dir}/ggkswamy-validator.pem"
chef_server_url          "https://api.chef.io/organizations/ggkswamy"
cookbook_path            ["#{current_dir}/../cookbooks"]
