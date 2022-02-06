-- See https://github.com/Dot-lua/TypeWriter/wiki/package.info.lua-format for more info

return {

    InfoVersion = 1,

    ID = "duabase",
    Version = "1.0.0",

    Name = "duabase",
    Description = "A Dua template",

    Author = {
        Developers = {
            "CoreByte"
        },
        Contributors = {}
    },

    Dependencies = {
        Luvit = {
            "creationix/coro-fs",
            "luvit/path",
            "luvit/json"
        },
        Dua = {}
    },

    Contact = {
        Website = "https://codex-bot.ga", -- Homepage
        Source = "", -- Github repro
        Socials = {}
    },

    Entrypoints = {
        Main = "ga.codex.Duabase.Test"
    }

}
