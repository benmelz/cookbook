# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sessions" do
  describe "landing page" do
    before { visit "/" }

    it "says hello" do
      expect(page).to have_text("Hello world")
    end
  end
end
