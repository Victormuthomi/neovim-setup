vim.g.mapleader = " "

local keymap = vim.keymap.set   -- this is the safest way

-- exit insert mode
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- split windows
keymap("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Horizontal split" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equal splits" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- tabs
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Tab from current buffer" })

-- yank
keymap("n", "<leader>yy", "yy", { desc = "Yank line" })
keymap("v", "<leader>y", "y", { desc = "Yank selection" })

-- delete
keymap("n", "<leader>dd", "dd", { desc = "Delete line" })
keymap("v", "<leader>d", "d", { desc = "Delete selection" })

-- paste
keymap("n", "<leader>p", "p", { desc = "Paste after" })
keymap("n", "<leader>P", "P", { desc = "Paste before" })
keymap("v", "<leader>p", "p", { desc = "Paste over selection" })

