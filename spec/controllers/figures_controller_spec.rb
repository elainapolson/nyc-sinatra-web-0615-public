require 'spec_helper'

describe FiguresController do

  before do
    Figure.create(name: 'Peter Stuyvesant', add_titles_by_name: 'Director, General')
  end

  after do
    Figure.destroy_all
  end

  it "allows you to create a new figure" do
    visit 'figures/new'
    fill_in('figures[name]', :with=> 'Benjamin Franklin')
    fill_in('figures[add_titles_by_name]', :with=> 'American, Badass')
    click_button('submit')
    expect(current_path).to eq '/figures'
    expect(page).to have_content "Benjamin Franklin"
  end

  it "allows you to list all figures" do
    visit '/figures'
    expect(page).to have_content "Peter Stuyvesant"
  end

  it "allows you to see a single figure" do
    figure = Figure.create(:name => "Bob")
    visit "/figures/#{figure.id}"
    expect(page).to have_content"Bob"
  end

  it "allows you to edit a single figure" do
    figure = Figure.create(:name => "Bob")
    visit "/figures/#{figure.id}/edit"
    fill_in("figures[name]", :with=> "Bobby")
    click_button('submit')
    expect(page).to have_content("Bobby")
  end

  it "allows you to assign multiple titles to a single figure" do 
    figure = Figure.create(:name => "Jack")
    visit "/figures/#{figure.id}/edit"
    fill_in("figures[add_titles_by_name]", :with=> "Title1, Title2")
    click_button('submit')
    expect(current_path).to eq "/figures/#{figure.id}"
    expect(page).to have_content "Title1"
    expect(page).to have_content "Title2"
  end

end
