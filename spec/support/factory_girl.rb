require 'factory_girl'
require 'spec_helper'



FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "40charVersion#{n}.0123456789.0123456789.0123456789.0123456789."}
    sequence(:question) { |n| "150charVersion#{n}.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789.0123456789."}
  end

  factory :answer do
    sequence(:description) { |n| "50charVersion#{n}.0123456789.0123456789.0123456789.0123456789.0123456789"}
  #ask how to set it up with a questionid
  end

end
