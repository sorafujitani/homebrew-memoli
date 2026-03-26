class Memoli < Formula
  desc "CLI markdown memo manager"
  homepage "https://github.com/sorafujitani/memoli"
  version "1.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-arm64"
    sha256 "09d27939ed72c15076aff4a19c92e4292883bd091736c8cccaf867f4b215f660"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-darwin-x64"
    sha256 "f0aa8827685b4494abb93f5798ffbab096be4a6b6df163663e02c7e6e3781395"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-arm64"
    sha256 "fe43f9b2f05086a2990de70ef13e452f920622420d98319e13e0a99baaf35e4b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sorafujitani/memoli/releases/download/v#{version}/memoli-linux-x64"
    sha256 "c60e3987eb3a87f68ba8c6251e9fb4fdef67a8da1b49c560c6c4f97fa5166c90"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "memoli"
  end

  test do
    assert_match "memoli v#{version}", shell_output("#{bin}/memoli --version")
  end
end
