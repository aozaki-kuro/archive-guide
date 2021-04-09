## 🔨 Tool Preparation

- streamlink - stream recording tool [[Github](https://github.com/streamlink/streamlink)]
- ffmpeg [[Github](https://github.com/FFmpeg/FFmpeg)] [[Guide Here](http://blog.gregzaal.com/how-to-install-ffmpeg-on-windows/)]
- Stream Recorder - stream recording tool [[Chrome Store](https://chrome.google.com/webstore/detail/stream-recorder-download/iogidnfllpdhagebkblkgbfijkbkjdmm)]

## 🎪 Windows Environment Preparation

[![Windows10](https://img.shields.io/badge/Windows%2010-20H2-blue)](https://www.microsoft.com/en-us/software-download/windows10)

**※ If you are working on a headless server like I do, please read the [advanced guide](/Advanced/server.md)**

**※ If you don't want to do the configuration yourself, you can use the scripts provided [here](/scripts)**

First of all, you should setup a `PATH` folder to tell the Windows where to find the programs.

Run Command Prompt (cmd) as administrator. Then paste the following into the console

```powershell
setx /M PATH "%PATH%;<REPLACE THIS WITH THE PATH TO YOUR DIRECTORY>"
```
The `REPLACE THIS WITH THE PATH TO YOUR DIRECTORY` part should be the folder want to save the tools. In [this case](/assets/dir1.PNG) it sould be "J:\Youtube Downloading"

nce you are done, put the tools in the folder. Start cmd (doesn't not have to be as administrator) and run the commands `youtube-dl --help` or `streamlink -h` etc. If you see a giant block of text showing you the arguments, that means it's working.

Tips: 

> If you are not sure about how to download things on Github, just check the `releases` on the right of the page.
>
> Select the .exe file or the package having "windows" or "amd64" in it.

Another alternative way to install these are by using `pip3`. Just install `python` [link](https://www.python.org/) and type `pip3 install youtube-dl` and `pip3 install streamlink`.

## Usage

### 🚩 Streamlink

**※ If you don't want to do the configure yourself, you can use the scripts provided [here](/scripts)**

Streamlink is possibly the best and the most stable way to record Niconico streams.

```powershell
streamlink "url" best --niconico-email "EMAIL" --niconico-password "PASSWORD" -o "filename.ts"
```

Notice:

1. **DO NOT** open the same streaming page once you started the recording, it will broke the record session
2. You **MUST** put the `--niconico-email` and `--niconico-password` before `-o` or it won't work
3. I personally don't suggest recording the Niconico stream during live, the network might broke up when switching from free to paid corner

If you don't want to type your `EMAIL` and `PASSWORD` here, you can use `--niconico-user-session` instead. You can extract the cookies by using `cookies.txt` plugin.

### 🚩 Stream Recorder

This is a plugin which can directly grab the stream. It did a great job in the **SUISEI "POWER" LIVE**. I successfully saved the live-record edition using this plugin.

The details were written in the plugin, **read before use**, *the plugin does not support encrypted HLS stream*. You might have to refresh and grab for several times until you see the higher resolution. 

> Be careful, don't refresh the streaming page or the recording session will interupt.

And it does not work with `YouTube`, so you still need `streamlink`.
