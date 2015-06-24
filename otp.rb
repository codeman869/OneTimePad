#secret = Random.new()
#seed = secret.seed

#OTP Class for basic functionality
class OTP
    def initialize(seed)
        @seed = seed
        @PRNG = Random.new(@seed)
    end
    
    def encode(message)
        encoded = ""
        message.each_char do |c|
            encoded = encoded << XOR(c)
        end
        encoded
    end
    
    
    def decode(cypherText)
        decoded = ""
        cypherText.each_char do |c|
            #puts "decoding #{c}"
            decoded = decoded << XOR(c)
        end
        decoded
    end
    
    private
    
    def XOR(m)
        m.ord ^ @PRNG.rand(0..255)
    end
end


if ARGV[0] == "g"
    seed = Random.new().seed
    f = File.open("seed.sec","w+")
    f.write(seed)
    f.close
elsif ARGV[0] == "e" || ARGV[0] == "d"
    #Read seed from file
    if File.exists?("seed.sec") 
        seed = File.read("seed.sec").to_i
    end
    message = ARGV[1]
    enc_dec = OTP.new(seed)
        
    puts enc_dec.encode(message) if ARGV[0] == "e"
    puts enc_dec.decode(message) if ARGV[0] == "d"
        
else
    
    puts "Please specify an option"
end








