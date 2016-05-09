#
# Cookbook Name:: webconfigcrux
# Recipe:: user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Cookbook Name:: webconfigcrux
# Recipe:: user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



dsc_script 'user' do
  code <<-EOH
    Script changeadminname
    {
      SetScript = {
        $user = Get-WMIObject Win32_UserAccount -Filter "Name='#{node['webconfigcrux']['oldname']}'"
        $result = $user.Rename(#{node['webconfigcrux']['newname']})
        $user = [ADSI]"WinNT://./#{node['webconfigcrux']['newname']},user"
        $user.SetPassword(#{node['webconfigcrux']['password']})
        }
      TestScript = {
        $user = Get-WMIObject Win32_UserAccount -Filter "Name='#{node['webconfigcrux']['oldname']}'"
        if($user -eq $null)
        {
         "entered user is not existed."
         $true
        }
        else
        {

          if(#{node['webconfigcrux']['newname']} -eq $user)
           {
             "entered name is same as administrator name."
              $true
           }
          else
          {
            $false
          }
        }
            }
       GetScript = {
            }
    }
    Scriptchangemachinename
    {
     SetScript = {
        Rename-Computer -NewName #{node['webconfigcrux']['computername']}
        "computer name is changed successfully."
       }
     TestScript = {

       $var=$env:COMPUTERNAME
       if($var -eq #{node['webconfigcrux']['computername']})
       {
         "computer name is same as u entered name"
          $true
       }
       else
       {
         $false
       }
      }
     GetScript = {
       }
    }
  EOH
end
