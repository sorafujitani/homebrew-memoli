class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "2.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64.tar.gz"
    sha256 "0ed56adbd7f80c2d2f79e540d294ff39524dc9427cb1ecf4ff456cda4f8c4dcb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64.tar.gz"
    sha256 "2e1dacdfa8d262d528977afe6239727bca3d7138a987f1d7ec9b2951ece0d872"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64.tar.gz"
    sha256 "fabc98af650f2e7d57b4f5aa3823e9ccd8cba065f8d1cf501b824509b6a5775e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64.tar.gz"
    sha256 "ea617d9205333965781e00c4de19c6ab7b809012b6e137cefa38613a6b3a7325"
  end

  def install
    binary = Dir["memoli-*"].first
    bin.install binary => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
