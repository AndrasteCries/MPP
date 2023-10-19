def generate_password(len)
    password = ""
    len.times do
        code = rand(33..126)
        password << code.chr(Encoding::UTF_8)
    end
    password
end

len = ARGV[0]

puts generate_password(len.to_i)