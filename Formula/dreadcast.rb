class Dreadcast < Formula
  desc "Weather and radar for the command line"
  homepage "https://github.com/enderwiggens/dreadcast-cli"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura
    url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.2.0/dread-macos-universal.zip"
    sha256 "471ebb6ab8b3207c4bfdfdde68b47df0d5849919589632dfb3e1572d0d16968b"
  end

  on_linux do
    on_intel do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.2.0/dread-linux-x86_64.tar.gz"
      sha256 "577030ad6e0d9b5cf3df192ff5e898aa9b3eaaf5e4c5820f9dc90c4b5677dd66"
    end
    on_arm do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.2.0/dread-linux-arm64.tar.gz"
      sha256 "7a078d80e1ff3dd364539df5144b1f139f968cdba078fa518b5b74f72f497809"
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
