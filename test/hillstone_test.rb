# frozen_string_literal: true

require "minitest/autorun"
require "hillstone"

class HillstoneTest < Minitest::Test
  def test_version_matches_gemspec
    spec = Gem::Specification.load(File.expand_path("../hillstone.gemspec", __dir__))
    assert_equal Hillstone::VERSION, spec.version.to_s
    assert_equal "hillstone", spec.name
  end

  def test_errors_can_be_rescued_as_standard_errors
    assert_operator Hillstone::Error, :<, StandardError
  end

  def test_package_contains_only_library_and_documentation
    spec = Gem::Specification.load(File.expand_path("../hillstone.gemspec", __dir__))
    assert_equal %w[CHANGELOG.md LICENSE README.md lib/hillstone.rb lib/hillstone/version.rb], spec.files.sort
  end
end
