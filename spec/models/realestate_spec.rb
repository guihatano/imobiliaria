require 'rails_helper'

RSpec.describe Realestate, type: :model do
  it { should enumerize(:category).in(:rent, :sale, :both) }

  it { should enumerize(:re_type).in(:house, :apartment, :rural, :plot, :shed) }
end
