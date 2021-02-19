<div>
    <p align="center">
        <a href="https://www.hydractify.org">
            <img src="https://www.hydractify.org/logo.png" height="250px" />
        </a>
    </p>
    <p align="center">
        <a href="https://www.hydractify.org/discord">
            <img src="https://img.shields.io/discord/298969150133370880.svg?style=flat-square&logo=discord">
        </a>
        <a href="https://www.hydractify.org/patreon">
            <img src="https://img.shields.io/badge/Patreon-support!-fa6956.svg?style=flat-square&logo=patreon" />
        </a>
        <a href="https://twitter.com/hydractify">
            <img src="https://img.shields.io/twitter/follow/hydractify.svg?style=social&logo=twitter">
        </a>
        <br />
        <a href="https://github.com/Hydractify/otservbr-global/issues">
            <img src="https://img.shields.io/github/issues/Hydractify/otservbr-global.svg?style=flat-square">
        </a>
        <a href="https://github.com/Hydractify/otservbr-global/graphs/contributors">
            <img src="https://img.shields.io/github/contributors/Hydractify/otservbr-global.svg?style=flat-square">
        </a>
        <a href="https://github.com/Hydractify/kanna_kobayashi/blob/stable/LICENSE">
            <img src="https://img.shields.io/github/license/Hydractify/otservbr-global.svg?style=flat-square">
        </a>
    </p>
</div>

# otservbr-global
Repository for maintaing our custom open tibia server using otservbr-global.

## Getting started

This server has been tested/used in [Linux], we cannot guarantee it will work in [MacOS] or [Windows], however, it might.

### Compiling

The steps to compile the server can be found here: https://github.com/otland/forgottenserver/wiki/Compiling

### MySQL

After you built `otbr`, you can proceed to work with `MySql`. You can use whatever user and database name you want, our recommendation is to have `forgottenserver`.

After you set up the user and granted permission to the database, you can run the `schema.sql` located in the root of the project. Here is a handy way to do it in [Linux]: `sudo mysql -u root -p forgottenserver < ./schema.sql`

### Configuration

Copy the `config.lua.dist` and name it `config.lua`, there you want to change the `mysqlUser` to whatever you named the MySql user, `mysqlPass` for it's password (if there is any) and change `mysqlDatabase` to whatever you named the database.

You also want to make sure that you have decompressed the `world.zip` file that comes inside `data/world`, otherwise the server will not find a map.

Once you are done with that, all you have to do is run the `otbr` that you compiled! Have fun. :)

### Documentation

Use this link as reference for everything related to the open tibia server:

- [forgottenserver]
- [otservbr]

## Differences to the upstream repository

- ~~Discord webhook messages~~ [#2322](https://github.com/opentibiabr/otservbr-global/pull/2322);
- Integration with [Discord]
  - Ability to link your account using our fork of [MyAAC] and using our [template];
  - Grant users tibia coins based on activity, ability to check those coins and gamble them;
    - https://github.com/Hydractify/guardian_of_tales
- Exp stages more close to global (2x until level 25, 1.5x until level 50, 1x for 51+);
- Spell shop added to all NPCs who teach spells, making it a step closer to vanilla.

<!-- LINKS -->

<!-- MISC -->
[linux]: https://www.linux.org/
[macos]: https://www.apple.com/macos
[windows]: https://www.microsoft.com/en-us/windows
[discord]: https://discord.com/

<!-- DOC -->
[forgottenserver]: https://github.com/otland/forgottenserver/wiki
[otservbr]: https://github.com/opentibiabr/otservbr-global/wiki

<!-- DIFF -->
[myaac]: https://github.com/Hydractify/myaac
[template]: https://github.com/Hydractify/lego
