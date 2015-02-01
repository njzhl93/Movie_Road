require 'spec_helper'

describe "movies/index" do
  before(:each) do
    assign(:movies, [
      stub_model(Movie,
        :imdb => "Imdb",
        :name => "Name",
        :director => "Director",
        :actors => "Actors",
        :genre => "Genre",
        :duration => 1,
        :date => "Date",
        :content => "MyText"
      ),
      stub_model(Movie,
        :imdb => "Imdb",
        :name => "Name",
        :director => "Director",
        :actors => "Actors",
        :genre => "Genre",
        :duration => 1,
        :date => "Date",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of movies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Imdb".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Director".to_s, :count => 2
    assert_select "tr>td", :text => "Actors".to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
