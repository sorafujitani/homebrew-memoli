class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "0.0.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64"
    sha256 "cc812d72b904ba91653f8ebf824ac9dcd1c3384aea78143679fde8a44b5bddcd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64"
    sha256 "6551bac538e1e2390172ffcfb2727c310274f46e73f1281c4302d60c37d2c5c1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64"
    sha256 "c03acaebbc8f02b3ac13e43f958cb33f1ca48ff76bbab4751e00bbadbb03bd13"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64"
    sha256 "2363819e8fd3d2987b7640fea4b57da1fafc2492e48918a3144e9a655feab06d"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
