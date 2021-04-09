## ☁ OneDrive and other cloud storage provider

Since not every has a NAS filled with 32TB hardrive running at home, local storage space can run low if you put everything in it. I suggest OneDrive / OneDrive for Business if you have a Microsoft 365 subscription.

It also works for Google Drive or even Amazon S3 / Backblaze if you are rich enough.

### ☁ Uploading

In this project I use `OneDriveUploader` since I stored everything in a 5TB OneDrive Business Account, but you can use whichever cloud storage service you like.

<details>

<summary>For Windows 10 users</summary>

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

</details>

<details>

<summary>For Ubuntu users</summary>

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

</details>

You can use `rclone` instead if you want to, but it comsumes more memory and somehow complicated to config.

So if you are going to use `rclone`, read the [official guide](https://rclone.org/onedrive/) carefully before processing.

### ⚠ Invalid file names

OneDrive/Sharepoint has a strict file name requirement, but it's basically the same as Windows 10.

- Do not use `" * : < > ? / \ |`
- File size limit is below 100GB
- The entire file path, including the file name, should be less than 400 characters

See also: [Invalid file names and file types in OneDrive and SharePoint - Microsoft](https://support.microsoft.com/en-us/office/invalid-file-names-and-file-types-in-onedrive-and-sharepoint-64883a5d-228e-48f5-b3d2-eb39e07630fa)

If you are using `rclone`, the file will be auto renamed, see also [Restricted filename characters - Rclone](https://rclone.org/onedrive/#restricted-filename-characters)
