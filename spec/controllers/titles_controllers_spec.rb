require 'spec_helper'

describe TitlesController do
  before do
    Title.create(name: 'Mayor')
  end

  after do
    Title.destroy_all
  end

  it "allows you to create a new title" do
    visit 'titles/new'
    fill_in('titles[name]', :with=> 'Director')
    click_button('submit')
    expect(current_path).to eq '/titles'
    expect(page).to have_content "Director"

  end

  it "allows you to list all titles" do
    visit '/titles'
    expect(page).to have_content('Mayor')
  end

  it "allows you to see a single title" do
    title = Title.create(:name => "President")
    visit "/titles/#{title.id}"
    expect(page).to have_content('President')
  end

  it "allows you to edit a single title" do
    title = Title.create(:name => "President")
    visit "/titles/#{title.id}/edit"
    fill_in("titles[name]", :with=> "General")
    click_button('submit')
    expect(page).to have_content "General"
  end

  it "allows you to assign multiple figures to a single titles" do 
    title = Title.create(:name => "Cool guys")
    visit "/titles/#{title.id}/edit"
    fill_in("titles[add_figures_by_name]", :with=> "Bob Smith, Tim jones")
    click_button('submit')
    expect(current_path).to eq "/titles/#{title.id}"
    expect(page).to have_content "Bob smith"
    expect(page).to have_content "Tim jones"
  end
end
