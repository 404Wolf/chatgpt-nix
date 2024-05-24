{ lib
, fetchFromGitHub
, buildGoModule
,
}:
buildGoModule rec {
  pname = "chatgpt";
  version = "1.3.4";

  src = fetchFromGitHub {
    owner = "j178";
    repo = pname;
    rev = "v${version}";
    hash = "?";
  };

  vendorHash = "?";

  subPackages = [ "cmd" ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/$pname
  '';

  meta = with lib; {
    description = "Interactive CLI for ChatGPT";
    homepage = "https://github.com/j178/chatgpt";
    license = licenses.mit;
    mainProgram = "chatgpt";
    maintainers = with maintainers; [ Ruixi-rebirth ];
  };
}