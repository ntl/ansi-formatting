# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'terminal_output-styling'
  s.version = '0'

  s.authors = ['Nathan Ladd']
  s.homepage = 'https://github.com/ntl/terminal-output-styling'
  s.email = 'nathanladd+github@gmail.com'
  s.licenses = %w(MIT)
  s.summary = "Style text with ANSI escape sequences suitable for terminals"
  s.description = ' '

  s.require_paths = %w(lib)
  s.files = Dir.glob 'lib/**/*'
  s.platform = Gem::Platform::RUBY

  s.add_development_dependency 'test_bench', "~> 1"
end
