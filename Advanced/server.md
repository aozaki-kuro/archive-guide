## 📖 The Reason for Using a Server

Virtual servers are running in server rooms with a way more stable condition and usually faster Internet connection speed. You can also run the job and forget about it / prevent the job being interupted by your own expected moves.

## 🎬 Virtual Server Enviroment Preparation

[![ubuntu](https://img.shields.io/badge/Ubuntu-20.04%20LTS-orange)](https://releases.ubuntu.com/20.04/) 

I'm running the jobs on [Amazon Lightsail](https://lightsail.aws.amazon.com/). Local environment is Windows 10 with WSL 2.

Read the guide about how to install WSL 2: [Link](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

Preparing the environment is pretty much the same on the VPS and the WSL. I will be writing the preparation on the VPS.

1. Generate a pair of SSH keys (if you do not know what it is, a password is okay).
2. Create a VPS and upload your SSH public key.
3. Connect to your VPS through SSH
4. Update first

```bash
sudo apt update
sudo apt upgrade -y
```

5. Run the [script](https://github.com/lovezzzxxx/liverecord) and it will setup the environment automatically. If you want to setup the environment manually, see below (I wish I know how to make a docker)

```bash
sudo apt install python3
sudo apt install python3-pip
sudo -H pip3 install --upgrade youtube-dl #sudo is required
sudo -H pip3 install --upgrade streamlink
sudo apt install ffmpeg
sudo apt install atomicparsley
sudo apt install aria2
```

## Usage

### 🚩 Youtube-dl

Should be the mostly used tool to download youtube-dl videos. Simple as it is.

```bash
youtube-dl "url"
```

But I prefer having it configured and accelarte the download with `aria2`. Here is my configuration:

```bash
--external-downloader aria2c --external-downloader-args "-x 16 -k 1M"

-o '/home/ubuntu/raw/(upload_date)s %(title)s.%(ext)s'

--embed-thumbnail

--format 'bestvideo+bestaudio/best/mp4'

--merge-output-format mp4

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

```bash
streamlink "url" best -o "filename.ts" # Name the filename as .ts, not .mp4
```

Streamlink works for niconico with options provided.

```bash
streamlink "url" best --niconico-email "EMAIL" --niconico-password "PASSWORD" -o "filename.ts"
```

For AbemaTV, streamlink also works. But somehow it's a little bit slow. You can also use `yuu` instead [[Github](https://github.com/noaione/yuu)].

### 🚩 Auto Monitor-Download Script

It's just a script, but the options are pretty complicated and was in Chinese so I will provide the lines I'm using.

```bash
nohup record/record_new.sh youtube "youtube_account_id" -f best -l 10 -o "auto_record" -dt 1 &
```

The `-l` is the looping option, means recheck the streaming status in every 10 seconds. I suggest having a dry run before running this.
