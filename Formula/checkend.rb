# Homebrew formula for a tap (for example Checkend/homebrew-tap), made from this template with
# scripts/homebrew-formula.sh <version> <checksums.txt>. Install: brew tap checkend/tap && brew install checkend/tap/checkend
class Checkend < Formula
  desc "Command-line interface for Checkend, open-source error tracking for coding agents"
  homepage "https://github.com/Checkend/checkend-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Checkend/checkend-cli/releases/download/v0.4.0/ce_0.4.0_darwin_arm64.tar.gz"
      sha256 "239e7f7643d4ddf7e49916fb02384e54e83224b591db98e57873bd8a41947fb8"
    end
    on_intel do
      url "https://github.com/Checkend/checkend-cli/releases/download/v0.4.0/ce_0.4.0_darwin_amd64.tar.gz"
      sha256 "4681267cbf245866c273ea00a835db5c0abecc7c1c9a60d89c3f301adacb82ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Checkend/checkend-cli/releases/download/v0.4.0/ce_0.4.0_linux_arm64.tar.gz"
      sha256 "a844c5fe694ff0c230c2f92961c5bbbc725423bb5542dd5ce5b7da980240f4d0"
    end
    on_intel do
      url "https://github.com/Checkend/checkend-cli/releases/download/v0.4.0/ce_0.4.0_linux_amd64.tar.gz"
      sha256 "00ecb21e599c82e43a70347e79a89f6d0702a391c359a0797f1913b9c730d745"
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
