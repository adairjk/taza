require 'rubygems'
require 'taza/page'

module Foo
  class PartialTheReckoning < ::Taza::Page
    element(:some_element) { :some_element_value }
    element(:other_element) { :other_element_value }
  end
end