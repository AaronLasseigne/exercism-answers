local CircularBuffer = {}

function CircularBuffer:isFull()
  return #self.buffer >= self.size
end

function CircularBuffer:read()
  assert(#self.buffer > 0, 'buffer is empty')

  return table.remove(self.buffer, 1)
end

function CircularBuffer:write(value)
  assert(not self:isFull(), 'buffer is full')

  table.insert(self.buffer, value)
end

function CircularBuffer:forceWrite(value)
  if self:isFull() then
    self:read()
  end

  self:write(value)
end

function CircularBuffer:clear()
  self.buffer = {}
end

function CircularBuffer:new(size)
  return setmetatable({ buffer = {}, size = size }, { __index = CircularBuffer })
end

return CircularBuffer
