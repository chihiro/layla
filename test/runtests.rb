outputs = {
  "parsetest" => "true\n"
}

binaries = Dir.entries(File.dirname(__FILE__) + "/bin").select { |entry|
  entry != "." and entry != ".."
}

results = binaries.map { |test|
  (`#{File.dirname(__FILE__)}/bin/#{test}` == outputs[test])
}

puts "Running tests...\nRESULT: #{results.all? ? "[OK]" : "[FAIL]"}"
