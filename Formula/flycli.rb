class Flycli < Formula
  desc "Firefly's command line utility and terminal user interface"
  homepage "https://www.gofirefly.io/"
  url "https://github.com/infralight/cli/archive/refs/tags/f61ef5c.211205.tar.gz"
  version "f61ef5c.211205"
  sha256 "95f0802e9a3a5a53fa9a95749e99ea2055e19ad1c2ecd2cb52a10af4f94b5f6b"
  license "Apache License 2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -extldflags '-static' -X github.com/infralight/cli/version.Version=#{version}")
  end

  test do
    assert_equal "#{version}\n", pipe_output("#{bin}/flycli version")
  end
end
