import discord
from discord.ext import commands


class _Name_(commands.Cog):
    @discord.app_commands.command(name="_name_", description="_name_")
    async def _name__command(self, interaction: discord.Interaction):
        await interaction.response.send_message("_name_")


async def setup(bot: commands.Bot):
    await bot.add_cog(_Name_(bot))
