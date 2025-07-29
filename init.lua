-- Neovim configuration entry point
-- This file loads all the core configuration modules

-- Load core vim options and settings
require("options")
require("lua-options")
require("neovide-options")

-- Load plugins and their configurations
require("plugins")

-- Load theme configuration
require("theme")

-- Load terminal-specific configurations
require("kitty-configs")

-- Load custom commands and file type configurations
require("default-commands")
require("filetype")
