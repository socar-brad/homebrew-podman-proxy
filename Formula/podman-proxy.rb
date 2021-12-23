class PodmanProxy < Formula
  desc ""
  homepage ""
  license ""
  url "https://github.com/socar-brad/podman-proxy.git",
      tag:      "v0.0.2",
      revision: "b5f22c30bce4668c0ad63f5b4259ea238d89d350"
  head "https://github.com/socar-brad/podman-proxy.git", branch: "main"

  depends_on "podman"
  depends_on "go" => :build

  def install
    puts buildpath
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/socar-brad/podman-proxy"
    dir.install (buildpath/"").children

    cd dir do
      system "go", "build", "-o", "#{bin}/podman-proxy"
    end

  end

  test do
  end
end

