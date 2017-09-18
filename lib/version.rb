class Version
  def initialize(majar, minor, patch)
    @major = majar
    @minor = minor
    @patch = patch
  end

  def to_s
    [@major, @minor, @patch].join(".")
  end
end
