# frozen_string_literal: true

class Band < ApplicationRecord
  has_many :albums
  has_many :members
  has_many :artists, through: :members
end
