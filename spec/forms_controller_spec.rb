require 'spec_helper'

describe FormsController do
    it { @type.title.should eql attr[:type] }
    it { @sheet.rating.should eql attr[:sheet] }
end