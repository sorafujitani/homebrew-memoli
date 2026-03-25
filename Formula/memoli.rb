class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "1.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64"
    sha256 "a3bb6c749d11752286ed8aa1d116bd9fc7589b592455189caf98b30ed09d4bf6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64"
    sha256 "498377539a6b3b21d8fd11d12a8354dda3d86012c5dfa602d35c75d7d20b90e9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64"
    sha256 "ecc3bf25d6c52deae5da7b93cce5d6b2c757593ed0d729b7ff4505c2b9c7aa52"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64"
    sha256 "e3622836d363411039b558919fab8d9656c1eb98ba5ec7cd2dac777840d7f771"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
