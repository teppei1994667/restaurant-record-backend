tests = [
  ["test", "test@gmail.com", "Test11111111"],
  ["test2", "test2@gmail.com", "Test22222222"],
  ["test3", "test3@gmail.com", "Test33333333"],
]

tests.each do |name, email, password|
  Test.create(name: name, email: email, password: password)
end