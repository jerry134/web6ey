require 'spec_helper'

describe Answer do
  let(:answer) { build :answer }

  it "passes validation with all valid informations" do
    expect(answer).to be_valid
  end
end
