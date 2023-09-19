MRuby::Build.new do |conf|
  toolchain :gcc

  enable_debug

  conf.gembox "default"

  conf.gem github: "mattn/mruby-onig-regexp",
           checksum_hash: "0af2124b095474bd2897021df669e61eac4743ec"
  conf.gem github: "kou/mruby-pp",
           checksum_hash: "4deddeeef566bbe076391d37dba9986631c2457e"

  conf.gem File.expand_path("..", File.dirname(__FILE__))

  conf.enable_test
end
