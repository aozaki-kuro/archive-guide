<div align="center">
  <image src="assets/comet.png" alt="comet" width="150px" />
  <h3>Brief Archive Guide for Hoshiyomis</h3>
  <em>Treasure every moment of our dear comet.</em>
</div>

---

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) [![made-with-Markdown](https://img.shields.io/badge/Made%20with-Markdown-1f425f.svg)](http://commonmark.org) [![last-commit](https://img.shields.io/github/last-commit/aozaki-kuro/archive-guide)](https://github.com/aozaki-kuro/archive-guide)

## 📢 IMPORTANT

IF YOU HAVE ANY PROBLEMS, READ THE `README.MD` IN EVERY REPO FIRST.

## 🔨 Tool Preparation

#### 📁 Download

- youtube-dl - general purpose video downloader [[Github](https://github.com/ytdl-org/youtube-dl)]
- streamlink - stream recording tool [[Github](https://github.com/streamlink/streamlink)]
- auto monitor-download script [[Github](https://github.com/lovezzzxxx/liverecord)]
- aria2 - download accelerating [[Github](https://github.com/aria2/aria2)]
- Stream Recorder - stream recording tool [[Chrome Store](https://chrome.google.com/webstore/detail/stream-recorder-download/iogidnfllpdhagebkblkgbfijkbkjdmm)]

#### 📁 Processing

- ffmpeg [[Download](https://ffmpeg.org/download.html)]
- AtomicParsley [[Github](https://github.com/wez/atomicparsley)]

**※The folders should be placed in the same folder as youtube-dl.exe [like this](assets/dir1.PNG)**

#### 📁 Upload

- OneDriveUploader [[Github](https://github.com/MoeClub/OneList/tree/master/OneDriveUploader)] or Google Drive Sync [[Github](https://github.com/dtsvetkov1/Google-Drive-sync)]
- rclone (optional) [[Github](https://github.com/rclone/rclone)]

## 🔨 Easy Usage with Easy Scripts!!!

**※ If you don't want to do the configuration yourself, you can use the scripts provided [here](scripts)**

Just paste the .bat files into the same folder as youtube-dl.exe [like this](assets/dir1.PNG) and double click the .bat file to run. These scripts only provide barebones use of the tools, so if you want to use additional arguments, you will need to keep reading.

To download members only streams, paste/replace the cookies.txt file in the folder with the correct cookies.txt file.

Note: youtube-dl works for most streams in general, but for **No-archive** streams you need to use streamlink to record live.

## 🎪 Windows Environment Preparation

[![Windows10](https://img.shields.io/badge/Windows%2010-20H2-blue)](https://www.microsoft.com/en-us/software-download/windows10)

First of all, you should setup a `PATH` folder to tell the Windows where to find the programs.

Run Command Prompt (cmd) as administrator. Then paste the following into the console

```powershell
setx /M PATH "%PATH%;<REPLACE THIS WITH THE PATH TO YOUR DIRECTORY>"
```
The `REPLACE THIS WITH THE PATH TO YOUR DIRECTORY` part should be the folder want to save the tools. In [this case](assets/dir1.PNG) it sould be "J:\Youtube Downloading"

Once you are done, put the tools in the folder. Start cmd (doesn't not have to be as administrator) and run the commands `youtube-dl --help` or `streamlink -h` etc. If you see a giant block of text showing you the arguments, that means it's working.

Tips: 

> If you are not sure about how to download things on Github, just check the `releases` on the right of the page.
>
> Select the .exe file or the package having "windows" or "amd64" in it.

Another alternative way to install these are by using `pip3`. Just install `python` [link](https://www.python.org/) and type `pip3 install youtube-dl` and `pip3 install streamlink`.

## ✨ Usage

### 🚩 Youtube-dl

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

**The -o argument is for the folder you want to download the streams to! Remember to replace the download directory according to our own system!**

Then save it as `youtube-dl.conf` in `%APPDATA%\youtube-dl\config.txt` or `C:\Users\<user name>\youtube-dl.conf`, `youtube-dl.exe` will read the config from here.

Putting a `--cookies` option helps downloading the member-only contents.

Also, the config takes 3 times of writing files which might take longer. *Wait patiently.*

> Downloaded video and audio → Merged .mp4 file → Write metadata → Write thumbnail with AtomicParsley

### 🚩 Streamlink

For **No Archive** streams youtube-dl doesn't work. We should use streamlink instead.

**※ If you don't want to do the configure yourself, you can use the scripts provided [here](scripts)**

```powershell
streamlink "url" best -o "D:\filename.ts" # Name the filename .ts, not .mp4
```

Streamlink works for niconico with options provided.

```powershell
streamlink "url" best -o "filename.ts" --niconico-email "EMAIL" --niconico-password "PASSWORD"
```

For AbemaTV, streamlink also works. But somehow it's a little bit slow. You can also use `yuu` instead [[Github](https://github.com/noaione/yuu)].

### 🚩 Stream Recorder

For other streaming playforms, this is a plugin which can directly grab the stream. It did a great job in the **SUISEI "POWER" LIVE**. I successfully saved the live-record edition using this plugin.

The details were written in the plugin, **read before use**, *the plugin does not support encrypted HLS stream*. You might have to refresh and grab for several times until you see the higher resolution. 

> Be careful, don't refresh the streaming page or the recording session will be interuptted.

Reminder that it does not work with `YouTube`, so you still need `streamlink` for no-archive Youtube streams.

---

### ☁ Uploading

In this project I use `OneDriveUploader` since I stored everything in a 5TB OneDrive Business Account, but you can use whichever cloud storage service you like.

Download the `.exe` file from [here](https://github.com/MoeClub/OneList/blob/master/OneDriveUploader/amd64/win/OneDriveUploader.exe) and put it in your `PATH` folder.

Once you are done you should test running the command to see if it's taking effect.

If you are using OneDrive for Business, click [this link](https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=78d4dc35-7e46-42c6-9023-2d39314433a5&response_type=code&redirect_uri=http://localhost/onedrive-login&response_mode=query&scope=offline_access%20User.Read%20Files.ReadWrite.All) to get an url, then read below to start the config

```powershell
OneDriveUploader -a "url" #replace the url part
```

e.g. Upload the `raw` folder to OneDrive root

```powershell
OneDriveUploader -s D:\suisei -r / # upload "raw" folder to the root
```

You can use `rclone` instead if you want to, but it comsumes more memory and somehow complicated to config.

So if you are going to use `rclone`, read the [official guide](https://rclone.org/onedrive/) carefully before processing.

---

### 📌 Tag a Thumbnail

The only way to tag a thumbnail to `.mp4` file is by using `AtomicParsley`.

The process is like this

> Downloaded .ts file → Use ffmpeg to convert into .mp4 file → Write thumbnail with AtomicParsley

This is how it works

```powershell
ffmpeg -i "input.ts" -vcodec copy "output.mp4"
AtomicParsley "output.mp4" --artwork "cover.jpg" --overWrite
```

## 🤔 Tips & FAQs

### ⚠ OBS

DON'T USE OBS TO RECORD THE SCREEN.

No purpose doing this, if you have read the guide. Also OBS doesn't work for _DRM protected_ contents.

### ⚠ Renaming

I'm using `Renamer.exe` or modify the filename manually. I will write about the naming style:

```
20210120 【テトリス99】順位でガチャ配信の課金額が決まる⁉【ホロライブ _ 星街すいせい】.mp4
```

Delete the space between the date and the `【`, preserve the space if there is no `【`.

Then delete the `【ホロライブ _ 星街すいせい】` part 

(I'm doing this recently to shorten the filename, avoid css style error in the archving site)

The final output should be like this

```
20210120【テトリス99】順位でガチャ配信の課金額が決まる⁉.mp4
```

### ⚠ Invalid file names

OneDrive/Sharepoint has a strict file name requirement, but it's basically the same as Windows 10.

- Do not use `" * : < > ? / \ |`
- File size limit is below 100GB
- The entire file path, including the file name, should be less than 400 characters

See also: [Invalid file names and file types in OneDrive and SharePoint - Microsoft](https://support.microsoft.com/en-us/office/invalid-file-names-and-file-types-in-onedrive-and-sharepoint-64883a5d-228e-48f5-b3d2-eb39e07630fa)

If you are using `rclone`, the file will be auto renamed, see also [Restricted filename characters - Rclone](https://rclone.org/onedrive/#restricted-filename-characters)

### ⚠ YouTube Video Encoding

FYI YouTube needs time to encode the archive after the stream ended. You can download with `youtube-dl` right after with 1 thread enabled.

You can also wait for _30 minutes to serveral hours_ (depending on the length of the stream), when you see the comments and superchats are back, that means the archive has been encoded. At this point you can use `youtube-dl` along with `aria2` to download much faster in 5~10 threads enabled.

Also, if the stream is **longer than 2 hours** and you didn't started recording it from the beginning, `youtube-dl` can just download the **last 2 hours' part** as soon as the stream ended. You have to wait until the whole archive finished encoding, then you can grab a intact archive.

## 🔰 Issues

If you are having more questions, please [open an issue](https://github.com/aozaki-kuro/archive-guide/issues/new?assignees=&labels=question&template=questions.md&title=%5BQuestion%5D+) using the \[Question\] template.
