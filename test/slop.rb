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
