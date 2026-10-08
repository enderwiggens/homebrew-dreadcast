class Dreadcast < Formula
  desc "Weather and radar for the command line"
  homepage "https://github.com/enderwiggens/dreadcast-cli"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura
    url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.0/dread-macos-universal.zip"
    sha256 "e5a5344b50a6a514ac3358c62edb6c5482507f7fa69f82285bd58b3680ca0b25"
  end

  on_linux do
    on_intel do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.0/dread-linux-x86_64.tar.gz"
      sha256 "671635b8a6c4cb2be4b01c8dea7bae7c38edc7a510d34be350cba8b79321cf49"
    end
    on_arm do
      url "https://github.com/enderwiggens/dreadcast-cli/releases/download/v0.3.0/dread-linux-arm64.tar.gz"
      sha256 "ed9f11d4d798b1dac1992c5d753dae4ef2d0ddcdad2b1831dee193bd9dd82325"
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
