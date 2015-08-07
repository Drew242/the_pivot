class RandomItemsGenerator < SimpleDelegator

def self.generate(items)
  generated ||= []
  while generated.size <= 3 do
    generated << items.sample
    generated = generated.uniq
  end
  generated
end

end
