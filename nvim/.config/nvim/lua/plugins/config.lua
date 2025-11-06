-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      autoformat = false,
      servers = {
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },
        yamlls = {
          -- lazy-load schemastore when needed
          before_init = function(_, new_config)
            new_config.settings.yaml.schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["./script/schema/aws-spec.schema.json"] = "**/nix2/**/aws.yaml",
              ["./script/schema/component-spec.schema.json"] = "**/nix2/**/component.yaml",
              ["./script/schema/dynamodb-action.schema.json"] = "**/nix2/**/action/*/*.yaml",
              ["./script/schema/formats-spec.schema.json"] = "**/nix2/**/formats.yaml",
              ["./script/schema/json-schema_draft-07.schema.json"] = "**/nix2/**/*.schema.yaml",
              ["https://raw.githubusercontent.com/jesseduffield/lazygit/master/schema/config.json"] = "*/lazygit/config.yml",
            }
          end,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        fish = { "fish" },
        -- Use the "*" filetype to run linters on all filetypes.
        -- ['*'] = { 'global linter' },
        -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
        -- ['_'] = { 'fallback linter' },
        ["*"] = { "cspell" },
      },
      -- LazyVim extension to easily override linter options
      -- or add custom linters.
      ---@type table<string,table>
    },
  },

  {
    "snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- for hidden files
            ignored = true, -- for .gitignore files
          },
        },
      },
    },
  },
}
