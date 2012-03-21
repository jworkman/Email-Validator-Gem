
require 'spec_helper'

describe EmailFormatValidator do
	before :each do
		@validator = EmailFormatValidator.new(attributes: {})
		@mock = mock
		@mock.stub!(:errors).and_return([])
		@mock.errors.stub!('[]').and_return({})
		@mock.errors[].stub('<<')
	end

	subject { @validator }

	context 'with a valid, correctly-formatted email address should produce no erros' do

		before { @mock.should_not_receive :errors }
		it { subject.validate_each @mock, 'email', 'l+@test.com' }
		it { subject.validate_each @mock, 'email', 'l@l.eu' }
		it { subject.validate_each @mock, 'email', 'a.b.c.d.e.f.g@example.com' }
		it { subject.validate_each @mock, 'email', 'name@host.example.com' }
		

	end

	context 'with an invalid email should produce an error' do

		before { @mock.errors[].should_receive :<< }
		it { subject.validate_each @mock, 'email', 'name@+.com' }
		it { subject.validate_each @mock, 'email', 'name@+.+' }
		it { subject.validate_each @mock, 'email', '+@example.com' }
		it { subject.validate_each @mock, 'email', 'name@+.com' }
		it { subject.validate_each @mock, 'email', '$*^@@aol.com' }


	end

end
