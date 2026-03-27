class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "2.0.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64.tar.gz"
    sha256 "ff63fc2236099e8110672992d463698aecac0b85a9513a3704eb93fcffdefe7f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64.tar.gz"
    sha256 "5a9fa871d871f1a99fdb2bc9a0bb5579d4aded82f383e3fa977d43e34924459e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64.tar.gz"
    sha256 "571a543f762a4dd4d622f4b693700495cf21511fc9c4ee87247fc550d87167b7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64.tar.gz"
    sha256 "38e3d30e693f588ad0b9354dd4189b70853a585a4f61d1b5c7c31b909698e358"
  end

  def install
    binary = Dir["memoli-*"].first
    bin.install binary => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
