require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :nom => "MyString",
      :prenom => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input#contact_nom[name=?]", "contact[nom]"

      assert_select "input#contact_prenom[name=?]", "contact[prenom]"

      assert_select "input#contact_email[name=?]", "contact[email]"
    end
  end
end
