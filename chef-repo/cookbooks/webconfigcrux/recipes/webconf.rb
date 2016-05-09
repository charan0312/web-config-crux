#
# Cookbook Name:: crux
# Recipe:: iis
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

dsc_script 'web-Server' do
  code <<-EOH
  WindowsFeature InstallwebServer
  {
    Name = "web-Server"
    Ensure = "Present"
  }
  EOH
end
dsc_script 'web-Asp-Net45' do
  code <<-EOH
  WindowsFeature InstallDotNet45
  {
    Name = "web-Asp-Net45"
    Ensure = "Present"
  }
  EOH
end
dsc_script 'web-Mgmt-Console' do
  code <<-EOH
  WindowsFeature InstallIISConsole
  {
    Name = "web-Mgmt-Console"
    Ensure = "Present"
  }
  EOH
end
