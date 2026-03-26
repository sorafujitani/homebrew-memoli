class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "1.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64.tar.gz"
    sha256 "e36e6e66ac47e7b33561a41f09cbc3daeac2d2a205efaa7533b627494b97b31d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64.tar.gz"
    sha256 "79298b3f87225ca674755c9fd1d4498dd494706806771694a928e445f67c8ffc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64.tar.gz"
    sha256 "39ec4ae5cf5b2aee8d922993c92c9c63395a90b90f114b36d2b579687b0cee94"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64.tar.gz"
    sha256 "05c19e1cdfe3011b69caa661c1bec5909d80dadcdf07a715e0ef807981c937be"
  end

  def install
    # tar.gz extracts to memoli-<platform>, rename to memoli
    binary = Dir["memoli-*"].first
    bin.install binary => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
