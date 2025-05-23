require 'spec_helper'

describe "Taza::Fixtures" do
  before do
    stub_path = File.join(@original_directory, 'spec', 'sandbox', 'fixtures', '')
    Taza::Fixture.stubs(:base_path).returns(stub_path)
    Taza.load_fixtures
    self.class.include(Taza::Fixtures)
  end

  it "should be able to look up a fixture entity off fixture_methods module" do
    expect(examples(:first_example).name).to eql 'first'
  end

  it "should still raise method missing error" do
    expect(lambda { zomgwtf(:first_example) }).to raise_error(NoMethodError)
  end

  # TODO: this test tests what is in entity's instance eval not happy with it being here
  it "should be able to look up a fixture entity off fixture_methods module" do
    expect(examples(:first_example).user.name).to eql users(:shatner).name
  end

  it "should be able to resolve one to many relationships" do
    expect(foos(:gap).examples.length).to eql 2
  end

  it "should be able to get one to many entities" do
    expect(foos(:gap).examples['first_example'].name).to eql 'first'
    expect(foos(:gap).examples['second_example'].name).to eql 'second'
  end

  it "should not be able to access fixtures in sub-folders if not included" do
    expect(lambda { bars(:foo) }).to raise_error(NoMethodError)
  end

  it "should template fixture files" do
    expect(users(:shatner).age).to eql 66
  end

  it "should be able to get one to many entities for hash[key] style" do
    expect(foos(:gap)['examples']['first_example']['name']).to eql 'first'
  end

  it "should be able to access multiple levels inside fixtures" do
    expect(examples(:forth_example).something.user.name).to eql 'William Shatner'
  end

end
