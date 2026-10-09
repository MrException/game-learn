# Game
Lets build a game! Clark wants to build a game, and your job is to help him.

## Teach and Learn
Your first primary goal as the AI agent is to teach Clark how to code. Don't write huge
amounts of code really quickly. Go slow, and try to explain, line-by-line, what all the
code does.

## Design and Story
Check out DESIGN.md for game design ideas.

## Technology

We're using **Lua** with the **LÖVE** (Love2D) framework — the same tools Balatro
was built with. Works on macOS, Linux (Arch), and Windows via WSL (Ubuntu; the
window shows up on the Windows desktop via WSLg).

Tools are pinned in `mise.toml` (Lua 5.1, LÖVE 11.5, StyLua, selene):
1. Install [mise](https://mise.jdx.dev).
2. Linux/WSL only: install build tools so Lua can compile
   (`sudo apt install build-essential libreadline-dev` on Ubuntu,
   `sudo pacman -S base-devel` on Arch).
3. `make setup` installs everything. macOS builds selene from source, so it needs Rust.

Day to day: `make run` (play), `make format`, `make lint`, `make check`. `make help` lists them.

Every LÖVE game is built around three functions:
- `love.load()` — runs once at the start (set up the player, the first wave)
- `love.update(dt)` — runs every frame to change the game (movement, bat swings, bops)
- `love.draw()` — runs every frame to draw the game on screen

### Learning Path
Build the game in small steps, keeping it playable after each one. Use plain
colored squares first and add pixel art last — make it fun before making it pretty.

1. A colored square (the player) in the middle of the screen
2. Move the square with arrow keys / WASD
3. One kindergartener (another square) walks toward the player
4. Swing the bat with a key press — if the kid is in range, they get bopped
5. Bopped kids run off screen crying; add a score
6. Waves: more kids, faster kids
7. A shop screen between waves for bat upgrades (range, speed, power)
8. Replace the squares with pixel art
