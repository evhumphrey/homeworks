require 'sqlite3'
require 'singleton'

class PlaywrightDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end

  class Playwright
    attr_accessor :name, :birth_year

    def self.all
    end

    def self.find_by_name(name)
    end

    def initialize(options)
      @id = options['id']
      @name = options['name']
      @birth_year = options['birth_year']
    end

    def create
    end

    def update
    end

    def get_plays
    end

  end
end
