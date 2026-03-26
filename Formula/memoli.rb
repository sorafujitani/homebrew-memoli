class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "1.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64"
    sha256 "530b5902e89ad7868962afa0e0f1a788a4e694dc4e7cddbbcb8c1ed68164817d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64"
    sha256 "45993c031e1aecc08db4a358d4e0bd6ddcf0c40e9044c50247b8e0359d7587da"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64"
    sha256 "64e9695855a55658950ba6ec18d6cd27c2b3144531ff8ebe9dd833bf9b2fdfc9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64"
    sha256 "4800e58b32a69f96e9da35d151a8b116f63928178de92026e8e18542598a2eea"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
