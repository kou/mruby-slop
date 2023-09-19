# -*- ruby -*-
#
# Copyright (C) 2014-2016 Kouhei Sutou <kou@cozmixng.org>

task :default => :test

config = File.expand_path("config/test.rb")

desc "Checkout mruby"
directory("mruby") do
  sh("git", "clone", "https://github.com/mruby/mruby.git")
end

desc "Run test"
task :test => "mruby" do
  ENV["MRUBY_CONFIG"] = config
  cd("mruby") do
    sh("rake", "all")
    sh("./minirake", "-v", "test")
  end
end

desc "Clean"
task :clean do
  ENV["MRUBY_CONFIG"] = config
  cd("mruby") do
    sh("rake", "clean")
  end
end

desc "Tag"
task :tag do
  /version = \"(.+?)\"/ =~ File.read("mrbgem.rake")
  version = $1
  sh("git", "tag", "-a", "-m", "#{version} has been released!!!", version)
  sh("git", "push", "--tags")
end

desc "Update Slop"
task :update do
  slop_dir = "../slop"
  slop_lib_dir = "#{slop_dir}/lib"
  slop_rb_path = "#{slop_lib_dir}/slop.rb"

  mruby_slop_lib_dir = "mrblib"
  mkdir_p(mruby_slop_lib_dir)
  mruby_slop_rb_path = "#{mruby_slop_lib_dir}/99_slop.rb"
  sub_slop_paths = []
  File.open(slop_rb_path) do |slop_rb_file|
    File.open(mruby_slop_rb_path, "w") do |mruby_slop_rb_file|
      slop_rb_file.each_line do |line|
        case line.chomp
        when /\Arequire '(.+)'\z/
          sub_slop_paths << $1
        else
          mruby_slop_rb_file.print(line)
        end
      end
    end
  end

  sub_slop_paths.each_with_index do |sub_slop_path, i|
    mruby_sub_slop_rb_path =
      "%s/%02d_%s.rb" % [mruby_slop_lib_dir, i, sub_slop_path.gsub("/", "_")]
    cp("#{slop_lib_dir}/#{sub_slop_path}.rb",
       mruby_sub_slop_rb_path)
  end
end
