require 'spec_helper'

describe LandmarksController do
  before do
    Landmark.create(name: 'BQE', year_completed: '1961')
  end

  after do
    Landmark.destroy_all
  end

  it "allows you to create a new landmark" do
    visit 'landmarks/new'
    fill_in('landmarks[name]', :with=> 'Flatiron Bldg')
    click_button('submit')
    expect(current_path).to eq '/landmarks'
    expect(page).to have_content "Flatiron Bldg"

  end

  it "allows you to list all landmarks" do
    visit '/landmarks'
    expect(page).to have_content "BQE"
  end

  it "allows you to see a single landmark" do
    @landmark = Landmark.first
    visit "/landmarks/#{@landmark.id}"
    expect(page).to have_content"#{@landmark.name}"
  end

  it "allows you to edit a single landmark" do
    @landmark = Landmark.first.id
    visit "/landmarks/#{@landmark}/edit"
    fill_in("landmarks[name]", :with=> "NewName")
    click_button('submit')
    expect(page).to have_content "NewName"
  end

end
