describe Version do
  describe "#to_s" do
    subject { version.to_s }

    context "major, minor, patch にそれぞれ 1, 4, 2 を与えた時に" do
      let(:version) { Version.new(1, 4, 2) }

      it { should eq "1.4.2" }
    end
  end
end
