class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/fs0414/memoli"
  version "0.0.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/fs0414/memoli/releases/download/v#{version}/memoli-darwin-arm64"
    sha256 "aad8f9809afe7a25244be1aad31629301fd6457fc310ecd59383b5f0740ab74d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/fs0414/memoli/releases/download/v#{version}/memoli-darwin-x64"
    sha256 "e25ada547138984c5f6757ce312775221910f3b8ece3ad5ffd9f106fa9611ac5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/fs0414/memoli/releases/download/v#{version}/memoli-linux-arm64"
    sha256 "bd32f743681de8c9ad5dd5007a5713345646e130bb02f16481821faa337783a0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/fs0414/memoli/releases/download/v#{version}/memoli-linux-x64"
    sha256 "073fd9da069d23ec06379ad50f25d858e9e4a85df705613d174ef97951bebf98"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
