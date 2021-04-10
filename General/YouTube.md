## 🔨 Tool Preparation

- youtube-dl - general purpose video downloader [[Github](https://github.com/ytdl-org/youtube-dl)]
- aria2 - download accelerating [[Github](https://github.com/aria2/aria2)]
- ffmpeg [[Github](https://github.com/FFmpeg/FFmpeg)] [[Guide Here](http://blog.gregzaal.com/how-to-install-ffmpeg-on-windows/)]
- AtomicParsley [[Github](https://github.com/wez/atomicparsley)]

## 🔨 Easy Usage with Easy Scripts

**※ If you don't want to do the configuration yourself, you can use the scripts provided [here](/scripts)**

Just paste the .bat files into the same folder as youtube-dl.exe (see picture below) and double click the .bat file to run. These scripts only provide barebones use of the tools, so if you want to use additional arguments, you will need to keep reading.

![directory](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/dir1.PNG)

The video link can be a YouTube video, stream, or playlist link.

To download members-only streams, paste/replace the cookies.txt file in the folder with the correct cookies.txt file.

Note: `youtube-dl` works for most streams in general, but for **No-archive** streams you need to use streamlink to record live.

## 🎪 Windows Environment Preparation

[![Windows10](https://img.shields.io/badge/Windows%2010-20H2-blue)](https://www.microsoft.com/en-us/software-download/windows10)

**※ If you are working on a headless server like I do, please read the [advanced guide](/Advanced/server.md)**

First of all, you should setup a `PATH` folder to tell the Windows where to find the programs.

Run Command Prompt (cmd) as administrator. Then paste the following into the console

```powershell
setx /M PATH "%PATH%;<REPLACE THIS WITH THE PATH TO YOUR DIRECTORY>"
```
The `REPLACE THIS WITH THE PATH TO YOUR DIRECTORY` part should be the folder want to save the tools. In [this case](/assets/dir1.PNG) it sould be "J:\Youtube Downloading"

Once you are done, put the tools in the folder. Start cmd (doesn't not have to be as administrator) and run the commands `youtube-dl --help` or `streamlink -h` etc. If you see a giant block of text showing you the arguments, that means it's working.

Tips: 

> If you are not sure about how to download things on Github, just check the `releases` on the right of the page.
>
> Select the .exe file or the package having "windows" or "amd64" in it.

Another alternative way to install these are by using `pip3`. Just install `python` [link](https://www.python.org/) and type `pip3 install youtube-dl` and `pip3 install streamlink`.

## Usage

## 🚩 Youtube-dl

Usage is simple.

```powershell
youtube-dl "url"
```
If ffmpeg is in the same folder as youtube-dl, it will automatically download the best video and audio quality and merge it as a .mkv video file.

Alternatively, I prefer having it configured to download an .mp4 video, and accelerate the download with `aria2`. Here is my configuration:

```powershell
--external-downloader aria2c --external-downloader-args "-x 16 -k 1M"

-o 'D:\Download\youtube\(upload_date)s %(title)s.%(ext)s'

--embed-thumbnail

--format 'bestvideo[vcodec^=avc1]+bestaudio[ext=m4a]/best/mp4'

--add-metadata

--cookies 'D:\Download\youtube\cookies.txt'
```

**Notice: when you are downloading generic .m3u8 files from sites like SPWN, don't use `aria2` (add a `#` before the first line)**

Then save it as `youtube-dl.conf` in `%APPDATA%\youtube-dl\config.txt` or `C:\Users\<user name>\youtube-dl.conf`, `youtube-dl.exe` will read the config from here.

Putting a `--cookies` option helps downloading the member-only contents.

Also, the config takes 3 times of writing files which might take longer. *Wait patiently.*

> Downloaded video and audio → Merged .mp4 file → Write metadata → Write thumbnail with AtomicParsley

#### Member Streams

To download member streams, you will need the **cookies.txt** extension. Go to the member stream you want to download and grab the "Current Site" cookies. This will prompt you to save a `cookies.txt` file on your computer. The `--cookies` argument is used to point the location of the `cookies.txt` file. The same file is also used for the Easy Scripts above.

### 🚩 Streamlink

For **No Archive** streams youtube-dl doesn't work. We should use streamlink instead.

**※ If you don't want to do the configure yourself, you can use the scripts provided [here](/scripts)**

```powershell
streamlink "url" best -o "D:\filename.ts" # Name the filename .ts, not .mp4
```

Streamlink works for niconico with options provided.

```powershell
streamlink "url" best --niconico-email "EMAIL" --niconico-password "PASSWORD" -o "filename.ts"
```

For AbemaTV, streamlink also works. But somehow it's a little bit slow. You can also use `yuu` instead [[Github](https://github.com/noaione/yuu)].
