assert("slop - parse - option - nothing") do
  argv = ["path"]
  options = Slop.parse(argv) do |parser|
  end
  assert_equal(["path"], options.arguments)
end

assert("slop - parse - option - processed") do
  argv = ["--log", "/tmp/log", "path"]
  options = Slop.parse(argv) do |parser|
    parser.string("--log", "Log to PATH")
  end
  assert_equal([
                 {
                   :log => "/tmp/log",
                 },
                 ["path"],
               ],
               [
                 options.to_hash,
                 options.arguments,
               ])
end

assert("slop - parse - option - short") do
  argv = ["-l", "/tmp/log", "path"]
  options = Slop.parse(argv) do |parser|
    parser.string("-l", "Log to PATH")
  end
  assert_equal([
                 {
                   :l => "/tmp/log",
                 },
                 ["path"],
               ],
               [
                 options.to_hash,
                 options.arguments,
               ])
end

assert("slop - to_s") do
  $0 = "test/mrb.rb"
  options = Slop::Options.new do
  end
  options.string("-l", "--log", "Log to PATH")
  assert_equal(<<-HELP, options.to_s)
usage: test/mrb.rb [options]
    -l, --log  Log to PATH
  HELP
end
