require 'rails_helper'

describe 'Usuário vê detalhes de uma categoria' do
  it 'a partir da página inicial' do
    merchant = create(:merchant)
    category = create(:random_category)

    login_as(merchant)
    visit root_path
    click_on 'Categorias'
    click_on "#{category.name}"

    expect(current_path).to eq category_path(category)
    expect(page).to have_content "Detalhes sobre a categoria: #{category.name}"
    expect(page).to have_content 'Status: Ativa'
    expect(page).to have_content 'Subcategorias:'
    expect(page).to have_content 'Não existem subcategorias cadastradas.'
  end

end