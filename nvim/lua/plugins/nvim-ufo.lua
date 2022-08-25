O.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
O.foldcolumn = "1"
O.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
O.foldlevelstart = 99
O.foldenable = true

-- Using ufo provider need remap `zR` and `zM`.
Map("n", "zR", require("ufo").openAllFolds)
Map("n", "zM", require("ufo").closeAllFolds)

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

-- global handler
require "ufo".setup {
    fold_virt_text_handler = handler,
    provider_selector = function(bufnr, filetype, buftype)
        return {"treesitter", "indent"}
    end
}
