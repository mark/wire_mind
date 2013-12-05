module WireMind

  class Memory

    ################
    #              #
    # Declarations #
    #              #
    ################

    MIN_LENGTH = 10

    ###############
    #             #
    # Constructor #
    #             #
    ###############

    def initialize(initial_length = MIN_LENGTH)
      @cells = Array.new(initial_length, 0)
    end

    ####################
    #                  #
    # Instance Methods #
    #                  #
    ####################

    def [](cells)
      case cells
      when Fixnum then get(cells)
      when Array  then cells.map { |c| get(c) }
      end
    end

    def []=(cells, values)
      case cells
      when Fixnum then set(cells, values)
      when Array  then cells.each_with_index { |c, idx| set(c, values[idx]) }
      end
    end

    private

    def get(index)
      @cells[index] || 0
    end

    def set(index, value)
      @cells[index] = value
    end

  end

end
