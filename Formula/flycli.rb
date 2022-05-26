class Flycli < Formula
  desc "Firefly's command line utility and terminal user interface"
  homepage "https://www.gofirefly.io/"
  url "https://github.com/infralight/cli/archive/refs/tags/v1.0.2.tar.gz"
  version "v1.0.2"
  sha256 "41b341e963d458b10b52d68ce17d781147e16b322bb73b183f3ecb7eba5d389a"
  license "Apache License 2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -extldflags '-static' -X github.com/infralight/cli/version.Version=#{version}")
  end

  test do
    assert_equal "#{version}\n", pipe_output("#{bin}/flycli version")
  end
end
