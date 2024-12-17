local M = {
  "tpope/vim-fugitive",
  lazy = false,
}

function M.config()
  local status_ok, fugitive = pcall(require, "vim-fugitive")
  if not status_ok then
    return
  end
  fugitive.setup {}
end

return M
