require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    image_path = File.join(Rails.root,'spec/fixtures','rails.png')
    uploaded_image = Rack::Test::UploadedFile.new image_path, 'image/png'
    @contact = assign(:contact, Contact.create!(
      :nom => "Nom",
      :prenom => "Prenom",
      :email => "Email",
      :image => uploaded_image
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Prenom/)
    expect(rendered).to match(/Email/)
  end
end
