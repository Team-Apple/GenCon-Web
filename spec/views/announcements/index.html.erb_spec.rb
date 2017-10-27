require 'rails_helper'

RSpec.describe "announcements/index", type: :view do
  before(:each) do
    assign(:announcements, [
      Announcement.create!(),
      Announcement.create!()
    ])
  end

  it "renders a list of announcements" do
    render
  end
end
