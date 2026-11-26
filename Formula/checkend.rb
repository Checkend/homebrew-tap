# Homebrew formula for Checkend/homebrew-tap, made from this template by
# scripts/homebrew-formula.sh <version> <checksums.txt>. Install: brew install checkend/tap/checkend
class Checkend < Formula
  desc "Command-line client for Checkend: stats, events, funnels and exports"
  homepage "https://github.com/Checkend/checkend-cli"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Checkend/checkend-cli/releases/download/v1.0.0/ce_1.0.0_darwin_arm64.tar.gz"
      sha256 "d570e62fa88bec4b26e328f9011a6ae7b04deae57ab5d859d6fde5f4debdd882"
    end
    on_intel do
      url "https://github.com/Checkend/checkend-cli/releases/download/v1.0.0/ce_1.0.0_darwin_amd64.tar.gz"
      sha256 "b23bc8676ef057e82e114db416369cdc8ece711d7edcf6143a4e2cd8da49c819"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Checkend/checkend-cli/releases/download/v1.0.0/ce_1.0.0_linux_arm64.tar.gz"
      sha256 "7a89b072fddc190b7fbd152f79cded74c20d25c628e99dd6beb621a6494c8aed"
    end
    on_intel do
      url "https://github.com/Checkend/checkend-cli/releases/download/v1.0.0/ce_1.0.0_linux_amd64.tar.gz"
      sha256 "534c967c8110653d0cd78ccd54af8df9ab651b2de0f8f784e427291b599a1c6c"
    end
  end

  def install
    bin.install "ce"
    bin.install_symlink "ce" => "checkend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ce --version")
    assert_match "unknown command", shell_output("#{bin}/ce nosuch 2>&1", 2)
  end
end
