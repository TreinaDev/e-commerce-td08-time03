require 'rails_helper'

describe 'Usuário finaliza compra' do
  it 'a partir do carrinho de compras' do
    customer = create(:customer)
    product = create(:product_model, name: 'Notebook', status: 'enabled')
    second_product = create(:product_model, name: 'TV', status: 'enabled')
    first_price = create(:product_price, product_model: product, price: 300.99, start_date: Date.today, end_date: 100.day.from_now)
    second_price = create(:product_price, product_model: second_product, price: 500.99, start_date: Date.today, end_date: 100.day.from_now)
    first_item = create(:product_item, customer: customer, product_model: product)
    second_item = create(:product_item, customer: customer, product_model: second_product)

    login_as(customer, scope: :customer)
    visit root_path
    click_on 'Meu carrinho'
    click_on 'Finalizar pedido'
    click_on 'Confirmar'

    expect(page).to have_content 'Pedido realizado com sucesso'
    expect(page).to have_content 'Pedidos realizados'
    expect(page).to have_content 'Código do pedido'
    expect(page).to have_content 'Status do pedido'
    expect(page).to have_content "#{first_item.name}"
    expect(page).to have_content "#{second_item.name}"
    expect(page).to have_content "#{first_item.quantity}"
    expect(page).to have_content "#{second_item.quantity}"
  end
end
