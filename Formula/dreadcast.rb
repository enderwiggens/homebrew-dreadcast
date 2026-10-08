class Dreadcast < Formula
  desc "Weather and radar for the command line"
  homepage "https://github.com/enderwiggens/dreadcast-cli"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura
    url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.1/dread-macos-universal.zip"
    sha256 "da49265a281ae930fe1c143946f44e0a3d2aa2aae8e3941f08b64ca8b06cc05d"
  end

  on_linux do
    on_intel do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.1/dread-linux-x86_64.tar.gz"
      sha256 "73caba18caf9a743bc7ac58c02151cd39e8d976c3c2489d42633deb228063099"
    end
    on_arm do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.1/dread-linux-arm64.tar.gz"
      sha256 "d948a14e051c2ad91e2ea03e2fa984c2635812b90b4f1cf82db7656ed4fcd443"
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
