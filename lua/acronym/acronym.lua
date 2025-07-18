return function(s)
  local to_acronym = function(word)
    return word:sub(1,1):upper()
  end

  local acronym = ''
  for word in s:gmatch('[^%s-]+') do
    if word == word:upper() or not word:match('%u') then
      acronym = acronym .. to_acronym(word)
    else
      for char in word:gmatch('%u') do
        acronym = acronym .. to_acronym(char)
      end
    end
  end
  return acronym
end
