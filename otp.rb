secret = Random.new(1234)
encoded = ""
"Hello".each_char do |c|
    encoded = encoded << (c.ord ^ secret.rand(0..255))
end
puts encoded

#"Decoded"

newSecret = Random.new(1234)
decoded = ""
encoded.each_char do |c|
    decoded = decoded <<(c.ord ^ newSecret.rand(0..255))
end

puts decoded

