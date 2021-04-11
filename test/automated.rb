require_relative './test_init'

TestBench::Run.(
  'test/automated',
  exclude: %r{_init\.rb\z}
)
