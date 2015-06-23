#secret = Random.new()
#seed = secret.seed

#Read seed from file
if File.exists?("seed.sec") 
    seed = File.read("seed.sec")
end
secret = Random.new(seed.to_i)
encoded = ""


"Hello".each_char do |c|
    encoded = encoded << (c.ord ^ secret.rand(0..255))
end
puts encoded

#"Decoded"

newSecret = Random.new(seed.to_i)
decoded = ""
encoded.each_char do |c|
    decoded = decoded <<(c.ord ^ newSecret.rand(0..255))
end

puts decoded

