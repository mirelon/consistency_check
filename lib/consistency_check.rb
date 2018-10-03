require 'consistency_check/version'
require 'consistency_check/runner'

module ConsistencyCheck
  def run_all
    ConsistencyCheck::Definitions.methods(false).map do |method|
      puts "Running #{method}..."
      violations = ConsistencyCheck::Definitions.send method
      max_shown_violations = 5
      first_violations_ids = violations.take(max_shown_violations).map(&:id).join(',')
      optional_ellipsis = violations.to_a.count > max_shown_violations ? '...' : ''
      result = violations.empty? ? 'OK' : "FAIL (#{violations.to_a.count} violations: #{first_violations_ids}#{optional_ellipsis})"
      ConsistencyCheckResult.new(name: method.to_s.camelcase, violations: violations.to_a.count, result: result)
    end
  end

  module_function :run_all
end
