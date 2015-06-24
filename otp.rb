#!/usr/bin/env ruby

#OTP Class for basic functionality
class OTP
    def initialize(seed)
        @seed = seed
        @PRNG = Random.new(@seed)
        
    end
    
    def encode(message)
        encoded = ""
        message.each_char do |c|
            encoded = encoded << (((c.ord ^ @PRNG.rand(32..126)) + 32) % 126)
        end
        encoded
    end
    
    
    def decode(cypherText)
        decoded = ""
        cypherText.each_char do |c|
            decoded = decoded << (((c.ord - 32) % 126) ^ @PRNG.rand(32..126))
        end
        decoded
    end
    
end

puts ARGV[1]
options = ARGV.shift



input_stream = $stdin.read
#puts input_stream

if options == "g"
    seed = Random.new().seed
    f = File.open("seed.sec","w+")
    f.write(seed)
    f.close
elsif options == "e" || options == "d"
    #Read seed from file
    if File.exists?("seed.sec") 
        seed = File.read("seed.sec").to_i
    end
    message = ARGV[1] || input_stream
    enc_dec = OTP.new(seed)
        
    puts enc_dec.encode(message) if options == "e"
    puts enc_dec.decode(message) if options == "d"
        
else
    
    puts "Please specify an option"
end








