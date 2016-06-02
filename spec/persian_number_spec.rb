# -*- coding: UTF-8 -*-

require 'spec_helper'

describe "persian number" do

  it "should convert english numbers ( numeric ) to persian numbers" do
    expect(Persian.number(1000)).to eq("۱۰۰۰")
  end

  it "should convert english numbers (string) to persian numbers" do
    expect(Persian.number("1234567890")).to eq("۱۲۳۴۵۶۷۸۹۰")
  end

  it "should convert arabic numbers to persian numbers" do
    expect(Persian.number("٠١٢٣٤٥٦٧٨٩")).to eq("۰۱۲۳۴۵۶۷۸۹")
  end

  it "should convert arabic and english numbers in strings to persian numbers" do
    expect(Persian.number("عدد 1 و ٥ دو عدد زیبا هستند")).to eq("عدد ۱ و ۵ دو عدد زیبا هستند")
  end
end
