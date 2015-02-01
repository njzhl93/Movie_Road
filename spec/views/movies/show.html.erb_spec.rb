require 'spec_helper'

describe "movies/show" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :imdb => "Imdb",
      :name => "Name",
      :director => "Director",
      :actors => "Actors",
      :genre => "Genre",
      :duration => 1,
      :date => "Date",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Imdb/)
    rendered.should match(/Name/)
    rendered.should match(/Director/)
    rendered.should match(/Actors/)
    rendered.should match(/Genre/)
    rendered.should match(/1/)
    rendered.should match(/Date/)
    rendered.should match(/MyText/)
  end
end
