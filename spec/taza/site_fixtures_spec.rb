require 'spec_helper'
describe "Site Specific Fixtures" do

  before do
    Taza::Fixture.stubs(:base_path).returns(File.join(PROJECT_ROOT, 'spec', 'sandbox', 'fixtures', ''))
    Taza.load_fixtures
    include Taza::Fixtures::FooSite
  end

  it "should be able to access fixtures in sub-folders" do
    expect(bars(:foo).name).to eql 'foo'
  end

  it "should not be able to access non-site-specific fixtures" do
    expect(lambda{foos(:gap)}).to raise_error(NoMethodError)
  end
end
