{stdenv, fetchFromGitHub, cmake, zlib, ncurses}:

stdenv.mkDerivation rec {
  name = "somatic-sniper-${version}";
  version = "1.0.5.0";

  src = fetchFromGitHub {
    owner = "genome";
    repo = "somatic-sniper";
    rev = "v${version}";
    sha256 = "0lk7p9sp6mp50f6w1nppqhr40fcwy1asw06ivw8w8jvvnwaqf987";
  };

  patches = [ ./somatic-sniper.patch ];

  buildInputs = [ cmake zlib ncurses ];

  meta = with stdenv.lib; {
    description = "Identify single nucleotide positions that are different between tumor and normal";
    license = licenses.mit;
    homepage = https://github.com/genome/somatic-sniper;
    maintainers = with maintainers; [ jbedo ];
    platforms = platforms.linux;
  };

}
