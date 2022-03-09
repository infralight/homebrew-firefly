class Flycli < Formula
  desc "Firefly's command line utility and terminal user interface"
  homepage "https://www.gofirefly.io/"
  url "https://github.com/infralight/cli/archive/refs/tags/v1.0.0.tar.gz"
  version "v1.0.0"
  sha256 "c4eb89ce242ed2e765a633bdc7bda3c882f30d1ace52611e220a305232b48f18"
  license "Apache License 2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -extldflags '-static' -X github.com/infralight/cli/version.Version=#{version}")
  end

  test do
    assert_equal "#{version}\n", pipe_output("#{bin}/flycli version")
  end
end
