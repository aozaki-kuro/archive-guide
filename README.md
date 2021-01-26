## 📢 THE MOST IMPORTANT THING

IF YOU ARE HAVING ANY PROBLEMS, READ THE `README.MD` IN EVERY REPO FIRST

## 🔨 Tool Preparation

#### \> Download

1. youtube-dl - general purpose video downloader [[Github](https://github.com/ytdl-org/youtube-dl)]
2. streamlink - stream recording tool [[Github](https://github.com/streamlink/streamlink)]
3. auto monitor-download script [[Github](https://github.com/lovezzzxxx/liverecord)]
4. aria2 - download accelerating
5. Stream Recorder - stream recording tool [[Chrome Store](https://chrome.google.com/webstore/detail/stream-recorder-download/iogidnfllpdhagebkblkgbfijkbkjdmm)]

#### \> Processing

1. ffmpeg [[Github](https://github.com/FFmpeg/FFmpeg)]
2. AtomicParsley

#### \> Upload

1. OneDriveUploader [[Github](https://github.com/MoeClub/OneList/tree/master/OneDriveUploader)] or Google Drive Sync [[Github](https://github.com/dtsvetkov1/Google-Drive-sync)]
2. rclone (optional) [[Github](https://github.com/rclone/rclone)]

## 🎬 Virtual Server Enviroment Preparation

The whole process in an [Amazon Lightsail](https://lightsail.aws.amazon.com/) VPS, using Ubuntu 20.04 LTS.

Local environment is Windows 10 with WSL 2 (Ubuntu 20.04 LTS)

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
sudo pip3 install --upgrade streamlink
sudo apt install ffmpeg
sudo apt install atomicparsley
sudo apt install aria2
```

6. About the OneDriveUploader, it only has a Chinese guide so I will write a brief English one about this.

    Download the file from [here](https://github.com/MoeClub/OneList/tree/master/OneDriveUploader/amd64/linux), then upload it by using Winscp to a folder like `/home/ubuntu/OneDriveUploader`.

    Copy it to the `/bin/` folder. Once you are done you should test running the command to see if it's taking effect.
    ```bash
    sudo cp OneDriveUploader /usr/local/bin/OneDriveUploader
    sudo chmod a+rx /usr/local/bin/OneDriveUploader
    ```

    Since we are using OneDrive Business then click [this link](https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=78d4dc35-7e46-42c6-9023-2d39314433a5&response_type=code&redirect_uri=http://localhost/onedrive-login&response_mode=query&scope=offline_access%20User.Read%20Files.ReadWrite.All) to get an url, then read below to start the config

    ```bash
    OneDriveUploader -a "url" #replace the url part
    ```

## ✨ Usage

### Downloading

#### 1. Youtube-dl

Should be the mostly used tool to download youtube-dl videos. Simple as it is.

```bash
youtube-dl "url"
```

But I prefer having it configured and accelarte the download with `aria2`. Here is my configuration:

```bash
--external-downloader aria2c --external-downloader-args "-x 16 -k 1M"

-o '/home/ubuntu/raw/(upload_date)s %(title)s.%(ext)s'

--embed-thumbnail

--format 'bestvideo[vcodec^=avc1]+bestaudio[ext=m4a]/best/mp4'

--add-metadata

--cookies '/home/ubuntu/cookies.txt'
```

Putting a `cookies.txt` option helps downloading the member-only contents.

Also the config takes 2 times of writing files which might take longer.

> Downloaded video and audio → Merged .mp4 file → Write thumbnail with AtomicParsley

#### 2. Streamlink

For **no-archive** streams youtube-dl doesn't work. We should use streamlink instead.

```bash
streamlink "url" best -o "filename.ts" # Name the filename as `.ts`, not `.mp4`
```

Streamlink works for niconico with options provided.

```sh
streamlink "url" best -o "filename.ts" --niconico-email "EMAIL" --niconico-password "PASSWORD"
```

For AbemaTV, streamlink also works. But somehow it's a little bit slow. You can also use `yuu` instead [[Github](https://github.com/noaione/yuu)].

#### 3. Stream Recorder

This is a plugin which can directly grab the stream. It did a great job in the **SUISEI "POWER" LIVE**. I successfully saved the live-record edition using this plugin.

The details were written in the plugin, **read before use**, *the plugin does not support encrypted HLS stream*. You might have to refresh and grab for several times until you see the higher resolution. 

> Be careful, don't refresh the streaming page or the recording session will interupt.

And it does not work with `YouTube`, so you still need `streamlink`.

#### 4. Auto Monitor-Download Script

It's just a script, but the options are pretty complicated and was in Chinese so I will provide the lines I'm using.

```bash
nohup record/record_new.sh youtube "youtube_account_id" -f best -l 10 -o "auto_record" -dt 1 &
```

The `-l` is the looping option, means recheck the streaming status in every 10 seconds. I suggest having a dry run before running this.

---

### Uploading

You can use `rclone` instead if you want to upload everything to a Google Drive, but it's somehow complicated so read the official guide before processing.

In this project I use `OneDriveUploader` since I stored everything in a 5TB OneDrive Business Account.

```bash
OneDriveUploader -s raw -r / # upload "raw" folder to the root
```

---

### Tag the thumbnail

The only way to tag a thumbnail is by using `AtomicParsley`.

The process is like this:

> Downloaded .ts file → Use ffmpeg to convert into .mp4 file → Write thumbnail with AtomicParsley

This is how it works
```bash
ffmpeg -i "input.ts" -vcodec copy "output.mp4"
AtomicParsley "output.mp4" --artwork "cover.jpg" --overWrite
```

## 🤔 Tips

### Running Tasks in the Background

Processes will terminated if the network interrupt and logged out. So I suggest use `nohup` to keep it running, add an `&` to let the command run whatever happens.

```bash
nohup youtube-dl "url" &
```

If you want to check the output, you can use `tail` command.

```bash
tail -l nohup.out
```

Use `Ctrl + C` to terminate the command.

### Upper Case

Be careful, commands in Ubuntu are case sensitive, if you cannot run the command please check.

### Renaming

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

### YouTube Video Encoding

FYI YouTube needs time to encode the archive after the stream ended. You can download with `youtube-dl` right after with 1 thread enabled.

You can also wait for _30 minutes to serveral hours_ (depending on the length of the stream), when you see the comments and superchats are back, that means the archive has been encoded. At this point you can use `youtube-dl` along with `aria2` to download much faster in 5~10 threads enabled.

Also, if the stream is **longer than 2 hours** and you didn't started recording it from the beginning, `youtube-dl` can just download the **last 2 hours' part** as soon as the stream ended. You have to wait until the whole archive finished encoding, then you can grab a intact archive.
