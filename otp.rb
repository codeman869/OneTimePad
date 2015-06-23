#secret = Random.new()
#seed = secret.seed

#Generates a new seed
if ARGV[0] == "g"
    seed = Random.new().seed
    f = File.open("seed.sec","w+")
    f.write(seed)
end

#Read seed from file
if File.exists?("seed.sec") 
    seed = File.read("seed.sec").to_i
end

secret = Random.new(seed)
encoded = ""


"Hello".each_char do |c|
    encoded = encoded << (c.ord ^ secret.rand(0..255))
end
puts encoded

#"Decoded"

newSecret = Random.new(seed)
decoded = ""
encoded.each_char do |c|
    decoded = decoded <<(c.ord ^ newSecret.rand(0..255))
end

puts decoded

