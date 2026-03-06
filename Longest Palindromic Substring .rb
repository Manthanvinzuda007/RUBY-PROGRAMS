def longest_palindrome(s)
  return s if s.length < 2

  start = 0
  max_len = 1

  (0...s.length).each do |i|
    # Odd length palindrome
    l = i
    r = i
    while l >= 0 && r < s.length && s[l] == s[r]
      if (r - l + 1) > max_len
        start = l
        max_len = r - l + 1
      end
      l -= 1
      r += 1
    end

    # Even length palindrome
    l = i
    r = i + 1
    while l >= 0 && r < s.length && s[l] == s[r]
      if (r - l + 1) > max_len
        start = l
        max_len = r - l + 1
      end
      l -= 1
      r += 1
    end
  end

  s[start, max_len]
end

print "Enter a string: "
str = gets.chomp

puts "Longest Palindromic Substring: #{longest_palindrome(str)}"
