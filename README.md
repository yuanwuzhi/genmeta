# genmeta – Nix flake for packaging `gmutils`

This repository provides a Nix flake that packages the `gmutils` tool from the
GenMeta APT repository. The `.deb` package is fetched, unpacked, normalized to
a Nix-style `$out/bin` layout, and exposed as a regular Nix package.

---

## 🚀 Features

- Builds `gmutils` version **0.4.2-1** from the official APT `.deb`
- No external system dependencies required
- Works on **NixOS** and **nix + flakes**
- Produces clean Nix-style `bin/` output
- Installable directly into your user profile

---

## 📦 Install (Nix Flakes)

Install directly from the repo:

```sh
nix profile install github:yuanwuzhi/genmeta
````

Or install the explicitly exported default package:

```sh
nix profile install github:yuanwuzhi/genmeta#default
```

Check installation:

```sh
genmeta --help
```

---

## 🛠 Build Locally

Clone the repo:

```sh
git clone git@github.com:yuanwuzhi/genmeta.git
cd genmeta
```

Build the package:

```sh
nix build
```

The built result appears here:

```
./result/bin/genmeta
```

Run it:

```sh
./result/bin/genmeta --help
```

---

## ➕ Install Locally (without GitHub)

From inside the cloned repo:

```sh
nix profile install .
```

Or:

```sh
nix profile install .#default
```

---

## 🧱 Flake Structure

This repo exposes:

* `packages.x86_64-linux.default` – the `gmutils` package
* Build result includes:

  ```
  $out/bin/genmeta
  ```

To add this flake to another project:

```nix
inputs.genmeta.url = "github:yuanwuzhi/genmeta";
```

Then reference it:

```nix
environment.systemPackages = [
  inputs.genmeta.packages.${system}.default
];
```

---

## 📚 Using the `genmeta` Binary

After installing:

```sh
genmeta ssh3 kosumi@dev.meta.haios
```

Or any other command supported by gmutils.

---

## 📝 Development

Enter a dev shell with the tools needed to work on the flake:

<!-- ```sh -->
<!-- nix develop -->
<!-- ``` -->

Format Nix files:

```sh
nix fmt
```

---

## 🧪 Test the Build

```sh
nix build
./result/bin/genmeta --version
```

---

<!-- ## 📄 License -->
<!---->
<!-- MIT License unless specified otherwise. -->
<!---->
<!-- --- -->

If you hit issues or have feature requests, feel free to open an issue or PR.

