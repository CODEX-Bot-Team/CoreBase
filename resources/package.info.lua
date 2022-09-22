-- See https://github.com/Dot-lua/TypeWriter/wiki/package.info.lua-format for more info

return { InfoVersion = 1, -- Dont touch this

    ID = "CoreBase", -- A unique id 
    Name = "CoreBase",
    Description = "",
    Version = "1.0.0",

    Author = {
        Developers = {
            "CoreByte"
        },
        Contributors = {}
    },

    Dependencies = {
        Luvit = {
            "SinisterRectus/sqlite3"
        },
        Git = {},
        Dua = {}
    },

    Contact = {
        Website = "",
        Source = "",
        Socials = {}
    },

    Entrypoints = {
        Main = "ga.CoreByte.CoreBase.Test"
        -- CubyPackage = "some.other.entry.caused.by.another.package", -- a package can call another packages entrypoints
    }

}
