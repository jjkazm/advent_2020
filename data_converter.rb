# frozen_string_literal: true

module DataConverter
  def multiline(file, delimiter = nil)
    File.readlines(file).map(&:chomp)
        .map { |el| el == '' ? 'split' : el }
        .join(delimiter).split('split')
  end
end
