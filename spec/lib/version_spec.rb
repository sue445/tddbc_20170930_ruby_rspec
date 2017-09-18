describe Version do
  describe "#to_s" do
    subject { version.to_s }

    context "major, minor, patch にそれぞれ 1, 4, 2 を与えた時に" do
      let(:version) { Version.new(1, 4, 2) }

      it { should eq "1.4.2" }
    end
  end

  describe "#==" do
    it "バージョン 1.4.2 は バージョン 2.1.0 と等しくないこと" do
      version1 = Version.new(1, 4, 2)
      version2 = Version.new(2, 1, 0)

      is_asserted_by { version1 != version2 }
    end

    it "バージョン 1.4.2 は バージョン 1.4.2 と等しいこと" do
      version1 = Version.new(1, 4, 2)
      version2 = Version.new(1, 4, 2)

      is_asserted_by { version1 == version2 }
    end
  end

  describe ".initialize" do
    subject { Version.new(major, minor, patch) }

    context "正常系" do
      using RSpec::Parameterized::TableSyntax

      where(:major, :minor, :patch) do
        1   | 0   | 0
        1   | 1   | 1
        "1" | "1" | "1"
      end

      with_them do
        it { expect { subject }.not_to raise_error }
      end
    end

    context "異常系" do
      using RSpec::Parameterized::TableSyntax

      where(:major, :minor, :patch) do
        # 負数
        -1 | 1  | 1
        1  | -1 | 1
        1  | 1  | -1

        # 空文字
        "" | 1   | 1
        1  | ""  | 1
        1  | 1   | ""

        # nil
        nil | 1    | 1
        1   | nil  | 1
        1   | 1    | nil

        # 数字以外の文字
        "a" | 1   | 1
        1   | "a" | 1
        1   | 1   | "a"
      end

      with_them do
        it { expect { subject }.to raise_error ArgumentError }
      end
    end
  end

  describe "#bump_up_patch!" do
    let(:version) { Version.new(1, 4, 2) }

    it "patchバージョンが上がること" do
      version.bump_up_patch!

      aggregate_failures do
        is_asserted_by { version.major == 1 }
        is_asserted_by { version.minor == 4 }
        is_asserted_by { version.patch == 3 }
      end
    end
  end

  describe "#bump_up_minor!" do
    let(:version) { Version.new(1, 4, 2) }

    it "minorバージョンが上がること" do
      version.bump_up_minor!

      aggregate_failures do
        is_asserted_by { version.major == 1 }
        is_asserted_by { version.minor == 5 }
        is_asserted_by { version.patch == 0 }
      end
    end
  end
end
