class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "1.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64.tar.gz"
    sha256 "812f4a834b8fed521db8526fd2de5c1271956d629f417b5dfbbce6bcfa5b4d74"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64.tar.gz"
    sha256 "5b936640ebf15d2e7817e090023565cec782f85910335dffa16caa37bfb37232"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64.tar.gz"
    sha256 "a8a5b56d72e79c8cd3f9d984b5c67f99af5170df32c2428ff2db3b862a6ee2d9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64.tar.gz"
    sha256 "ca785174efe7b764f670f26d919fc7487d731037c603ffd67b1386eff84dde51"
  end

  def install
    binary = Dir["memoli-*"].first
    bin.install binary => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
