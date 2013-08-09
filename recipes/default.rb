case node['os']
  when 'linux'
    case node['platform']
      when "ubuntu","debian"
        include_recipe 'git-flow::package'
      else
        include_recipe 'git-flow::bash_installer'
    end
end
