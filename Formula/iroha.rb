class Iroha < Formula
    desc "Hyperledger Iroha — distributed ledger technology platform"
    homepage "http://iroha.tech"
    url "https://github.com/hyperledger/iroha.git", :branch => "develop"
    head "https://github.com/pinterest/plank.git"
    version "v0.95_preview"
     
    depends_on "cmake" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "golang" => :build
    depends_on "libtool"
    depends_on "postgres"
    depends_on "boost"
    depends_on "grpc"
  
    def install
      system "cmake -H. -Bbuild"
      system "cmake --build build -- -j8"
      bin.install "build/bin/irohad"
      bin.install "build/bin/iroha-cli"
    end
  
    test do
        system "#{bin}/iroha-cli", "--help"
    end
  end