<div align="center">
  <image src="assets/comet.png" alt="comet" width="150px" />
  <h3>Paid Archive Guide for Hoshiyomis</h3>
  <em>Treasure every moment of our dear comet.</em>
</div>

---

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) [![made-with-Markdown](https://img.shields.io/badge/Made%20with-Markdown-1f425f.svg)](http://commonmark.org) [![last-commit](https://img.shields.io/github/last-commit/aozaki-kuro/archive-guide)](https://github.com/aozaki-kuro/archive-guide)

### Tools you need

First, you have to have youtube-dl set up on your system. Check the [Windows ver Guide](README-Windows.md) for details on how to set up.

Alternatively, you can use the Easy Scripts provided [here](scripts).

Or if you're really lazy, you can click and drag youtube-dl.exe into your command console to use it too:

![cmd drag](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/clickdrag.PNG)

Next, you will need the cookies.txt extension for your browser.
- cookies.txt [[Chrome](https://chrome.google.com/webstore/detail/get-cookiestxt/bgaddhkoddajcdgocldbbfleckgcbcid)] [[Firefox](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/)]

### Getting the .m3u8 video link

First, go to the actual stream (where the video is played) and do the following steps:
- Pause the stream
- Make sure your timestamp is at 0:00
- Set the quality of the video to something you **do not** want to download

Your stream should look something like this:

![step1](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/vcst1.PNG)

Next, press F12 on your keyboard to bring up developer console for your browser. Click on the "Network" tab on the top.

![step2](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/networktab.PNG)

On the stream itself, pick the quality you want to download. **Switching qualities will cause the .m3u8 link to generate.** Don't play the stream yet. Your developer console should have generated a few lines in it. (Make sure the .m3u8 link is actually showing you the correct quality you're trying to download)

![step3](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/1080.PNG)

![generated](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/generate.PNG)

Right click the .m3u8 link, and select Copy>Copy URL. **This is the URL to the actual video source, so make sure you write it down somewhere**

![step4](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/networkf1112.PNG)

### Grab cookies.txt

Make sure you have the cookies.txt extension installed on your browser (link above). Now click on the plugin icon, and select "Current Site." You can save the `cookies.txt` file anywhere you like

![cookies](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/cookiestxt.PNG)

### Actually downloading the video

Now that you have the .m3u8 link and the `cookies.txt`, we are ready to use `youtube-dl` to download the video. 

Use this template to download the video. Replace the stuff in () with the appropriate content you got from earlier

**youtube-dl (the .m3u8 link from earlier) --cookies (the cookies.txt file from earlier) -o "(path to where you want to save the video)"**

You can drag `youtube-dl.exe` and the `cookies.txt` file to your cmd to get the exact path easy

![cmd drag](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/clickdrag.PNG)

Your command should look something like this

![example](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/3171285238.PNG)

Now press enter and the download should start. Wait a bit and you should see the video in the path you specified above.

If you can't find the video, chances are it's probably in whatever folder this says

![cmddefault](https://github.com/aozaki-kuro/archive-guide/blob/main/assets/cmddefault.PNG)
