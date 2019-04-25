# -*- ruby -*-
#
# Copyright (C) 2014-2016 Kouhei Sutou <kou@cozmixng.org>

MRuby::Gem::Specification.new("mruby-slop") do |spec|
  spec.license = "MIT"
  spec.authors = [
    "Kouhei Sutou",
    "Lee Jarvis",
  ]
  spec.version = "4.6.2"
  spec.add_dependency("mruby-array-ext")
  spec.add_dependency("mruby-enumerator")
  spec.add_dependency("mruby-hash-ext")
  spec.add_dependency("mruby-object-ext")
  spec.add_dependency("mruby-onig-regexp")
  spec.add_dependency("mruby-proc-ext")
  spec.add_dependency("mruby-sprintf")
  spec.add_dependency("mruby-string-ext")
  spec.add_dependency("mruby-symbol-ext")
end
