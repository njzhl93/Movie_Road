require 'spec_helper'

describe "Movies pages" do

  subject { page }

  describe "GET /movies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get movies_path
      response.status.should be(200)
    end
  end

  describe "profile page" do
    let(:movie) { FactoryGirl.create(:movie) }
    before { visit movie_path(movie) }
   
    it { should have_content(movie.name) }
  end

  describe "add page"do
    before { visit new_movie_path }

    it { should have_content('New movie') }
  end

  describe "add" do
  
    before { visit new_movie_path }

    let(:submit) { "" }
  end
end
