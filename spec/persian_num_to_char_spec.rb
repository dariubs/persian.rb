# -*- coding: UTF-8 -*-

require 'spec_helper'

describe "persian character" do

  it "should convert english numbers to spelled persian characters" do
    expect(Persian.num_to_char(1234)).to eq("یک هزار و دویست و سی و چهار")
  end

end
