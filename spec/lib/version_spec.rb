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
end
