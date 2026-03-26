class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "1.1.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64"
    sha256 "08dc5feedc317fafe0578f4dc0de11fd87259579c46a97beb5d6cfaf13de0e92"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64"
    sha256 "21e96aa97d507b57a6e37db35e7422c5565158f6b5f523f0def75e3c9f07dfe1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64"
    sha256 "da87b21d7f90effade6392b810810c51230397de0e9b4062516a25edb598b5f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64"
    sha256 "3c67b1a49a9d364228d14bfe5fc63e548482103ba391375b427e3333c53114f1"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
