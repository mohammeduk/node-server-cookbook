describe package('nginx') do
  it { should be_installed } # the package should be installed
end

describe service('nginx') do
  it {should be_running}
  it {should be_enabled}
end

describe port(80) do
  it { should be_listening } # should be listening on this port
end

describe npm("pm2") do
  it { should be_installed} # the package should be installed
end

describe package("npm") do
  it { should be_installed } # the package should be installed
end
