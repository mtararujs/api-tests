def get_data
  @test_step.method = "GET"
  @test_step.path = "/api/data"
  @test_step.send_request
  assert_http_code(200)
end
