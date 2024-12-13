require("elbromasmc.remap")

local options = {
    number = true,
    relativenumber = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    colorcolumn = "80",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

