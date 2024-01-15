mason = require("mason")

mason.setup({

  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    -- download_url_template = "https://hub.fastgit.xyz/%s/releases/download/%s/%s",
    -- download_url_template = "https://hub.gitfast.tk/%s/releases/download/%s/%s",
  },
})

require("mason-tool-installer").setup({

  -- a list of all tools you want to ensure are installed upon
  -- start
  ensure_installed = {

    -- you can pin a tool to a particular version
    -- { 'golangci-lint', version = 'v1.47.0' },

    -- you can turn off/on auto_update per tool
    -- { 'bash-language-server', auto_update = true },

    'stylua',
    'clang-format',
    'cpplint',
    'eslint_d',
  },

  -- if set to true this will check each tool for updates. if updates
  -- are available the tool will be updated. this setting does not
  -- affect :masontoolsupdate or :masontoolsinstall.
  -- default: false
  auto_update = false,

  -- automatically install / update on startup. if set to false nothing
  -- will happen on startup. you can use :masontoolsinstall or
  -- :masontoolsupdate to install tools and check for updates.
  -- default: true
  run_on_start = true,

  -- set a delay (in ms) before the installation starts. This is only
  -- effective if run_on_start is set to true.
  -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
  -- Default: 0
  start_delay = 3000, -- 3 second delay

  -- Only attempt to install if 'debounce_hours' number of hours has
  -- elapsed since the last time Neovim was started. This stores a
  -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
  -- This is only relevant when you are using 'run_on_start'. It has no
  -- effect when running manually via ':MasonToolsInstall' etc....
  -- Default: nil
  debounce_hours = 5, -- at least 5 hours between attempts to install/update
})
