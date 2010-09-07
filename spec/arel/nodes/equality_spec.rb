module Arel
  module Nodes
    describe 'equality' do
      # FIXME: backwards compat
      describe 'backwards compat' do
        describe 'operator' do
          it 'returns :==' do
            attr = Table.new(:users)[:id]
            left  = attr.eq(10)
            check left.operator.should == :==
          end
        end

        describe 'operand1' do
          it "should equal left" do
            attr = Table.new(:users)[:id]
            left  = attr.eq(10)
            check left.left.should == left.operand1
          end
        end

        describe 'operand2' do
          it "should equal right" do
            attr = Table.new(:users)[:id]
            left  = attr.eq(10)
            check left.right.should == left.operand2
          end
        end
      end

      describe 'or' do
        it 'makes an OR node' do
          attr = Table.new(:users)[:id]
          left  = attr.eq(10)
          right = attr.eq(11)
          node  = left.or right
          check node.left.should == left
          check node.right.should == right
        end
      end

      describe 'and' do
        it 'makes and AND node' do
          attr = Table.new(:users)[:id]
          left  = attr.eq(10)
          right = attr.eq(11)
          node  = left.and right
          check node.left.should == left
          check node.right.should == right
        end
      end
    end
  end
end
