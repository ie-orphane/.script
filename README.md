# .script

## installation

```bash
cd ~/
git clone https://github.com/ie-orphane/.script.git
echo "export PATH=\"~/.script/commands:\$PATH\"" >> ~/.bash_profile
source ~/.bash_profile
```

## discord.py

| command               | descritpion                                         |    arguments    |
| --------------------- | --------------------------------------------------- | :-------------: |
| `discord new`         | create new discord.py project                       | name (optional) |
| `discord install`     | install a dependency and add it to requirements.txt |                 |
| `discord run`         | run the bot                                         |                 |
| `discord init`        | copy the .env.example to .env if not existed        |                 |
| `discord -c\|--cog`   | create new cog/slash command                        |      name       |
| `discord -t\|--task`  | create new task                                     |      name       |
| `discord -m\|--model` | create new database model                           |      name       |

## react native / expo

| command            | descritpion                         |    arguments    |
| ------------------ | ----------------------------------- | :-------------: |
| `expo new`         | create new expo app with nativewind | name (optional) |
| `expo -s\--screen` | create new screen component         |      name       |
