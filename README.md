# Unity Hub Proxy Launcher

[中文说明](README.zh-CN.md)

A tiny Windows launcher that starts Unity Hub with proxy-related environment variables set for that process. It is useful when Unity Hub needs to reach Unity services through a local proxy, without changing system-wide proxy settings.

## Features

- Zero dependencies: one `.cmd` file.
- Sets `HTTP_PROXY`, `HTTPS_PROXY`, lowercase proxy variables, `NO_PROXY`, and `UNITY_NOPROXY` for Unity Hub.
- Passes Chromium's `--proxy-server` flag to Unity Hub.
- Supports command-line arguments and environment variables.
- Does not permanently modify the Windows environment or registry.

## Quick Start

Download or clone this repository, then run:

```bat
launch-unity-hub-proxy.cmd
```

By default, the launcher uses:

```text
Proxy: http://127.0.0.1:7890
Unity Hub: %ProgramFiles%\Unity Hub\Unity Hub.exe
```

## Usage

Use a custom proxy:

```bat
launch-unity-hub-proxy.cmd http://127.0.0.1:10809
```

Use a custom Unity Hub path:

```bat
launch-unity-hub-proxy.cmd http://127.0.0.1:7890 "D:\Apps\Unity Hub\Unity Hub.exe"
```

Show help:

```bat
launch-unity-hub-proxy.cmd --help
```

## Environment Variables

You can configure the launcher without command-line arguments:

```bat
set UNITY_HUB_PROXY=http://127.0.0.1:7890
set UNITY_HUB_PATH=C:\Program Files\Unity Hub\Unity Hub.exe
set UNITY_HUB_NO_PROXY=localhost,127.0.0.1,::1
launch-unity-hub-proxy.cmd
```

Command-line arguments take precedence over environment variables.

## Ask AI for Help

If you are not sure which proxy URL or Unity Hub path to use, you can send this repository link or the README content to an AI assistant and copy this prompt:

```text
Please help me use Unity Hub Proxy Launcher on Windows.
My goal is to start Unity Hub through a local proxy.
Ask me for the required information step by step, such as my Unity Hub install path and local proxy port, then give me the final command to run.
Do not change the system-wide proxy. Do not modify the Windows registry. Only use launch-unity-hub-proxy.cmd from this project.
```

If your AI tool cannot read web pages, copy the README content directly into the chat.

## Notes

- The proxy only applies to the Unity Hub process started by this script and child processes inheriting its environment.
- Make sure your local proxy application is already running before launching Unity Hub.
- If Unity Hub is installed in a non-default location, pass the path as the second argument or set `UNITY_HUB_PATH`.

## License

MIT License. See [LICENSE](LICENSE).
