assert("slop - parse - option - nothing") do
  argv = ["path"]
  options = Slop.parse!(argv) do |parser|
  end
  assert_equal(["path"], argv)
end

assert("slop - parse - option - processed") do
  argv = ["--log", "/tmp/log", "path"]
  options = Slop.parse!(argv) do |parser|
    parser.on("--log=", "Log to PATH")
  end
  assert_equal([
                 {
                   :log => "/tmp/log",
                 },
                 ["path"],
               ],
               [
                 options.to_hash,
                 argv,
               ])
end

assert("slop - parse - option - short") do
  argv = ["-l/tmp/log", "path"]
  options = Slop.parse!(argv) do |parser|
    parser.on("-l=", "Log to PATH")
  end
  assert_equal([
                 {
                   :l => "/tmp/log",
                 },
                 ["path"],
               ],
               [
                 options.to_hash,
                 argv,
               ])
end

assert("slop - help") do
  $0 = "test/mrb.rb"
  slop = Slop.new
  slop.on("-l=", "--log=", "Log to PATH")
  assert_equal(<<-HELP.chomp, slop.help)
Usage: mrb [options]
    -l, --log      Log to PATH
  HELP
end
