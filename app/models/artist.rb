# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :albums
  has_many :members
  has_many :bands, through: :members
end
