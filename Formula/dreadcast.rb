class Dreadcast < Formula
  desc "Weather and radar for the command line"
  homepage "https://github.com/enderwiggens/dreadcast-cli"
  url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.1.0/dread-0.1.0-macos-universal.zip"
  version "0.1.0"
  sha256 "1b4145aea217d5f23799ad9e4d05651317535128f8304aaa7ed5f391411e1670"
  license "Apache-2.0"

  depends_on :macos

  def install
    bin.install "dread"
  end

  def caveats
    <<~EOS
      Choose a location to get started:
        dread setup
    EOS
  end

  test do
    assert_match "dread #{version}", shell_output("#{bin}/dread version")
  end
end
