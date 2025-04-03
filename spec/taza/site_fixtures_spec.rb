# require 'spec_helper'

#TODO: These tests are breaking as soon as the file loads 
# describe "Site Specific Fixtures" do
#   Taza::Fixture.stubs(:base_path).returns(File.join('.','spec','sandbox','fixtures',''))
#   Taza.load_fixtures
#   include Taza::Fixtures::FooSite

#   it "should be able to access fixtures in sub-folders" do
#     include Taza::Fixtures::FooSite
#     expect(bars(:foo).name).to eql 'foo'
#   end

#   it "should not be able to access non-site-specific fixtures" do
#     expect(lambda{foos(:gap)}).to raise_error(NoMethodError)
#   end
# end
