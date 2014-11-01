require 'spec_helper'

describe 'flexget::config' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(:platform => 'debian', :version => '7.5') do |node, server|
      node.set['flexget']['user'] = 'fauxhai'
      # server.create_data_bag('flexget', {
      #   'config' => {
      #     'templates' => {
      #       'global' => 'test',
      #       'tv' => 'test'
      #     },
      #     'tasks' => 'test'
      #   }
      # })
    end
    runner.converge(described_recipe)
  end

  before do
    stub_data_bag_item('flexget', 'config').and_return({
      'templates' => {
          'global' => 'test',
          'tv' => 'test'
        },
        'tasks' => 'test'
      })
  end

  it 'creates config directory' do
    expect(chef_run).to create_directory('/home/fauxhai/.flexget')
  end

  it 'creates a template with attributes' do
      expect(chef_run).to create_template('/home/fauxhai/.flexget/config.yml').with(
        user:   'fauxhai',
        group:  'fauxhai',
        backup: false
      )
  end

end
