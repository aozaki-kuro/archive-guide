## 🤔 Tips & FAQs

### ⚠ OBS

DON'T USE OBS TO RECORD THE SCREEN.

No purpose doing this, if you have read the guide. Also OBS doesn't work for _DRM protected_ contents.

### ⚠ Running Tasks in the Background (Ubuntu)

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

### ⚠ YouTube Video Encoding

FYI YouTube needs time to encode the archive after the stream ended. You can download with `youtube-dl` right after with 1 thread enabled.

You can also wait for _30 minutes to serveral hours_ (depending on the length of the stream), when you see the comments and superchats are back, that means the archive has been encoded. At this point you can use `youtube-dl` along with `aria2` to download much faster in 5~10 threads enabled.

Also, if the stream is **longer than 2 hours** and you didn't started recording it from the beginning, `youtube-dl` can just download the **last 2 hours' part** as soon as the stream ended. You have to wait until the whole archive finished encoding, then you can grab a intact archive.

## 🔰 Issues

If you are having more questions, please [open an issue](https://github.com/aozaki-kuro/archive-guide/issues/new?assignees=&labels=question&template=questions.md&title=%5BQuestion%5D+) using the \[Question\] template.
