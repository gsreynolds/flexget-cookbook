require 'spec_helper'

describe 'flexget::cron' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(:platform => 'debian', :version => '7.5')
    runner.converge(described_recipe)
  end

  it 'should create flexget cron.d file' do
    expect(chef_run).to create_cron_d('flexget').with(minute: '*/30', hour: '*', user: 'root')
  end

end
