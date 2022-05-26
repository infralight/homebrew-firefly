class Flycli < Formula
  desc "Firefly's command line utility and terminal user interface"
  homepage "https://www.gofirefly.io/"
  url "https://github.com/infralight/cli/archive/refs/tags/v1.0.1.tar.gz"
  version "v1.0.1"
  sha256 "10cd0d45dd2d8f9493a69e5ccba471f8c363148e6b231179a710015857c8c5ff"
  license "Apache License 2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -extldflags '-static' -X github.com/infralight/cli/version.Version=#{version}")
  end

  test do
    assert_equal "#{version}\n", pipe_output("#{bin}/flycli version")
  end
end
