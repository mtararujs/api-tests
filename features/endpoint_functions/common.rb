require 'test-unit'
require "minitest/autorun"
require "test/unit/assertions"
include Test::Unit::Assertions
require 'jsonpath'

def assert_jsonpath_contains(jsonpath, assertion_string)
  parsed_json = JSON.parse(@test_step.response.to_s)
  jsonpath_result = JsonPath.on(parsed_json, jsonpath)
  contains_assertion = jsonpath_result.any? { |result| result.to_s.include?(assertion_string) }
  assert contains_assertion, "Expected JSONPath '#{jsonpath}' to contain '#{assertion_string}', but it did not."
end

def assert_http_code(code)
  assert_equal(code, @test_step.response.code, "HTTP response code does not match.. Expected #{code}, got #{@test_step.response.code}")
end
