FactoryBot.define do
  factory :user do
    user_name              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    first_name            {'あ'}
    last_name             {'あ'}
    first_kana            {'ア'}
    last_kana             {'ア'}
    birth                 {'2000-1-1'  }
  end
end
