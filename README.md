<div align="center">
  <image src="assets/comet.png" alt="comet" width="150px" />
  <h3>Brief Archive Guide for Hoshiyomis</h3>
  <em>Treasure every moment of our dear comet.</em>
</div>

---

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) [![made-with-Markdown](https://img.shields.io/badge/Made%20with-Markdown-1f425f.svg)](http://commonmark.org) [![last-commit](https://img.shields.io/github/last-commit/aozaki-kuro/archive-guide)](https://github.com/aozaki-kuro/archive-guide)

## 📢 IMPORTANT

IF YOU HAVE ANY PROBLEMS, READ THE `README.MD` IN EVERY REPO FIRST.

[![Windows10](https://img.shields.io/badge/Windows%2010-20H2-blue)](https://www.microsoft.com/en-us/software-download/windows10)

**If you are using Windows 10 only, please check the [Windows ver Guide](README-Windows.md).**

If you need to download a paid archive, please check the [Paid archive Guide](README-Paid.md).

## 🔨 Tool Preparation

#### 📁 Download

- youtube-dl - general purpose video downloader [[Github](https://github.com/ytdl-org/youtube-dl)]
- streamlink - stream recording tool [[Github](https://github.com/streamlink/streamlink)]
- auto monitor-download script [[Github](https://github.com/lovezzzxxx/liverecord)]
- aria2 - download accelerating [[Github](https://github.com/aria2/aria2)]
- Stream Recorder - stream recording tool [[Chrome Store](https://chrome.google.com/webstore/detail/stream-recorder-download/iogidnfllpdhagebkblkgbfijkbkjdmm)]

#### 📁 Processing

- ffmpeg [[Github](https://github.com/FFmpeg/FFmpeg)] [[Guide Here](http://blog.gregzaal.com/how-to-install-ffmpeg-on-windows/)]
- AtomicParsley [[Github](https://github.com/wez/atomicparsley)]

#### 📁 Upload

- OneDriveUploader [[Github](https://github.com/MoeClub/OneList/tree/master/OneDriveUploader)] or Google Drive Sync [[Github](https://github.com/dtsvetkov1/Google-Drive-sync)]
- rclone (optional) [[Github](https://github.com/rclone/rclone)]

## 🎬 Virtual Server Enviroment Preparation

[![ubuntu](https://img.shields.io/badge/Ubuntu-20.04%20LTS-orange)](https://releases.ubuntu.com/20.04/) 

I'm running the jobs on [Amazon Lightsail](https://lightsail.aws.amazon.com/). Local environment is Windows 10 with WSL 2.

Read the guide about how to install WSL 2: [Link](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

Preparing the environment is pretty much the same on the VPS and the WSL. I will be writing the preparation on the VPS.

1. Generate a pair of SSH keys (if you do not know what it is, a password is okay).
2. Create a VPS and upload your SSH public key.
3. Connect to your VPS through SSH
4. Update first

```sh
sudo apt update
sudo apt upgrade -y
```

5. Run the [script](https://github.com/lovezzzxxx/liverecord) and it will setup the environment automatically. If you want to setup the environment manually, see below (I wish I know how to make a docker)

```sh
sudo apt install python3
sudo apt install python3-pip
sudo -H pip3 install --upgrade youtube-dl #sudo is required
sudo -H pip3 install --upgrade streamlink
sudo apt install ffmpeg
sudo apt install atomicparsley
sudo apt install aria2
```

## ✨ Usage

### 🚩 Youtube-dl

Should be the mostly used tool to download youtube-dl videos. Simple as it is.

```sh
youtube-dl "url"
```

But I prefer having it configured and accelarte the download with `aria2`. Here is my configuration:

```sh
--external-downloader aria2c --external-downloader-args "-x 16 -k 1M"

-o '/home/ubuntu/raw/(upload_date)s %(title)s.%(ext)s'

--embed-thumbnail

--format 'bestvideo[vcodec^=avc1]+bestaudio[ext=m4a]/best/mp4'

--add-metadata

--cookies '/home/ubuntu/cookies.txt'
```

※ Replace `/home/ubuntu/` and `/home/ubuntu/raw` with your own working directories.

Save it as `youtube-dl.conf` in e.g. `/home/ubuntu/youtube-dl.conf`. Then use `sudo cp youtube-dl /etc/youtube-dl.conf` to make it a system-wide config.

Putting a `--cookies cookies.txt` option helps downloading the member-only contents.

> To get a `cookies.txt` using the plugin: [[Chrome](https://chrome.google.com/webstore/detail/get-cookiestxt/bgaddhkoddajcdgocldbbfleckgcbcid)] [[Firefox](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/)]

Also, the config takes 3 times of writing files which might take longer. *Wait patiently.*

> Downloaded video and audio → Merged .mp4 file → Write metadata → Write thumbnail with AtomicParsley

### 🚩 Streamlink

For **No Archive** streams youtube-dl doesn't work. We should use streamlink instead.

```sh
streamlink "url" best -o "filename.ts" # Name the filename as .ts, not .mp4
```

Streamlink works for niconico with options provided.

```sh
streamlink "url" best -o "filename.ts" --niconico-email "EMAIL" --niconico-password "PASSWORD"
```

For AbemaTV, streamlink also works. But somehow it's a little bit slow. You can also use `yuu` instead [[Github](https://github.com/noaione/yuu)].

### 🚩 Stream Recorder

This is a plugin which can directly grab the stream. It did a great job in the **SUISEI "POWER" LIVE**. I successfully saved the live-record edition using this plugin.

The details were written in the plugin, **read before use**, *the plugin does not support encrypted HLS stream*. You might have to refresh and grab for several times until you see the higher resolution. 

> Be careful, don't refresh the streaming page or the recording session will interupt.

And it does not work with `YouTube`, so you still need `streamlink`.

### 🚩 Auto Monitor-Download Script

It's just a script, but the options are pretty complicated and was in Chinese so I will provide the lines I'm using.

```sh
nohup record/record_new.sh youtube "youtube_account_id" -f best -l 10 -o "auto_record" -dt 1 &
```

The `-l` is the looping option, means recheck the streaming status in every 10 seconds. I suggest having a dry run before running this.

---

### ☁ Uploading

In this project I use `OneDriveUploader` since I stored everything in a 5TB OneDrive Business Account.

```sh
wget https://raw.githubusercontent.com/MoeClub/OneList/master/OneDriveUploader/amd64/linux/OneDriveUploader -P /usr/local/bin/
sudo chmod a+rx /usr/local/bin/OneDriveUploader
```
Once you are done you should test running the command to see if it's taking effect.

If you are using OneDrive for Business, click [this link](https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=78d4dc35-7e46-42c6-9023-2d39314433a5&response_type=code&redirect_uri=http://localhost/onedrive-login&response_mode=query&scope=offline_access%20User.Read%20Files.ReadWrite.All) to get an url, then read below to start the config

```sh
OneDriveUploader -a "url" #replace the url part
```

e.g. Upload the `raw` folder to OneDrive root

```sh
OneDriveUploader -s raw -r / # upload "raw" folder to the root
```

You can use `rclone` instead if you want to, but it comsumes more memory and somehow complicated to config.

So if you are going to use `rclone`, read the [official guide](https://rclone.org/onedrive/) carefully before processing.

---

### 📌 Tag a Thumbnail

The only way to tag a thumbnail to `.mp4` file is by using `AtomicParsley`.

The process is like this

> Downloaded .ts file → Use ffmpeg to convert into .mp4 file → Write thumbnail with AtomicParsley

This is how it works

```sh
ffmpeg -i "input.ts" -vcodec copy "output.mp4"
AtomicParsley "output.mp4" --artwork "cover.jpg" --overWrite
```

## 🤔 Tips & FAQs

### ⚠ OBS

DON'T USE OBS TO RECORD THE SCREEN.

No purpose doing this, if you have read the guide. Also OBS doesn't work for _DRM protected_ contents.

### ⚠ Running Tasks in the Background

Processes will terminated if the network interrupt and logged out. So I suggest use `nohup` to keep it running, add an `&` to let the command run whatever happens.

```sh
nohup youtube-dl "url" &
```

If you want to check the output, you can use `tail` command.

```sh
tail -l nohup.out
```

Use `Ctrl + C` to terminate the command.

To kill a process running in background

```sh
ps aux | grep -i "keyword"
kill "process_id"
```

### ⚠ Upper Case

Be careful, commands in Ubuntu are case sensitive, if you cannot run the command please check.

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
