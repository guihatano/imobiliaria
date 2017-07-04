require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should have a name' do
  	name = "Imobiliária"
  	name.should_not be nil
  end

  it "expect to save without error when name and email are filled" do
  	subject.name = "Imob"
  	subject.email = "email@email.com"
    expect { subject.save! }.to_not raise_error
  end

  context 'raises an error' do
	  it 'if saved without a name' do
	  	subject.email = "email@email.com"
	    expect { subject.save! }.to raise_error(
	      ActiveRecord::RecordInvalid
	    )
	  end

	  it 'if saved without an email' do
	  	subject.name = "Imob"
	    expect { subject.save! }.to raise_error(
	      ActiveRecord::RecordInvalid
	    )
	  end
  end
end
