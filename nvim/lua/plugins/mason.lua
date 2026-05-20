return {
    "mason-org/mason.nvim",
    opts = {
        ensure_installed = { "stylua" },
    },
    keys = {
        { "<Leader>m", "<Cmd>Mason<CR>", desc = "Mason" },
    },
}
