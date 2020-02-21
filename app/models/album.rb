# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :band, optional: true
  belongs_to :artist, optional: true

  has_many :songs

  validates :name, presence: true, uniqueness: true
  validates :info, presence: true, length: { minimum: 20 }
end
