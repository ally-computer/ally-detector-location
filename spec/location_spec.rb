require 'spec_helper'

require_relative '../lib/ally/detector/location'

describe Ally::Detector::Location do
  context 'detect location' do
    it 'simple case' do
      subject.inquiry('02201-2008').detect.should == ['02201-2008']
    end

    it 'where none exists' do
      subject.inquiry('')
        .detect.should == nil
    end
  end
end
