{ stdenv, fetchFromGitHub, libX11, libXinerama, libXrandr, libXft, yacc, pkgconfig }:

stdenv.mkDerivation {
  name = "cwm-6.3-80-g4154b9b";

  src = fetchFromGitHub {
      owner = "leahneukirchen";
      repo = "cwm";
      rev = "4154b9b194845814dfc836d80a94f34bcbf25d3e";
      sha256 = "1qw14v54r6d0prs1mg9dsn551mfd404n5v19qjimwl1h3ji71s9n";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ libX11 libXinerama libXrandr libXft yacc ];

  prePatch = ''sed -i "s@/usr/local@$out@" Makefile'';

  meta = with stdenv.lib; {
    description = "A lightweight and efficient window manager for X11";
    homepage = https://github.com/leahneukirchen/cwm;
    maintainers = with maintainers; [ mkf ];
    license     = licenses.isc;
    platforms   = platforms.linux;
  };
}
