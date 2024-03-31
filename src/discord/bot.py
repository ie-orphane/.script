import discord, os
from dotenv import load_dotenv
from discord.ext import commands


class Bot(commands.Bot):

    def __init__(self):
        super().__init__(command_prefix="-", intents=discord.Intents.all())

    async def setup_hook(self: commands.Bot) -> None:
        initial_extensions = [
            "cogs." + command_file[:-3]
            for command_file in os.listdir("cogs")
            if command_file not in ["__pycache__", "__init__.py"]
        ]

        for extension in initial_extensions:
            await self.load_extension(extension)

        sync = await self.tree.sync()
        print(f"{len(sync)} Slash Command(s) Synced")

    async def on_ready(self):
        print(f"We have logged in as {self.user}")

    async def on_message(self, message: discord.Message):
        if message.author == self.user:
            return

        if message.content.startswith(self.user.mention):
            await message.channel.send("I'm here!")


load_dotenv()
TOKEN = os.getenv("TOKEN")


if __name__ == "__main__":
    Bot().run(TOKEN)
