FactoryGirl.define do
  factory :recipe do
    name 'Doce de leite'
    cuisine
    type
    preference
    servings 10
    ready_in 10.minutes
    difficulty 'Difícil'
    ingredients '1 lata de leite condensado'
    directions 'Esquente a lata em banho maria por 15 minutos. Espere esfriar e abra a lata'
  end
end
