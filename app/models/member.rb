# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :artist
  belongs_to :band

  validates :artist, presence: true
  validates :band, presence: true
end
