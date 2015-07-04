require 'spec_helper'

describe Movie do
 
  before { @movie = Movie.new(name: "An Open Secret", director: "Amy Berg", image_file_name: "IMG_3582.JPG" ) }
# image_content_type: "image/jpeg", image_file_size: 1226795

  subject { @movie }

  it { should respond_to(:imdb) }
  it { should respond_to(:name) }
  it { should respond_to(:director) }
  it { should respond_to(:actors) }
  it { should respond_to(:genre) }
  it { should respond_to(:duration) }
  it { should respond_to(:date) }
  it { should respond_to(:content) }
  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).allowing('image/png', 'image/jpeg') }
  it { should validate_attachment_size(:image).less_than(5.megabytes) }

  it { should be_valid }

  describe "when image file is not present" do
    before {@movie.image_file_name = "" }
    it { should_not be_valid }
  end

  describe "when image content type is not image/png or image/jpen" do
    before { @movie.image_content_type = "text/xml" }
    it { should_not be_valid }
  end

  describe "when image file size is not less than 5 megabytes" do
    before { @movie.image_file_size = 6000000 }
    it { should_not be_valid }
  end
end
