# frozen_string_literal: true

require './lib/components/cache'
require 'pry'

RSpec.describe Cache do
  describe '#put' do
    it 'adds an item to the cache' do
      cache = Cache.new
      cache.put('key', 'value')

      expect(cache.get('key')).to eq('value')
    end

    context 'the item is already in the cache' do
      let(:cache) { Cache.new }
      before { cache.put('key', 'original') }

      it 'overwrites the original value' do
        cache.put('key', 'new')

        expect(cache.get('key')).to eq('new')
      end

      it 'does not change the cache size' do
        expect { cache.put('key', 'new') }.to_not change { cache.size }
      end
    end

    context 'when the expiration type is LRU and the cache is full' do
      let(:cache) { Cache.new(3) }
      before do
        cache.put('first', '1')
        cache.put('second', '2')
        cache.put('third', '3')
      end

      it 'removes the last accessed item when we put a new item' do
        cache.get('third')
        cache.get('first')
        cache.get('second')

        cache.put('fourth', '4')

        expect(cache.get('fourth')).to eq '4'
        expect(cache.get('third')).to be_nil
      end

      it 'removes using FIFO if the items were never accessed' do
        cache.put('fourth', '4')

        expect(cache.get('first')).to be_nil
        expect(cache.get('second')).to eq '2'
        expect(cache.get('third')).to eq '3'
      end
    end
  end

  describe '#get' do
    it 'retrieves an item from the cache' do
      cache = Cache.new
      cache.put('key', 'value')
      expect(cache.get('key')).to eq('value')
    end

    it 'returns nil if the item is not present' do
      cache = Cache.new
      expect(cache.get('key')).to be_nil
    end
  end

  describe '#size' do
    it 'increases when we put an item' do
      cache = Cache.new

      expect { cache.put('key', 'value') }.to change { cache.size }.by(1)
    end
  end
end
