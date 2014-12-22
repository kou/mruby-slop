MRuby::Build.new do |conf|
  toolchain :gcc

  enable_debug

  conf.gembox "default"

  conf.gem :github => "mattn/mruby-onig-regexp"
  conf.gem :github => "kou/mruby-pp"

  conf.gem File.expand_path("..", File.dirname(__FILE__))
end
