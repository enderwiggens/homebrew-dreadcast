class Dreadcast < Formula
  desc "Weather and radar for the command line"
  homepage "https://github.com/enderwiggens/dreadcast-cli"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura
    url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.2/dread-macos-universal.zip"
    sha256 "83a76ac00fec4f7ce3a31081a2b042258d30b5a96c7dcb969f0ea9666ea0da95"
  end

  on_linux do
    on_intel do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.2/dread-linux-x86_64.tar.gz"
      sha256 "5ebe9f9f2654e066a13b07635f7b345f6c5c303aabb25923ee747887635fc7bd"
    end
    on_arm do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.2/dread-linux-arm64.tar.gz"
      sha256 "2732293630e5fa29a98bd844c951f5c78e1877798e26986e8013646eac4f4fa1"
    end
  end

  def install
    bin.install "dread"
  end

  def caveats
    <<~EOS
      Choose a location to get started:
        dread setup
      Then run dread to open the app, or dread now for a quick look.
    EOS
  end

  test do
    assert_match "dread #{version}", shell_output("#{bin}/dread version")
  end
end
