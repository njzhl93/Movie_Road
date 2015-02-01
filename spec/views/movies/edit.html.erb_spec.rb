require 'spec_helper'

describe "movies/edit" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :imdb => "MyString",
      :name => "MyString",
      :director => "MyString",
      :actors => "MyString",
      :genre => "MyString",
      :duration => 1,
      :date => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do
      assert_select "input#movie_imdb[name=?]", "movie[imdb]"
      assert_select "input#movie_name[name=?]", "movie[name]"
      assert_select "input#movie_director[name=?]", "movie[director]"
      assert_select "input#movie_actors[name=?]", "movie[actors]"
      assert_select "input#movie_genre[name=?]", "movie[genre]"
      assert_select "input#movie_duration[name=?]", "movie[duration]"
      assert_select "input#movie_date[name=?]", "movie[date]"
      assert_select "textarea#movie_content[name=?]", "movie[content]"
    end
  end
end
