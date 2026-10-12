# Homebrew formula for a tap (for example Checkend/homebrew-tap), made from this template with
# scripts/homebrew-formula.sh <version> <checksums.txt>. Install: brew install checkend/tap/checkend
class Checkend < Formula
  desc "Command-line interface for Checkend, open-source error tracking for coding agents"
  homepage "https://github.com/Checkend/checkend-cli"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Checkend/checkend-cli/releases/download/v0.3.1/ce_0.3.1_darwin_arm64.tar.gz"
      sha256 "0ea12a193ac574fae495794146ff62bc6747266775cf691fc23f7339d10aebcc"
    end
    on_intel do
      url "https://github.com/Checkend/checkend-cli/releases/download/v0.3.1/ce_0.3.1_darwin_amd64.tar.gz"
      sha256 "508b810ea9f79bf51a9315fd8d63785420ab93a28b6ec98f50bc3ebd39f03c62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Checkend/checkend-cli/releases/download/v0.3.1/ce_0.3.1_linux_arm64.tar.gz"
      sha256 "b7180df47e0f32f914865002554d8e1170cf5fdd6e4a9b959ebc6f0dce2a8b79"
    end
    on_intel do
      url "https://github.com/Checkend/checkend-cli/releases/download/v0.3.1/ce_0.3.1_linux_amd64.tar.gz"
      sha256 "312bdbd2fcc3fa86735c144fdfad4ae8811a979c4b762b682bb6e31a31992537"
    end
  end

  def install
    bin.install "ce"
    bin.install_symlink "ce" => "checkend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ce --version")
    assert_match "Unknown command", shell_output("#{bin}/checkend cd 2>&1", 2)
  end
end
