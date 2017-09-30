class Version
  attr_accessor :major, :minor, :patch

  include Comparable

  def initialize(major, minor, patch)
    @major = check_version_number("major", major)
    @minor = check_version_number("minor", minor)
    @patch = check_version_number("patch", patch)
  end

  def to_s
    [@major, @minor, @patch].join(".")
  end

  def ==(other)
    major == other.major && minor == other.minor && patch == other.patch
  end

  def <=>(other)
    return -1 if major < other.major
    return 1 if major > other.major

    return -1 if minor < other.minor
    return 1 if minor > other.minor

    return -1 if patch < other.patch
    return 1 if patch > other.patch

    0
  end

  def bump_up_patch!
    self.patch += 1
  end

  def bump_up_minor!
    self.patch = 0
    self.minor += 1
  end

  def bump_up_major!
    self.patch = 0
    self.minor = 0
    self.major += 1
  end

  private

  def check_version_number(name, variable)
    raise ArgumentError, "#{name}がnilです" if variable.nil?
    raise ArgumentError, "#{name}が空文字です" if variable == ""

    if variable.is_a?(String)
      raise ArgumentError, "#{name}が数字以外です" unless variable.match?(/^[0-9]+$/)
      variable = variable.to_i
    end

    raise ArgumentError, "#{name}が負数です" if variable < 0

    variable
  end
end
