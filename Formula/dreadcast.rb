class Dreadcast < Formula
  desc "Weather and radar for the command line"
  homepage "https://github.com/enderwiggens/dreadcast-cli"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura
    url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v1.0.0/dread-macos-universal.zip"
    sha256 "71928b9ccd96a35ce5fdaa0d2c002e0c9c152224336fcbdb312949d63b70fe5b"
  end

  on_linux do
    on_intel do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v1.0.0/dread-linux-x86_64.tar.gz"
      sha256 "3fe06a845d0e608466be32cdd7d7c6c74311bb8fa82eb223c1914a6fe5ab19c7"
    end
    on_arm do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v1.0.0/dread-linux-arm64.tar.gz"
      sha256 "65b152eace984f86fb62cc2085b4f8192debd52afa8022fa0d35c717ca1ab0be"
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
