require 'rails_helper'

describe 'usuário registra nova categoria' do
  it 'com sucesso' do
    merchant = create(:merchant)
    login_as(merchant, scope: :merchant)

    post(categories_path, params: { category: { name: 'Eletrônicos' } })

    expect(Category.first.name).to eq 'Eletrônicos'
    expect(response).to redirect_to(categories_path)
  end

  it 'sem sucesso, pois nome deve estar presente' do
    merchant = create(:merchant)
    login_as(merchant, scope: :merchant)

    post(categories_path, params: { category: { name: '' } })

    expect(response).to render_template(:new)
  end
end
