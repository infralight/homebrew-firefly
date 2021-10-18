class Flycli < Formula
  desc "Firefly's command line utility and terminal user interface"
  homepage "https://www.gofirefly.io/"
  url "https://github.com/infralight/cli/archive/refs/tags/51a0756.211020.tar.gz"
  version "51a0756.211020"
  sha256 "e1cd4ba4a28c45950a86ba5dfd099c020fed3ac36f8c0659f0f32de3f86bf4a1"
  license "Apache License 2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -extldflags '-static' -X github.com/infralight/cli/version.Version=#{version}")
  end

  test do
    assert_equal "#{version}\n", pipe_output("#{bin}/flycli version")
  end
end
