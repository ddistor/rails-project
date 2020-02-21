# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :albums
  has_many :members
  has_many :bands, through: :members

  validates :name, presence: true, uniqueness: true
  validates :info, presence: true, length: { minimum: 20 }
end
