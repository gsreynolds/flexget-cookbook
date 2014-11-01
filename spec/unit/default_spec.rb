require 'spec_helper'

describe 'flexget::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(:platform => 'debian', :version => '7.5')
    runner.converge(described_recipe)
  end

  it 'should include the python::default' do
    expect(chef_run).to include_recipe 'python::default'
  end

  it 'installs the python package' do
    expect(chef_run).to install_package('python')
  end

  it 'installs the flexget pip package' do
    expect(chef_run).to install_python_pip('flexget')
  end
end
