{
  lib,
  rustPlatform,
  pkg-config,
  openssl,
  dbus,
  sqlite,
  stdenv,
  darwin,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage {
  name = "leetcode-cli";

  src = fetchFromGitHub {
    owner = "clearloop";
    repo = "leetcode-cli";
    rev = "13d85dfb729ecbaca8132b0f9ae52d30971bbdd1";
    hash = "sha256-dZv3HftqzelKre1Gd0rGD+gZgqF6YwHYY6DqZ4YLh/8=";
  };
  cargoLock.lockFile = ./Cargo.lock;

  nativeBuildInputs = [pkg-config];

  buildInputs =
    [openssl dbus sqlite]
    ++ lib.optionals stdenv.isDarwin [darwin.apple_sdk.frameworks.Security];

  meta = with lib; {
    description = "May the code be with you 👻";
    longDescription = "Use leetcode.com in command line";
    homepage = "https://github.com/clearloop/leetcode-cli";
    license = licenses.mit;
    mainProgram = "leetcode";
  };
}
