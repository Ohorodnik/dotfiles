-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
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
        graphql = {
          -- if installed via npm: `npm install -g @graphql/eslint-plugin-graphql graphql-language-service-cli`
          cmd = { "graphql-lsp", "server", "--method", "stream" },
          filetypes = { "graphql", "gql" },
          root_dir = require("lspconfig.util").root_pattern(".graphqlrc.yaml"),
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
}
