<div align="center">
      <h1> <img src="https://github.com/sj-15/tech_intern23/blob/main/tictactoe/assets/tictactoe.jpg" width="80px"><br/>Multiplayer Tic-Tac-Toe game</h1>
     </div>
<p align="center"> <a href="SJ creations " target="_blank"><img alt="" src="https://img.shields.io/badge/Website-EA4C89?style=normal&logo=dribbble&logoColor=white" style="vertical-align:center" /></a> <a href="https://www.linkedin.com/in/sourav-jana-339062215}" target="_blank"><img alt="" src="https://img.shields.io/badge/LinkedIn-0077B5?style=normal&logo=linkedin&logoColor=white" style="vertical-align:center" /></a> </p>

# Description
Multiplayer Tic-Tac-Toe game

# Features
Multiplayer TicTacToe Game
A completely Responsive Multiplayer TicTacToe Game- Works on Android, iOS, Web & Desktop!
 - Create/Join Room
 - Play Realtime
 - Display Points
 - Round & Game Winner
 - Responsive Glow Themed UI
 - Cross Platform Game

# Tech Used
 ![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white) ![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB) ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white) ![Socket.io](https://img.shields.io/badge/Socket.io-black?style=for-the-badge&logo=socket.io&badgeColor=010101) ![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)

## Installation
After cloning this repository, migrate to ```flutter-multiplayer-tictactoe``` folder.

Install dependencies (Client Side)
```bash
flutter pub get
```

Install dependencies (Server Side)

```bash
cd server && npm install
```

Start the server

```bash
npm run dev
```

Configure for MacOS:
Head to macos/Runner and make sure the following keys are present in DebugProfile.entitlements and Release.entitlements
```bash
<key>com.apple.security.network.server</key>
<true/>
<key>com.apple.security.network.client</key>
<true/>
```

Run App
```bash
flutter run // After selecting the device you want to test on
```