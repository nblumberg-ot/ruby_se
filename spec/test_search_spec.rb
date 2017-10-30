
describe "Anonymous search with location suggestion" do

  it "gets to the right page one", :cats => true, :slow=> true do
	  @home.search("San Francisco")
	  title = @base.get_title
	  expect(title).to include("Availability!")
  end

end