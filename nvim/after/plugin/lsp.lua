local lsp = require('lsp-zero')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['C-p'] = cmp.mapping.select_prev_item(cmp_select),
	['C-n'] = cmp.mapping.select_next_item(cmp_select),
	['C-y'] = cmp.mapping.confirm({ select = true }),
	['C-Space'] = cmp.mapping.complete(),
})

cmp.setup({
    mapping = cmp_mappings,
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 3},
        { name = 'nvim_lsp_signature_help'},
        { name = 'nvim_lua', keyword_length = 2},
        { name = 'buffer', keyword_length = 2},
        { name = 'vsnip', keyword_length = 2},
        { name = 'calc'},
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon ={
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    }
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnrm, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagonstic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagonstic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagonstic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
  require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {
	'tsserver',
	'eslint',
	'lua_ls',
    'rust_analyzer',
	},
    handlers = {
      lsp.default_setup,
    },
  })


lsp.setup()
