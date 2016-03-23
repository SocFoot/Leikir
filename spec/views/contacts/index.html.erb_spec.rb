require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    image_path = File.join(Rails.root,'spec/fixtures','rails.png')
    uploaded_image = Rack::Test::UploadedFile.new image_path, 'image/png'
    assign(:contacts, [
      Contact.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :email => "Email",
        :image => uploaded_image
      ),
      Contact.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :email => "Email",
        :image => uploaded_image
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
