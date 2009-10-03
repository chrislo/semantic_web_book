require 'rubygems'
require 'shoulda'
require 'lib/simple_graph.rb'

class SimpleGraphTest < Test::Unit::TestCase
  context "A SimpleGraph instance" do
    setup do
      @sg = SimpleGraph.new
    end
    
    should "have three indexes" do
      assert @sg.respond_to?(:spo)
      assert @sg.respond_to?(:pos)
      assert @sg.respond_to?(:osp)
    end
    
    context "adding to the index" do
      setup do
        @sg.add('alpha', 'beta', 'charlie')
      end
    
      should "add an entry to the spo index" do
        assert @sg.spo['alpha'].has_key?('beta')
        assert @sg.spo['alpha']['beta'].is_a?(Set)
        assert @sg.spo['alpha']['beta'].include?('charlie')
      end
    
      should "add an entry to the pos index" do
        assert @sg.pos['beta'].has_key?('charlie')
        assert @sg.pos['beta']['charlie'].is_a?(Set)
        assert @sg.pos['beta']['charlie'].include?('alpha')
      end
      
      should "add an entry to the osp index" do
        assert @sg.osp['charlie'].has_key?('alpha')
        assert @sg.osp['charlie']['alpha'].is_a?(Set)
        assert @sg.osp['charlie']['alpha'].include?('beta')
      end
    end
  end
end
