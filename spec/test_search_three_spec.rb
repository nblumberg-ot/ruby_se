
describe "Anonymous search with location suggestion three" do

  it "gets to the right page three", :cats => true, :slow=> true do
	  @home.search("San Francisco")
	  title = @base.get_title
	  expect(title).to include("Availability!")
  end

end