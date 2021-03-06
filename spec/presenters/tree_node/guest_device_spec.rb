require 'shared/presenters/tree_node/common'

describe TreeNode::GuestDevice do
  subject { described_class.new(object, nil, {}) }
  let(:object) { FactoryGirl.create(:guest_device, :controller_type => 'foo') }

  include_examples 'TreeNode::Node#key prefix', 'gd-'
  include_examples 'TreeNode::Node#icon', 'product product-network_card'
  include_examples 'TreeNode::Node#tooltip prefix', 'foo Storage Adapter'

  context 'ethernet' do
    let(:object) { FactoryGirl.create(:guest_device_nic) }

    include_examples 'TreeNode::Node#key prefix', 'gd-'
    include_examples 'TreeNode::Node#icon', 'product product-network_card'
    include_examples 'TreeNode::Node#tooltip prefix', 'Physical NIC'
  end
end
