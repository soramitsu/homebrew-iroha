class Iroha < Formula
    desc "Hyperledger Iroha — distributed ledger technology platform"
    homepage "http://iroha.tech"
    url "https://github.com/hyperledger/iroha.git", :branch => "develop"
    head "https://github.com/hyperledger/iroha.git"
    version "v0.95_preview"
     
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
      ohai "  ___         ___         ___         ___         ___         ___         ___    \n
       / _ \\ _____ / _ \\ _____ / _ \\ _____ / _ \\ _____ / _ \\ _____ / _ \\ _____ / _ \\   \n
      | (_) |_____| (_) |_____| (_) |_____| (_) |_____| (_) |_____| (_) |_____| (_) |  \n
       \\___/       \\___/       \\___/       \\___/       \\___/       \\___/       \\___/   \n
      \n
       8 8888 8 888888888o.      ,o888888o.     8 8888        8          .8.                \n
      8 8888 8 8888    `88.  . 8888     `88.   8 8888        8         .888.               \n
      8 8888 8 8888     `88 ,8 8888       `8b  8 8888        8        :88888.              \n
       8 8888 8 8888     ,88 88 8888        `8b 8 8888        8       . `88888.             \n
       8 8888 8 8888.   ,88' 88 8888         88 8 8888        8      .8. `88888.            \n
       8 8888 8 888888888P'  88 8888         88 8 8888        8     .8`8. `88888.           \n
       8 8888 8 8888`8b      88 8888        ,8P 8 8888888888888    .8' `8. `88888.          \n
       8 8888 8 8888 `8b.    `8 8888       ,8P  8 8888        8   .8'   `8. `88888.         \n
       8 8888 8 8888   `8b.   ` 8888     ,88'   8 8888        8  .888888888. `88888.        \n
       8 8888 8 8888     `88.    `8888888P'     8 8888        8 .8'       `8. `88888.       \n
        ___         ___         ___         ___         ___         ___         ___           \n
       / _ \\ _____ / _ \\ _____ / _ \\ _____ / _ \\ _____ / _ \\ _____ / _ \\ _____ / _ \\   \n
      | (_) |_____| (_) |_____| (_) |_____| (_) |_____| (_) |_____| (_) |_____| (_) |  \n
       \\___/       \\___/       \\___/       \\___/       \\___/       \\___/       \\___/   \n"
      
      system "cmake -H. -Bbuild"
      system "cmake --build build -- -j8"
      bin.install "build/bin/irohad"
      bin.install "build/bin/iroha-cli"
    end
  
    test do
        system "#{bin}/iroha-cli", "--help"
    end
  end