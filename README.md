```
vetsin:devenv-poetry/ $

vetsin:devenv-poetry/ $ cd passes

vetsin:passes/ $ devenv test
• Overriding .devenv to .devenv.qecKJowPw2Sh
• Building tests ...
• Using Cachix: devenv
✔ Building tests in 30.0s.
• Running tests ...
• Building shell ...
✔ Building shell in 24.1s.
• Setting up shell environment ...
• Testing ...
✔ Running tests in 36.1s.
• Tests passed :)

vetsin:passes/ $ cd ../fails

vetsin:fails/ $ devenv -v test
• Overriding .devenv to .devenv.A7h8VeYG0nnR
• Building tests ...
• Using Cachix: devenv
• Running command: nix --show-trace --extra-experimental-features nix-command --extra-experimental-features flakes --option warn-dirty false --option eval-cache false --keep-going --max-jobs 6 build .#devenv.test --no-link --print-out-paths --option extra-substituters https://devenv.cachix.org --option extra-trusted-public-keys devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
evaluating derivation 'path:/Users/vetsin/projects/devenv-poetry/fails#devenv.test'
✖ Command produced the following output:


✔ Building tests in 28.8s.
Error:   × Command `/nix/store/8csgh07r3jivsb0qg9jxv4fzv90r7bmn-nix-2.21-devenv/bin/nix --show-trace --extra-experimental-features nix-command --extra-experimental-
  │ features flakes --option warn-dirty false --option eval-cache false --keep-going --max-jobs 6 build .#devenv.test --no-link --print-out-paths --option
  │ extra-substituters https://devenv.cachix.org --option extra-trusted-public-keys devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=` failed
  │ with without exit code

vetsin:fails/ $ cd ..

vetsin:devenv-poetry/ $ diff -r passes fails
diff --color -r passes/.devenv.flake.nix fails/.devenv.flake.nix
6,8c6,8
< devenv_root = "/Users/vetsin/projects/devenv-poetry/passes";
< devenv_dotfile = ./.devenv.qecKJowPw2Sh;
< devenv_dotfile_string = ".devenv.qecKJowPw2Sh";
---
> devenv_root = "/Users/vetsin/projects/devenv-poetry/fails";
> devenv_dotfile = ./.devenv.A7h8VeYG0nnR;
> devenv_dotfile_string = ".devenv.A7h8VeYG0nnR";
11c11
< devenv_runtime = "/var/folders/5t/xztjvk6j5v98pymbd691_4080000gp/T/devenv-3bb9ac9";
---
> devenv_runtime = "/var/folders/5t/xztjvk6j5v98pymbd691_4080000gp/T/devenv-61ae962";
26,28c26,28
< devenv_root = "/Users/vetsin/projects/devenv-poetry/passes";
< devenv_dotfile = ./.devenv.qecKJowPw2Sh;
< devenv_dotfile_string = ".devenv.qecKJowPw2Sh";
---
> devenv_root = "/Users/vetsin/projects/devenv-poetry/fails";
> devenv_dotfile = ./.devenv.A7h8VeYG0nnR;
> devenv_dotfile_string = ".devenv.A7h8VeYG0nnR";
31c31
< devenv_runtime = "/var/folders/5t/xztjvk6j5v98pymbd691_4080000gp/T/devenv-3bb9ac9";
---
> devenv_runtime = "/var/folders/5t/xztjvk6j5v98pymbd691_4080000gp/T/devenv-61ae962";
diff --color -r passes/example/flake.nix fails/example/flake.nix
22c22
<           myapp = mkPoetryApplication { projectDir = self; };
---
>           myapp = mkPoetryApplication { projectDir = ./.; };
```
