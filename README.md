# winservehttp
A script to add a new option to your right-click context menu for directories, which instantly starts an HTTP file server that serves to your local network. Additionally also creates an `.m3u` playlist files so you can use a video player of your choice to play through the videos in present in the serving folder.

## REQUIREMENTS
1. Windows 11
2. [Node.js](https://nodejs.org/en)
3. [git](https://git-scm.com/)

## INSTALL

### 1. CLONE this repository
Enter the following command into a terminal.
```
git clone https://github.com/asr1191/winservehttp.git
```
#### OR

Click the green button named `<> Code` at the top of this webpage, and download the zip version and extract it.

### 2. INSTALL `http-server`
This script uses the [http-server](https://www.npmjs.com/package/http-server) package to serve. Therefore, we install it globally. I could've also used `npx` now that I think about it.

```
node install -g http-server
```

### 3. RUN `install.ps1`
You can do so by just right-clicking on the file and selecting `Run with Powershell`
