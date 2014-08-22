module Modifier
  class A
    def test
      public1
      public2
      self.public1
      self.public2

      protected1
      protected2
      self.protected1
      self.protected2

      private1
      private2

      #self.private1  # wrong
      #self.private2  # wrong

      a = A.new
      a.public1
      a.public2

      a.protected1
      a.protected2

      # a.private1  # wrong
      # a.private2  # wrong
    end

    public
    def public1
      puts __callee__
    end

    def public2
      puts __callee__
    end

    protected
    def protected1
      puts __callee__
    end

    def protected2
      puts __callee__
    end


    private
    def private1
      puts __callee__
    end

    def private2
      puts __callee__
    end


  end

  class B < A

    def test
      public1
      public2
      self.public1
      self.public2

      protected1
      protected2
      self.protected1
      self.protected2

      private1
      private2

      #self.private1  # wrong
      #self.private2  # wrong

      a = A.new
      a.public1
      a.public2

      a.protected1
      a.protected2

      # a.private1  # wrong
      # a.private2  # wrong
    end

  end

  class C
    def test
      a = A.new
      a.public1
      a.public2
      # a.protected1   #wrong
      # a.protected2   #wrong
      # a.private1     #wrong
      # a.private2     #wrong
    end
  end

  A.new.test
#  C.new.test

end