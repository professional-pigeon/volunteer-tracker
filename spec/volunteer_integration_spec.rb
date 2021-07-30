require "capybara/rspec"
require "./app"
require "pry"
require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('project_title', :with => 'Teaching Kids to Code')
    click_button('Create Project')
    expect(page).to have_content('Teaching Kids to Code')
  end
end

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the project' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    visit '/'
    click_link('Teaching Kids to Code')
    # click_link('Edit Project') Commented out from original test: I put the ability to edit the project on the same page! Sorry!
    fill_in('project_title', :with => 'Teaching Ruby to Kids')
    click_button('Update Project')
    expect(page).to have_content('Teaching Ruby to Kids')
  end
end

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a project' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    id = test_project.id
    visit "/project/#{id}"
    click_button('Delete Project')
    visit '/'
    expect(page).not_to have_content("Teaching Kids to Code")
  end
end

describe 'the volunteer detail page path', {:type => :feature} do
  it 'shows a volunteer detail page' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:name => 'Jasmine', :project_id => project_id, :id => nil})
    test_volunteer.save
    visit "/project/#{project_id}"
    click_link('Jasmine')
    fill_in('name', :with => 'Jane')
    click_button('Update Volunteer')
    expect(page).to have_content('Jane')
  end
end