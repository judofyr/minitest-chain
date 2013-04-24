require 'minitest/unit'

module MiniTest::Chain
  class AssertionChain
    def initialize(scope, obj)
      @scope = scope
      @obj = obj
    end

    # Flippers:
    [
      [:equal, :equal],
      [:match, :match],
      [:close_to, :in_delta],
      [:within_epsilon, :in_epsilon],
      [:instance_of, :instance_of],
      [:same, :same],
    ].each do |name, assertion|
      class_eval <<-RUBY, __FILE__, __LINE__+1
        def #{name}(other, *args)
          @scope.assert_#{assertion}(other, @obj, *args)
          self
        end

        def not_#{name}(other, *args)
          @scope.refute_#{assertion}(other, @obj, *args)
          self
        end
      RUBY
    end

    # Unaries and reversers:
    [
      [:empty, :empty],
      [:include, :includes],
      [:is, :operator],
      [:respond_to, :respond_to],
    ].each do |name, assertion|
      class_eval <<-RUBY, __FILE__, __LINE__+1
        def #{name}(*args)
          @scope.assert_#{assertion}(@obj, *args)
          self
        end

        def not_#{name}(*args)
          @scope.refute_#{assertion}(@obj, *args)
          self
        end
      RUBY
    end

    alias is_not not_is
    remove_method :not_is
  end

  def assert(obj, *args)
    super
    AssertionChain.new(self, obj)
  end
end

