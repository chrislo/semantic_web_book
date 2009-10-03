require 'set'

class SimpleGraph
  attr_accessor :spo, :pos, :osp
  
  def initialize()
    @spo = {}
    @pos = {}
    @osp = {}
  end
  
  def add(sub, pred, obj)
    add_to_index(@spo, sub, pred, obj)
    add_to_index(@pos, pred, obj, sub)
    add_to_index(@osp, obj, sub, pred)
  end
  
  private
  
  # an index is structured using a hash containing hashes containing
  # sets. The first hash is keyed off the first term, the second off
  # the second term and the set contains the third term.
  def add_to_index(index, a, b, c)
    if !index.has_key? a
      index[a] = {b => Set.new(c)}
    else
      if !index.has_key? b
        index[a][b] = Set.new(c)
      else
        index[a][b].add(c)
      end
    end
  end
end

