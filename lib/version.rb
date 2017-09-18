class Version
  attr_accessor :major, :minor, :patch

  def initialize(major, minor, patch)
    raise ArgumentError, "majorがnilです" if major.nil?
    raise ArgumentError, "majorが空文字です" if major == ""

    if major.is_a?(String)
      raise ArgumentError, "majorが数字以外です" unless major.match?(/^[0-9]+$/)
      major = major.to_i
    end

    raise ArgumentError, "majorが負数です" if major < 0


    raise ArgumentError, "minorがnilです" if minor.nil?
    raise ArgumentError, "minorが空文字です" if minor == ""

    if minor.is_a?(String)
      raise ArgumentError, "minorが数字以外です" unless minor.match?(/^[0-9]+$/)
      minor = minor.to_i
    end

    raise ArgumentError, "minorが負数です" if minor < 0


    raise ArgumentError, "patchがnilです" if patch.nil?
    raise ArgumentError, "patchが空文字です" if patch == ""

    if patch.is_a?(String)
      raise ArgumentError, "patchが数字以外です" unless patch.match?(/^[0-9]+$/)
      patch = patch.to_i
    end

    raise ArgumentError, "patchが負数です" if patch < 0


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
