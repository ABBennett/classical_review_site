require 'rails_helper'

describe Vote do
  it { should belong_to(:user) }
  it { should belong_to(:review) }
  it { should have_valid(:up).when(true) }
end
