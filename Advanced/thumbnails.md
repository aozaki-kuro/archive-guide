## 📌 Tag a Thumbnail

The only way to tag a thumbnail to `.mp4` file is by using `AtomicParsley`.

The process is like this

> Downloaded .ts file → Use ffmpeg to convert into .mp4 file → Write thumbnail with AtomicParsley

This is how it works on Ubuntu, same command will work in Powershell.

```bash
ffmpeg -i "input.ts" -vcodec copy "output.mp4" # Convert .ts or .mkv file into .mp4
AtomicParsley "output.mp4" --artwork "cover.jpg" --overWrite # Attach cover.jpg and overwrite
```
