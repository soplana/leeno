require "leeno/version"
require 'leeno/api/base'
require 'leeno/api/canvas'
require 'leeno/api/history'
require 'leeno/model/base'
require 'leeno/model/canvas'
require 'leeno/model/history'

module Leeno
  class LeenoError < RuntimeError; end
  class DocumentNotFound < LeenoError; end
end
