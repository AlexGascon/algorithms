# frozen_string_literal: true

require './lib/problems/h_time_conversion'

RSpec.describe TimeConverter do
  describe '24_hour_time_for' do
    it 'works with 12:01:00PM' do
      expect(TimeConverter.converted_time_for('12:01:00PM')).to eq '12:01:00'
    end

    it 'works with 12:01:00AM' do
      expect(TimeConverter.converted_time_for('12:01:00AM')).to eq '00:01:00'
    end

    it 'works with 07:05:45PM' do
      expect(TimeConverter.converted_time_for('07:05:45')).to eq '19:05:45'
    end
  end
end
