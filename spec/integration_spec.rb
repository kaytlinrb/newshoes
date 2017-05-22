

set(:show_exceptions, false)
describe('shoes', {:type => :feature}) do
  it "adds new stores" do
    visit('/')
    click_button('Add New Store')
    fill_in('new_store', :with => 'aldo')
    click_button('Submit')
    expect(page).to have_content('Aldo')
  end
  it "adds and manages shoe creation" do
    visit('/')
    click_button('Add New Store')
    fill_in('new_store', :with => 'aldo')
    click_button('Submit')
    expect(page).to have_content('Aldo')
    click_link('Aldo')
    fill_in('new_brand', :with => 'nike')
    fill_in('price', :with => 5)
    click_button('Add Shoe')
    expect(page).to have_content('Nike')
    expect(page).to have_content('$1.00')
  end
end
