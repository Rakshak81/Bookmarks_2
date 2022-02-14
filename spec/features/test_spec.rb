feature 'Test Index Page' do
  scenario 'should have index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end