# frozen_string_literal: true

def start(file)
  load file
end

def start_module(folder, file)
  load "./#{folder}/#{file}.rb"
  include Solution
end
