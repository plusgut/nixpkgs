{ lib
, buildPythonPackage
, fetchFromGitHub
, poetry-core
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "immutabledict";
  version = "4.0.0";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "corenting";
    repo = "immutabledict";
    rev = "refs/tags/v${version}";
    hash = "sha256-z03s2mOJiMVnvLmeFJFgCRvkP+9VUcALiIoIPBAHUPw=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  pythonImportsCheck = [
    "immutabledict"
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  meta = with lib; {
    description = "A fork of frozendict, an immutable wrapper around dictionaries";
    homepage = "https://github.com/corenting/immutabledict";
    changelog = "https://github.com/corenting/immutabledict/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ hexa ];
  };
}
