class Version
  attr_accessor :major, :minor, :patch

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
