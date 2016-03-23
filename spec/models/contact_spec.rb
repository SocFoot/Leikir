require 'rails_helper'
require "paperclip/matchers"

RSpec.describe Contact, type: :model do
  
  RSpec.configure do |config|
    config.include Paperclip::Shoulda::Matchers
  end

  image_path = File.join(Rails.root,'spec/fixtures','rails.png')
  uploaded_image = Rack::Test::UploadedFile.new image_path, 'image/png'
  
  describe "good contact" do
    it "create should pass" do
      Contact.create!(
        prenom: "toto",
        nom: "tata",
        email: "az@g.com",
        image: uploaded_image
      ).valid?
    end
  end

  describe "validation attributes" do
    it "should include the :prenom attribute" do
      expect(Contact.new.attributes).to include("prenom")
    end

    it "should include the :nom attribute" do
      expect(Contact.new.attributes).to include("nom")
    end
    
    it "should include the :email attribute" do
      expect(Contact.new.attributes).to include("email")
    end
  end

  describe "vaidation association" do
    describe Contact do
      it { expect(Contact).to have_attached_file(:image) }
      it { expect(Contact).to validate_attachment_presence(:image) }
      it { expect(Contact).to validate_attachment_content_type(:image).
          allowing('image/png', 'image/jpeg') }
    end
  end
end
