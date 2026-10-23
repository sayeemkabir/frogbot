<p align="center"><img src="assets/icon.png" width="96" alt="Frog Bot"></p>

<h1 align="center">Frog Bot</h1>
<p align="center"><b>Your AI team, on your computer.</b><br>Agents that work like teammates, talk to each other, use your apps, and ask before they act.</p>
<p align="center"><a href="https://sayeemkabir.github.io/frogbot/"><b>🌐 Website and videos</b></a> · <a href="https://github.com/sayeemkabir/frogbot/releases/latest"><b>⬇ All downloads</b></a></p>

---

## Install

| Your computer | How |
|---|---|
| **Windows 10/11** | Download **[FrogBot-Setup-Windows.exe](https://github.com/sayeemkabir/frogbot/releases/latest/download/FrogBot-Setup-Windows.exe)** and open it. If Windows says “Windows protected your PC”, click **More info → Run anyway**. |
| **Mac** (Apple Silicon or Intel) | Open **Terminal** (⌘ Space, type Terminal) and paste:<br>`curl -fsSL https://sayeemkabir.github.io/frogbot/install-mac.sh \| bash` |
| **Linux** (64-bit) | Open a terminal and paste:<br>`curl -fsSL https://sayeemkabir.github.io/frogbot/install-linux.sh \| bash` |

Then paste a **Claude** or **OpenAI** API key on the welcome screen, and click **Allow** when the ROS dashboard sign-in opens. That's all.

<details>
<summary>Prefer to download the Mac or Linux files yourself?</summary>

- Mac: [Apple Silicon (M1–M4)](https://github.com/sayeemkabir/frogbot/releases/latest/download/FrogBot-Mac-arm64.zip) · [Intel](https://github.com/sayeemkabir/frogbot/releases/latest/download/FrogBot-Mac-x64.zip). Unzip, move **Frog Bot** to Applications, then run once in Terminal:
  `xattr -cr "/Applications/Frog Bot.app" && codesign --force --deep --sign - "/Applications/Frog Bot.app"`
  (Frog Bot isn't signed with an Apple certificate yet; this gives it a local signature so macOS will open it.)
- Linux: [FrogBot-Linux-x64.tar.gz](https://github.com/sayeemkabir/frogbot/releases/latest/download/FrogBot-Linux-x64.tar.gz). Unpack it and run `./frog-bot` (add `--no-sandbox` if Chromium's sandbox isn't set up).
</details>

## Videos

On the [website](https://sayeemkabir.github.io/frogbot/#videos): how to use Frog Bot, plus a short setup video for Windows, Mac and Linux.
