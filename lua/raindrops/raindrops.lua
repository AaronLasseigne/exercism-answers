return function(n)
  local sound = ''

  if n % 3 == 0 then
    sound = sound .. 'Pling'
  end
  if n % 5 == 0 then
    sound = sound .. 'Plang'
  end
  if n % 7 == 0 then
    sound = sound .. 'Plong'
  end

  if string.len(sound) > 0 then
    return sound
  else
    return tostring(n)
  end
end
