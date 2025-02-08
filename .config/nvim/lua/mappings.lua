require "nvchad.mappings"

vim.opt_local.conceallevel = 2
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

map("n", "<leader>a", function() harpoon:list():add() end, { desc = "harpoon add"})
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map("n", "<C-h>", function() harpoon:list():select(1) end)
map("n", "<C-j>", function() harpoon:list():select(2) end)
map("n", "<C-k>", function() harpoon:list():select(3) end)
map("n", "<C-l>", function() harpoon:list():select(4) end)
-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() harpoon:list():prev() end)
map("n", "<C-S-N>", function() harpoon:list():next() end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--
map("n", "<leader>ga", ":Git add %:p<CR><CR>", {desc = "add"})
map("n", "<leader>gc", ":Git commit -v -q<CR>", {desc = "commit"})
map("n", "<leader>gp", ":Git push -v -q<CR>", {desc = "push"})

-- difference between current file and index
map("n", "<leader>gd", ":Gdiff :0", {desc = "diff"})



function CreateNewObsidianNote()
  -- Ensure obsidian.nvim is loaded
  local obsidian_ok, obsidian = pcall(require, "obsidian")
  
  if not obsidian_ok then
    print("Error: obsidian.nvim not loaded.")
    return
  end

  -- Get the current date in the format yyyymmdd
  local date_str = os.date("%Y%m%d")
  
  -- Prompt for the note title
  local note_title = vim.fn.input("Enter note title: ")

  -- If the user presses Enter without typing anything, use a default title
  if note_title == "" then
    note_title = "Untitled"
  end

  -- Generate the full filename: yyyymmdd-title.md
  local filename = string.format("%s-%s.md", date_str, note_title)

  -- Check if the ObsidianNew command exists
  if vim.fn.exists(":ObsidianNew") == 2 then
    -- Run the :ObsidianNew command with the user-defined note title
    vim.cmd("ObsidianNew " .. filename)
  else
    print("Error: ObsidianNew command not available.")
  end
end


map('n', '<leader>on', ':lua CreateNewObsidianNote()<CR>', {desc = "new note"})

-- " fugitive git bindings
-- nnoremap <space>ga :Git add %:p<CR><CR>
-- nnoremap <space>gs :Gstatus<CR>
-- nnoremap <space>gc :Gcommit -v -q<CR>
-- nnoremap <space>gt :Gcommit -v -q %:p<CR>
-- nnoremap <space>gd :Gdiff<CR>
-- nnoremap <space>ge :Gedit<CR>
-- nnoremap <space>gr :Gread<CR>
-- nnoremap <space>gw :Gwrite<CR><CR>
-- nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
-- nnoremap <space>gp :Ggrep<Space>
-- nnoremap <space>gm :Gmove<Space>
-- nnoremap <space>gb :Git branch<Space>
-- nnoremap <space>go :Git checkout<Space>
-- nnoremap <space>gps :Dispatch! git push<CR>
-- nnoremap <space>gpl :Dispatch! git pull<CR>
