require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    image_path = File.join(Rails.root,'spec/fixtures','rails.png')
    uploaded_image = Rack::Test::UploadedFile.new image_path, 'image/png'
    @contact = assign(:contact, Contact.create!(
      :nom => "MyString",
      :prenom => "MyString",
      :email => "MyString",
      :image => uploaded_image
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input#contact_nom[name=?]", "contact[nom]"

      assert_select "input#contact_prenom[name=?]", "contact[prenom]"

      assert_select "input#contact_email[name=?]", "contact[email]"
      
      assert_select "input#contact_image[name=?]", "contact[image]"
    end
  end
end
