YARD::Rake::YardocTask.new do |t|
  t.files   = ['app/**/*.rb']   # optional
  t.options = ["-odocs/server"]
end