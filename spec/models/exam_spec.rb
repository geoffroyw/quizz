require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { should validate_presence_of :intro_text }
end
