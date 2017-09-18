class Version
  attr_accessor :major, :minor, :patch

  def initialize(major, minor, patch)
    @major = major
    @minor = minor
    @patch = patch
  end

  def to_s
    [@major, @minor, @patch].join(".")
  end

  def ==(other)
    major == other.major && minor == other.minor && patch == other.patch
  end
end
