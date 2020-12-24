# frozen_string_literal: true

App = lambda { |_env|
  [200, { 'Content-Type' => 'text/plain' }, StringIO.new("Hello World!\n")]
}

run App
