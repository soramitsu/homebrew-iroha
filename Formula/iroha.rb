class Iroha < Formula
  desc "Hyperledger Iroha — distributed ledger technology platform"
  homepage "http://iroha.tech/en"
  url "https://github.com/hyperledger/iroha.git", :branch => "master"
  head "https://github.com/hyperledger/iroha.git"
  version "v1.0_alpha"
   
  depends_on "cmake" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "golang" => :build
  depends_on "libtool"
  depends_on "tbb"
  depends_on "postgres"
  depends_on "boost"
  depends_on "grpc"

  def install
    system "cmake -H. -Bbuild"
    system "cmake --build build -- -j8 irohad iroha-cli"
    bin.install "build/bin/irohad"
    bin.install "build/bin/iroha-cli"
    pkgshare.install "build/libs"
  end

  test do
      system "#{bin}/iroha-cli", "--help"
  end
end
