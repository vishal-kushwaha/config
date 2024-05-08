-- hurl config
local helpers = require("null-ls.helpers")
local FORMATTING = require("null-ls.methods").internal.FORMATTING
require("null-ls").register({
    --your custom sources go here
    helpers.make_builtin({
        name = "hurlfmt",
        meta = {
            url = "https://github.com/Orange-OpenSource/hurl/tree/master/packages/hurlfmt",
            description =
            "The hurlfmt crate provides the hurlfmt binary. It can format hurl files and to export them to JSON/HTML."
        },
        method = FORMATTING,
        filetypes = { "hurl" },
        generator_opts = {
            command = "hurlfmt",
            args = {},       -- put any required arguments in this table
            to_stdin = true, -- instructs the command to ingest the file from STDIN (i.e. run the currently open buffer through the linter/formatter)
        },
        factory = helpers.formatter_factory,
    })
})
