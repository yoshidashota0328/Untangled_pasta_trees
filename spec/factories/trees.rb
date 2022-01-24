# frozen_string_literal: true

FactoryBot.define do
  factory :tree do
    title { 'piyo' }
    description { 'fuga' }
    state { 'public_tree' }
  end
end
