class User < ActiveRecord::Base
  class Options
    class Serializer
      # Here's the problem.
      # Input is expected to be hash (already typecasted).
      # But dependending on when it's called it's not.
      def self.load(hash)
        # The commented line fixes the problem but I think
        # this is not the way it should be done.
        # hash = ActiveRecord::ConnectionAdapters::PostgreSQLColumn.string_to_hstore(hash) if hash.is_a?(String)
        Options.new(hash)
      end

      def self.dump(object)
        object.to_hash
      end
    end

    attr_accessor :background

    def to_hash
      { background: background }
    end

    private

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.background = attributes[:background]
    end
  end

  serialize :options, Options::Serializer
end
