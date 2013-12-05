module WireMind

  module Instruction

    def self.in(context, owner, memory, input_name, index)
      memory[index] = context[input_name]
    end

    def self.out(context, owner, memory, output_name, index)
      context[output_name] = memory[index]
    end

    def self.all(context, owner, memory, inputs, outputs)
      val = memory[inputs].all? { |sig| sig == 1 } ? 1 : 0

      memory[outputs] = val
    end

    def self.any(context, owner, memory, inputs, outputs)
      val = memory[inputs].any? { |sig| sig == 1 } ? 1 : 0

      memory[outputs] = val
    end

    def self.none(context, owner, memory, inputs, outputs)
      val = memory[inputs].any? { |sig| sig == 1 } ? 0 : 1

      memory[outputs] = val
    end

    def self.get(context, owner, memory, input_name, index)
      memory[index] = owner[input_name]
    end

    def self.set(context, owner, memory, output_name, index)
      owner[output_name] = memory[index]
    end

  end

end
